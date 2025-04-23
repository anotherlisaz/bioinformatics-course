#!/usr/bin/env bash
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR142/007/ERR14230607/ERR14230607.fastq.gz -o ERR14230607_Illumina_HiSeq_4000_sequencing.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR142/082/ERR14230582/ERR14230582.fastq.gz -o ERR14230582_Illumina_HiSeq_4000_sequencing.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR142/083/ERR14230583/ERR14230583.fastq.gz -o ERR14230583_Illumina_HiSeq_4000_sequencing.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR142/008/ERR14230608/ERR14230608.fastq.gz -o ERR14230608_Illumina_HiSeq_4000_sequencing.fastq.gz

fastqc ERR14230607_Illumina_HiSeq_4000_sequencing.fastq.gz ERR14230582_Illumina_HiSeq_4000_sequencing.fastq.gz -o 

fastqc ERR14230583_Illumina_HiSeq_4000_sequencing.fastq.gz ERR14230608_Illumina_HiSeq_4000_sequencing.fastq.gz -o

multiqc .
