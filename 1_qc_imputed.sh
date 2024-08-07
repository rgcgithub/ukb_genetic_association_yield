#!/usr/bin/env bash

set -eux
imputed_file=$1
sample_file=$2
out_file=$3

plink2 \
--pgen ${imputed_file}.pgen \
--pvar ${imputed_file}.pvar \
--psam ${imputed_file}.psam \
--keep ${sample_file} \
--mac 1 \
--geno 0.1 \
--chr 1-23 \
--output-chr 26 \
--set-all-var-ids @:#:'$r':'$a' \
--new-id-max-allele-len 10000 \
--hwe 1e-15 keep-fewhet \
--mach-r2-filter 0.3 \
--make-pgen \
--out ${out_file}