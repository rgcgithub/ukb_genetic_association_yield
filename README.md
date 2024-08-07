This repository contains code to reproduce results from Gaynor, S.M. and Joseph, T., et al. (2023).
Yield of genetic association signals from genomes, exomes, and imputation in the UK biobank. bioRxiv, 2023-09.
<https://doi.org/10.1101/2023.09.13.23295479>.

### 1. QC scripts
Purpose: prepare genetic data for association analysis.
The scripts take as input: PLINK filesets for QC by platform (sequencing or imputed data), corresponding sample ID lists, and output file names. Processed PLINK file sets are output.

**Scripts and example execution:** \
  **1_qc_sequencing.sh**: ./1_qc_sequencing.sh path_to_seq_file_prefix path_to_sample_file output_file_prefix \  
  **1_qc_imputed.sh**: ./1_qc_imputed.sh path_to_imputed_file_prefix path_to_sample_file output_file_prefix

### 2-3. Association scripts
Purpose: run association analyses for each genetic dataset across traits.
The scripts take as input: PLINK file sets and additional association-specific parameters and files. Regenie Step 1 is run both QTs and BTs (2_step1_\*), followed by Step 2 for all traits and using single variant and gene-based approaches (3_step2_\*). Regenie association results are output.

**Scripts and example execution:** \
    **2_step1_qt.sh**: ./2_step1_qt.sh path_to_grm_pgen path_to_grm_pvar path_to_grm_psam phenotype path_to_phenotype_file \
    **2_step1_bt.sh**: ./2_step1_bt.sh path_to_grm_pgen path_to_grm_pvar path_to_grm_psam phenotype path_to_phenotype_file \    
    **3_step2_singlevariant_qt.sh**: ./3_step2_singlevariant_qt.sh path_to_step2_pgen chrom path_to_phenotype_file phenotype phenotype_chrom path_to_loco_predictions \
    **3_step2_singlevariant_bt.sh**: ./3_step2_singlevariant_bt.sh path_to_step2_pgen chrom path_to_phenotype_file phenotype phenotype_chrom path_to_loco_predictions \
    **3_step2_genebased_qt.sh**: ./3_step2_genebased_qt.sh path_to_step2_pgen path_to_phenotype_file phenotype path_to_aaf_bins path_to_mask_def path_to_annotations path_to_set_list max_AAF MAC_threshold path_to_genep_definition chrom phenotype_chrom path_to_loco_predictions MAC \
    **3_step2_genebased_bt.sh**: ./3_step2_genebased_bt.sh path_to_step2_pgen path_to_phenotype_file phenotype path_to_aaf_bins path_to_mask_def path_to_annotations path_to_set_list max_AAF MAC_threshold path_to_genep_definition chrom phenotype_chrom path_to_loco_predictions MAC \


### Contact
* Tyler Joseph: `tyler.joseph at regeneron dot com`
* Sheila Gaynor : `sheila.gaynor at regeneron dot com`
