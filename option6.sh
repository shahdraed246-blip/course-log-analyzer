#Average Attendance time per student per course
fileName="logfile.csv"
#Checking if file exists
if [ !  -f "$fileName" ]
then
echo "File is not exist"
exit 1
fi
#Take course ID from the user
echo "Enter Course ID:"
read courseID
courseFlag=0

#temporary file to save filtered data
touch temp.txt
dir="./regs"
regFile="$dir/$courseID.csv"
if [ ! -f "$regFile" ]
then
echo "There is no Regestration file for this course"
exit 1
fi
while read line
do
course=$(echo "$line" | cut -d',' -f6)
if [ "$course" = "$courseID" ]
then
echo "$line" >> temp.txt
courseFlag=1
fi
done < "$fileName"
if [ "$courseFlag" -eq 0 ]
then
echo "There is no Records for this course"
rm temp.txt
exit 0
fi
echo "Average number of minutes each student attended in a given course:"
#Extract Student IDs from temp.txt
cut -d',' -f2 temp.txt | sort | uniq | while read sID
do
[ -z "$sID" ] && continue
if ! grep "^$sID," "$regFile" >/dev/null
then
echo "StudentId: $sID is not registered for this course"
continue
fi
sFN=$(grep "^$sID," "$regFile" | cut -d',' -f2)
sLN=$(grep "^$sID," "$regFile" | cut -d',' -f3)
totalMin=0
sessionCount=0
while read line
do
studentID=$(echo "$line" | cut -d',' -f2)
if [ "$studentID" = "$sID" ]
then
beginTime=$(echo "$line" | cut -d',' -f10 | tr -d ' ') #Begin Time(value in 10th field)
leaveTime=$(echo "$line" | cut -d',' -f11 | tr -d ' ') #Leave Time(value in 11th field)
#Extracting Hours and Minutes
beginHour=$(echo "$beginTime" | cut -d':' -f1)
beginMin=$(echo "$beginTime" | cut -d':' -f2)
leaveHour=$(echo "$leaveTime" | cut -d':' -f1)
leaveMin=$(echo "$leaveTime" | cut -d':' -f2)
beginToMin=$(( 10#$beginHour * 60 + 10#$beginMin ))
leaveToMin=$(( 10#$leaveHour * 60 + 10#$leaveMin ))
minutesAttended=$(( leaveToMin - beginToMin ))
#For Handling logic Error:
if [ "$minutesAttended" -lt 0 ]
then
minutesAttended=0
fi
totalMin=$(( totalMin + minutesAttended ))
sessionCount=$(( sessionCount + 1 ))
fi
done < temp.txt
if [ "$totalMin" -le 0 ] || [ "$sessionCount" -eq 0 ]
then
continue
fi
avg=$((totalMin/sessionCount))
echo "Student with this ID:$sID $avg minutes"
done
rm temp.txt #Remove the temporary file
