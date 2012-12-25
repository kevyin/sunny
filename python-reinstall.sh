cd $1
TMPFILE="_files.tmp"

python setup.py install --record $TMPFILE
cat $TMPFILE | parallel -j4 "rm -rf {}"
python setup.py install
