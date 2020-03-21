python3 analyzeResults.py > out.csv
sed -i.old '1s;^;sim,time\n;' out.csv
rm out.csv.old
cat out.csv
