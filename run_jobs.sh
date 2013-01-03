#!/bin/bash -l

module load cloudbiolinux/default
#module load acml/gfortran64_mp/4.4.0
#module load R/gcc-4.4.6/2.15.0
#module load python/gcc-4.4.6/2.6.6

# BOOTSTRAP SETUP
base_dir=/home/kevyin/dev/analysis/ccg/PG0002526-DNA

date_dir=`date +%G_%m%d_%H%M%S`
output_dir="${base_dir}/output/${date_dir}/"
mkdir -p $output_dir

echo "Output dir: $output_dir"

# util functions
function call_qsub {
    # Working dir is out dir
    _cores=$1
    _working_dir=$2 
    _log_prefix=$3
    _cmd=$4

    _queue="all.q"
    _std_out="${_working_dir}/${_log_prefix}.o\$JOB_ID"
    _err_out="${_working_dir}/${_log_prefix}.e\$JOB_ID"
    _qsub_cmd="qsub -q $_queue -V -j n -R y -pe smp $_cores -wd $_working_dir -o $_std_out -e $_err_out -b y ${_cmd}"
    echo $_qsub_cmd
    echo $_qsub_cmd > ${_working_dir}/${_log_prefix}_qsub_cmd
    $_qsub_cmd
}



#bowtie2_index=/share/ClusterShare/biodata/pwbc/genomes/Hsapiens/hg19/bowtie2/hg19
#bwa_index=/share/ClusterShare/biodata/galaxy_main/hg19/hg19full/bwa_index/hg19.fa
#unaligned_dir="${base_dir}/unaligned/PG0002526-DNA_fastq/"

#pe1=${unaligned_dir}/PG0002526-DNA_1.fastq
#pe2=${unaligned_dir}/PG0002526-DNA_2.fastq


#out="${base_dir}/aligned/PG0002526-DNA.sam"
#cores=20
#call_qsub $cores $output_dir bowtie2 "time bowtie2 -p $cores -q -L 32 -X 1000 -x $bowtie2_index -1 $pe1 -2 $pe2 -S $out"

#call_qsub $cores $output_dir bwa "time bwa aln -l 40 -n 4 -t $cores $bwa_index $pe1 > tmp1"
#call_qsub $cores $output_dir bwa "time bwa aln -l 40 -n 4 -t $cores $bwa_index $pe2 > tmp2"
