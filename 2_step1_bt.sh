#!/usr/bin/env bash

set -eux
grm_pgen_file=$1
grm_pvar_file=$2
grm_psam_file=$3
pheno_name=$4
pheno_file=$5

plink2 \
--pgen ${grm_pgen_file} \
--pvar ${grm_pvar_file} \
--psam ${grm_psam_file} \
--mac 20 \
--write-snplist \
--out ${pheno_name}

gunzip -q -f ${grm_pvar_file}

regenie \
--step 1 \
--pgen ${grm_pgen_file%.pgen} \
--phenoFile ${pheno_file} \
--covarFile ${pheno_file} \
--phenoCol ${pheno_name} \
--bsize 1000 \
--out ${pheno_name} \
--bt \
--loocv \
--extract ${pheno_name}.snplist \
--print-prs \
--force-step1 \
--cc12 \
--gz