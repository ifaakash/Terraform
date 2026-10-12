#!/usr/bin/env bash
# Lists the VM sizes you can actually deploy in a region: sizes that are not
# restricted for the subscription AND whose family has enough free vCPU quota.
#
# Usage:   ./az-vm-check.sh <region> [vcpus] [max_mem_gb]
# Example: ./az-vm-check.sh australiasoutheast
#          ./az-vm-check.sh "South India" 2 4
#
# The individual commands, for running by hand:
#   Regional + per-family quota:
#     az vm list-usage --location <region> -o table
#   Families with non-zero quota (limit is a string, so compare with '0'):
#     az vm list-usage --location <region> -o table \
#       --query "[?limit!='0' && contains(name.value,'Family')].{Name:name.value, Used:currentValue, Limit:limit}"
#   Is one size restricted for this subscription:
#     az vm list-skus --location <region> --size <size> --all -o table
#   Region names:
#     az account list-locations --query "[?metadata.regionType=='Physical'].name" -o tsv

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <region> [vcpus=2] [max_mem_gb=8]" >&2
  exit 1
fi

region=$(echo "$1" | tr 'A-Z' 'a-z' | tr -d ' ')
vcpus=${2:-2}
max_mem=${3:-8}

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

echo "Region: $region | vCPUs: $vcpus | max memory: ${max_mem} GB"

# Regional vCPU total (applies on top of the per-family limit)
az vm list-usage --location "$region" \
  --query "[?name.value=='cores'] | [0].join('/', [to_string(currentValue), limit])" -o tsv \
  | sed 's/^/Regional vCPUs used\/limit: /'

# Families with non-zero quota: family, used, limit
az vm list-usage --location "$region" \
  --query "[?limit!='0' && contains(name.value,'Family')].[name.value, currentValue, limit]" \
  -o tsv > "$tmp/quota.tsv"

# Sizes with the requested vCPUs and no subscription restrictions: family, size, mem, arch, hyper-v gen
az vm list-skus --location "$region" --resource-type virtualMachines --all \
  --query "[?capabilities[?name=='vCPUs' && value=='$vcpus'] && length(restrictions)==\`0\`].[family, name, capabilities[?name=='MemoryGB'].value | [0], capabilities[?name=='CpuArchitectureType'].value | [0], capabilities[?name=='HyperVGenerations'].value | [0]]" \
  -o tsv > "$tmp/skus.tsv"

# Keep sizes whose family has at least $vcpus free
awk -F'\t' -v need="$vcpus" -v max="$max_mem" '
  NR==FNR { used[tolower($1)]=$2; lim[tolower($1)]=$3; next }
  { f=tolower($1) }
  (f in lim) && lim[f]-used[f] >= need && $3+0 <= max {
    print $2, $3, $4, $5, $1, used[f] "/" lim[f]
  }' "$tmp/quota.tsv" "$tmp/skus.tsv" | sort -k2,2n -k1,1 > "$tmp/matches.txt"

echo
if [ -s "$tmp/matches.txt" ]; then
  { echo "SIZE MEM_GB ARCH HYPERV_GEN FAMILY QUOTA_USED/LIMIT"; cat "$tmp/matches.txt"; } | column -t
else
  echo "No deployable ${vcpus} vCPU size (<= ${max_mem} GB) in $region."
  echo "Unrestricted sizes found: $(wc -l < "$tmp/skus.tsv" | tr -d ' ')"
  echo "Their families, all without free quota:"
  awk -F'\t' 'NR==FNR { q[tolower($1)]=1; next } !(tolower($1) in q) { print "  " $1 }' \
    "$tmp/quota.tsv" "$tmp/skus.tsv" | sort -u
fi
