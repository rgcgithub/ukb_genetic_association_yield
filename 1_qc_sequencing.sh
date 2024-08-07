#!/usr/bin/env bash

set -eux
seq_file=$1
sample_file=$2
out_file=$3

plink2 \
--bed ${seq_file}.bed \
--bim ${seq_file}.bim \
--fam ${seq_file}.fam \
--keep ${sample_file} \
--mac 1 \
--geno 0.1 \
--chr 1-23 \
--output-chr 26 \
--set-all-var-ids @:#:'$r':'$a' \
--new-id-max-allele-len 10000 \
--hwe 1e-15 keep-fewhet \
--make-pgen \
--not-chr Y \
--out ${out_file}