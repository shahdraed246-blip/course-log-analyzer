#Most Frequently used tool
#Checking if file exists
fileName="logfile.csv"
if [ !  -f "$fileName" ]
then
echo "File is not exist"
exit 1
fi
#count of zoom used:
zoomCount=$(cut -d',' -f1 "$fileName" | grep -i "zoom" |wc -l)
#count of teams used:
teamsCount=$(cut -d',' -f1 "$fileName" | grep -i "teams" |wc -l)
#comparing between them:
if [ "$zoomCount" -gt "$teamsCount" ]
then
echo "Zoom is the most frequently used tool"
elif [ "$zoomCount" -lt "$teamsCount" ]
then
echo "Teams is the most frequently used tool"
else
echo "Both tools used as each other"
fi
