#!/bin/bash
# Option 5: List of students leaving early

# Input from user
echo "Enter Course ID:"
read CourseID
echo "Enter Session ID:"
read SessionID
echo "Enter Early threshold (Y minutes):"
read Y

# Check if logfile exists
if [ ! -f logfile.csv ]; then
  echo "Log file does not exist!"
  exit 1
fi

SessionFound=0
EarlyFlag=0
#to check logfile line by line 
while read line; do
  course=$(echo "$line" | cut -d',' -f6)
  session=$(echo "$line" | cut -d',' -f9)

  if [ "$course" = "$CourseID" ] && [ "$session" = "$SessionID" ]; then
    SessionFound=1

    studentID=$(echo "$line" | cut -d',' -f2)
    firstName=$(echo "$line" | cut -d',' -f3)
    lastName=$(echo "$line" | cut -d',' -f4)
    startTime=$(echo "$line" | cut -d',' -f7 | cut -d' ' -f2)  #ex:2025-05-03 09:00>>>> 09:00
    length=$(echo "$line" | cut -d',' -f8)
    leaveTime=$(echo "$line" | cut -d',' -f11 | tr -d ' ')

    startHours=$(echo "$startTime" | cut -d':' -f1)
    startMinutes=$(echo "$startTime" | cut -d':' -f2)
    startTotal=$((10#$startHours*60 + 10#$startMinutes)) #10 >> decimel 
    endTotal=$((startTotal + length)) #official time to leave

    leaveHours=$(echo "$leaveTime" | cut -d':' -f1)
    leaveMinutes=$(echo "$leaveTime" | cut -d':' -f2)
    leaveTotal=$((10#$leaveHours*60 + 10#$leaveMinutes)) #Actual Leave Time

    diff=$((endTotal - leaveTotal))

    if [ "$diff" -ge "$Y" ]; then
      echo "$firstName $lastName (ID=$studentID) left early by $diff minutes"
      EarlyFlag=1
    fi
  fi
done < logfile.csv

if [ $SessionFound -eq 0 ]; then
  echo "No such session found for course $CourseID and session $SessionID"
elif [ $EarlyFlag -eq 0 ]; then
  echo "No students left early for this session."
fi

