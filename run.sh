#!/usr/bin/env bash

set -e

# CONFIGURATION DETAILS
#CONTAINER_ID=`head -1 /proc/self/cgroup | cut -d/ -f3`
VERSION="0.1"
#RESOURCE="XXX"

# INPUTS
#echo -e "CAT$CAT_VERSION $CAT_REVISION Denoise (version ${VERSION}:${REPO_VERSION:0:8})\n"
echo -e "CAT$CAT_VERSION $CAT_REVISION Denoise (version ${VERSION})\n"
if [[ $# -ne 2 ]]
  then
    echo "Usage: $(basename $0) INPUT_DIR OUTDIR_DIR"
    exit 1
fi

IN_DIR="$1"
OUT_DIR="$2"

# INITIAL ASSERTIONS
if [[ ! -d ${IN_DIR} ]]; then
    echo "[info] Directory not found ${IN_DIR}"
    exit 1
fi
if [[ ! -d ${OUT_DIR} ]]; then
    echo "[info] Directory not found ${OUT_DIR}"
    exit 1
fi
#if [[ ! -d ${LOG_DIR} ]]; then
#    echo "[info] Directory not found: ${LOG_DIR}"
#    mkdir -pv ${LOG_DIR}
#fi

# EXECUTION STEPS
NII_FILE=$(find ${IN_DIR} -type f -iname "*.nii" -o -iname "*.nii.gz" | head -n 1)
if [[ -z ${NII_FILE} ]]; then
    echo "[error] No valid NIFTI imaging files found in "${IN_DIR}
    exit 1
fi

NII_FILE_BASENAME=$(basename "$NII_FILE")
NII_FILE_ROOT=${NII_FILE_BASENAME%%.*}
NII_FILE_EXT=${NII_FILE_BASENAME#*.}

if [[ ${NII_FILE_BASENAME} == *.nii.gz ]]; then
    gzip -d ${NII_FILE}
    NII_FILE="${NII_FILE::-3}"
fi

CMD="cat_standalone.sh -b /root/scripts/cat_denoise.m ${NII_FILE}"
echo "[info] "${CMD}
eval ${CMD}

CMD="cat_standalone.sh -b `pwd`/scripts/cat_merge.m /tmp/sanlm_*.nii"
echo "[info] "${CMD}
eval ${CMD}

if [[ ${NII_FILE_BASENAME} == *.nii.gz ]]; then
    gzip /tmp/denoised.nii
fi

mv /tmp/denoised.${NII_FILE_EXT} ${OUT_DIR}/${NII_FILE_ROOT}_dn.${NII_FILE_EXT}
echo "[info] Denoised file created: ${OUT_DIR}/${NII_FILE_ROOT}_dn.${NII_FILE_EXT}"

# Clean-up
rm -rf /tmp/*
