#Average Number of attendences per instructur:
fileName="logfile.csv"
#Checking if file exists
if [ !  -f "$fileName" ]
then
echo "File is not exist"
exit 1
fi
#Extract instructor id from file (value in fifth field)
echo "Average Number of attendences per instructur"
cut -d',' -f5 "$fileName" | sort | uniq | while read inst
do
#Number of attendence students for the instructor
studentNum=$(grep "$inst" "$fileName" | wc -l)
#Number of sessions per instructur
sessionNum=$(grep "$inst" "$fileName" | cut -d',' -f9 | sort | uniq | wc -l)
if [ "$sessionNum" -eq 0 ]
then
avg=0
else
avg=$(echo "$studentNum/$sessionNum" | bc -l | cut -c1-4)
fi
echo "$inst has $avg attendences per sessions"
done
