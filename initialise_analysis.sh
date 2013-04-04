#!/bin/bash 


mkdir bin
mkdir data
mkdir doc
mkdir results
mkdir src
mkdir resources
touch README.txt

# write out sample linkme.sh
linkme=`cat <<"EOF"
#!/bin/sh

#module load kevyin/gnu/parallel/20121122
#module load cloudbiolinux/default

if [ -z "$1" ]
then
    echo "usage linkme.sh <base directory>"
    exit 1
fi

base_dir=$1
mkdir -p $base_dir
cd $base_dir

# gatk
#resources=${base_dir}/resources
#mkdir $resources
#cd $resources
#ln -Ts /share/ClusterShare/software/contrib/kevyin/gatk/2.2-8/gatk_queue/resources/ gatk_queue_resources
#ln -Ts /share/ClusterShare/software/contrib/kevyin/gatk/2.2-8/gatk/resources/ gatk_resources
#ln -Ts ~/dev/gatk-public/gatk/public/scala/qscript/org/broadinstitute/sting/queue/qscripts/ gatk_repo_qscripts

#gatk_bundle_hg19=${resources}/gatk_bundle_hg19
#mkdir $gatk_bundle_hg19
#cd $gatk_bundle_hg19
#find /share/ClusterShare/biodata/contrib/gatk-resource-bundle/2.2/hg19/* | parallel "ln -s {} {/}"
#qsub -V -cwd -b y bwa index ucsc.hg19.fasta

EOF`


echo "$linkme" > linkme.sh
