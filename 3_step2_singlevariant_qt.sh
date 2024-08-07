#!/usr/bin/env bash

set -eux
grm_pgen_file=$1
chr=$2
pheno_file=$3
pheno_name=$4
out_name=$5
loco_file=$6
  
  
regenie \
--step 2 \
--pgen ${grm_pgen_file%.pgen} \
--chr ${chr} \
--phenoFile ${pheno_file} \
--phenoCol ${pheno_name} \
--covarFile ${pheno_file} \
--out assoc.chr${chr} \
--htp ${out_name} \
--pred ${loco_file} \
--bsize 200 \
--pThresh 0.05 \
--minMAC 5 \
--cc12 \
--gz