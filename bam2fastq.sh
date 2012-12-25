BAM_FILE=$1
OUT_FILE1=$2
OUT_FILE2=$3

SAMTOFASTQ_JAR=/share/ClusterShare/software/contrib/kevyin/picard-tools/1.79/SamToFastq.jar

echo "BAM file: [$BAM_FILE]"

java -jar $SAMTOFASTQ_JAR INPUT=$BAM_FILE FASTQ=$OUT_FILE1 SECOND_END_FASTQ=$OUT_FILE2 NON_PF=true
