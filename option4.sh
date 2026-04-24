#Option 4: List of Late arrivalsper session
#Checking if file exists
if [ !  -f logfile.csv ]
then
echo "File is not exist"
exit 1
fi
#Taking from user:
echo "Enter Course id"
read CourseID
echo "Enter Session id"
read SessionID
echo "Enter Delay (X minutes):"
read X
#Flags:
SessionFound=0
LateFlag=0
while read line
do
course=$(echo "$line" | cut -d',' -f6) #Getting Course ID(sixth value on the line) 
session=$(echo "$line" | cut -d',' -f9) #Getting Session ID(ninth value on the line)
if [ "$course" = "$CourseID" ] && [ "$session" = "$SessionID" ]
then
SessionFound=1
#Student Info
studentID=$(echo "$line" | cut -d',' -f2) 
firstName=$(echo "$line" | cut -d',' -f3)
lastName=$(echo "$line" | cut -d',' -f4)
startTime=$(echo "$line" | cut -d',' -f7 | cut -d' ' -f2) #Taking the time without date
joinTime=$(echo "$line" | cut -d',' -f10 | tr -d ' ')
#splitting times into hours and minutes
startHours=$(echo "$startTime" | cut -d':' -f1)
startMinutes=$(echo "$startTime" | cut -d':' -f2)
joinHours=$(echo "$joinTime" | cut -d':' -f1)
joinMinutes=$(echo "$joinTime" | cut -d':' -f2)
startTotal=$((10#$startHours*60+10#$startMinutes))
joinTotal=$((10#$joinHours*60+10#$joinMinutes))
timeDifference=$((joinTotal-startTotal))
if [ "$timeDifference" -ge "$X" ]
then
echo "$firstName $lastName ID=$studentID late for ($timeDifference min)"
LateFlag=1
fi
fi
done < logfile.csv
if [ "$SessionFound" -eq 0 ]
then
echo "Session not found!!"
elif [ "$LateFlag" -eq 0 ]
then
echo "There are no late Students"
fi
