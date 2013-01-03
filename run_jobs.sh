#!/bin/bash -l

module load cloudbiolinux/default
#module load acml/gfortran64_mp/4.4.0
#module load R/gcc-4.4.6/2.15.0
#module load python/gcc-4.4.6/2.6.6

# SETUP
base_dir=
#program=/misc/PWBCAdminStore/app/galaxy/galaxy_dist/qa/tools/sr_mapping/bowtie_wrapper.py
export PYTHONPATH=${galaxy_utils_dir}:$PYTHONPATH

input_basename=`echo ${input_file##*/} | tr [.] [_]`
date_dir=`date +%G_%m%d_%H%M%S`

output_dir="${base_dir}/output/${input_basename}/${date_dir}/"
mkdir -p $output_dir

echo "Output dir: $output_dir"
    # stdout and sterr locations
    error_out=${output_dir}/${c}.e\$JOB_ID
    std_out=${output_dir}/${c}.o\$JOB_ID
    working_dir=${output_dir}/${c}/ 
    mkdir $working_dir

    cmd="qsub -q all.q -V -j n -R y -pe smp ${c} -wd $working_dir -o $std_out -e $error_out -b y "
    echo $cmd # WARNING will not work with > and < pipes in cmd
    $cmd
    

