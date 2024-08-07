#!/usr/bin/env bash

set -eux
grm_pgen_file=$1
pheno_file=$3
pheno_name=$4
aaf_bins=$5
mask_def_file=$6
anno_file=$7
set_list_file=$8
vc_max_aaf=$9
vc_mac_thresh=$10
genep_def_file=$11
index=$12
out_name=$13
loco_file=$14
mac=$15

regenie \
--step 2 \
--pgen ${grm_pgen_file%.pgen} \
--phenoFile ${pheno_file} \
--phenoCol ${pheno_name} \
--bt \
--approx \
--firth-se \
--firth \
--aaf-bins ${aaf_bins} \
--mask-def ${mask_def_file} \
--anno-file ${anno_file} \
--set-list ${set_list_file} \
--build-mask max \
--vc-maxAAF 0.01 \
--vc-MACthr ${vc_mac_thresh} \
--joint acat \
--rgc-gene-def ${genep_def_file} \
--covarFile ${pheno_file} \
--out assoc.${index} \
--htp ${out_name} \
--pred ${loco_file} \
--bsize 200 \
--pThresh 0.05 \
--minMAC ${mac} \
--cc12 \
--seed 1000 \
--gz