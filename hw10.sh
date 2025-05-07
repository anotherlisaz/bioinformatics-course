#!/bin/bash

#SBATCH --job-name=trimmomatic_job
#SBATCH --cpus-per-task=8
#SBATCH --mem=20gb
#SBATCH --time=0:30:00
#SBATCH --output=trimmomatic_%j.log
#SBATCH --constraint=hpc
#SBATCH --partition=short

cd ~/homeworks/hw10
source activate trimm

R1_IN="illumina_reads_R1_001.fastq"
R2_IN="illumina_reads_R2_001.fastq"
R1_PAIRED_OUT="R1_trimmed_paired.fastq"
R1_UNPAIRED_OUT="R1_trimmed_unpaired.fastq"
R2_PAIRED_OUT="R2_trimmed_paired.fastq"
R2_UNPAIRED_OUT="R2_trimmed_unpaired.fastq"

trimmomatic PE -threads 8 \
$R1_IN $R2_IN \
$R1_PAIRED_OUT $R1_UNPAIRED_OUT \
$R2_PAIRED_OUT $R2_UNPAIRED_OUT \
ILLUMINACLIP:adapters.fa:2:30:10:8:true \
LEADING:30 \
TRAILING:30 \
SLIDINGWINDOW:4:28 \
MINLEN:50 \
HEADCROP:1 \
CROP:180
