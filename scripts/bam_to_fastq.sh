#!/bin/sh

qsub -cwd -b y java -jar /share/ClusterShare/software/contrib/kevyin/picard-tools/1.79/SamToFastq.jar INPUT=./AppResult-NexteraRapidCaptureExpandedExome_HiSeq2500-NA12144/NA12144_S1.bam OUTPUT_PER_RG=true OUTPUT_DIR=./bam_to_fastq/ INCLUDE_NON_PF_READS=true INCLUDE_NON_PRIMARY_ALIGNMENTS=true

