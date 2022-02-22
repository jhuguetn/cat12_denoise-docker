#!/usr/bin/env bash

set -e

# CONFIGURATION DETAILS
#CONTAINER_ID=`head -1 /proc/self/cgroup | cut -d/ -f3`
VERSION="0.3"

# INPUTS
echo -e "CAT$CAT_VERSION $CAT_REVISION Denoise (version ${VERSION})\n"
if [[ $# -ne 2 ]]
  then
    echo "Usage: $(basename $0) INPUT_FILE OUTDIR_DIR"
    exit 1
fi

IN_FILE="$1"
OUT_DIR="$2"

# INITIAL ASSERTIONS
if [[ ! -f ${IN_FILE} ]]; then
    echo "[info] File not found ${IN_FILE}"
    exit 1
fi
if [[ ! -d ${OUT_DIR} ]]; then
    echo "[info] Directory not found ${OUT_DIR}"
    exit 1
fi

# EXECUTION STEPS
IN_FILE_BN=$(basename "$IN_FILE")
IN_FILE_ROOT=${IN_FILE_BN%%.*}
IN_FILE_EXT=${IN_FILE_BN#*.}

if [[ ${IN_FILE_BN} == *.nii.gz ]]; then
    gzip -d "${IN_FILE}"
    IN_FILE="${IN_FILE::-3}"
fi

CMD="cat_standalone.sh -b /root/scripts/cat_denoise.m ${IN_FILE}"
echo "[info] ${CMD}"
eval "${CMD}"

CMD="cat_standalone.sh -b /root/scripts/cat_merge.m /tmp/sanlm_*.nii"
echo "[info] ${CMD}"
eval "${CMD}"

if [[ ${IN_FILE_BN} == *.nii.gz ]]; then
    gzip "/tmp/denoised.nii"
fi

mv "/tmp/denoised.${IN_FILE_EXT}" "${OUT_DIR}/${IN_FILE_ROOT}_dn.${IN_FILE_EXT}"
echo "[info] Denoised file created: ${OUT_DIR}/${IN_FILE_ROOT}_dn.${IN_FILE_EXT}"

# Clean-up
rm -rf /tmp/*
