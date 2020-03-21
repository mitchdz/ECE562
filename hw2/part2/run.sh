mkdir -p out
python3 scripts/analyzeResults.py > out/out.csv
sed -i.old '1s;^;sim,time\n;' out/out.csv
rm out/out.csv.old
cat out/out.csv
