#!/bin/bash


module load kevyin/python/2.7.2
unset module

percs=(1 5 10 20)

for p in ${percs[@]}
do
    echo $p
    qsub -V -cwd -b y time python ~/dev/sunny/subsamp.py ../NA12144_S1_L001_R1_001.fastq:../NA12144_S1_L001_R2_001.fastq NA12144_S1_L001_001_${p}perc ${p}
    qsub -V -cwd -b y time python ~/dev/sunny/subsamp.py ../NA12144_S1_L002_R1_001.fastq:../NA12144_S1_L002_R2_001.fastq NA12144_S1_L002_001_${p}perc ${p}
done
