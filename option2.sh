#Average attendance per course (option 2):
echo "Enter CourseID:"
read CourseID
# to check if file exist
if [ ! -f logfile.csv ]
then
  echo "File does not exist"
  exit 1
fi
# to find number of session per course
sessions_num=$(grep ",$CourseID," logfile.csv | cut -d',' -f9 | sort | uniq)

total=0
count=0
for s in $sessions_num
 do
    num_students=$(grep ",$CourseID,.*,$s" logfile.csv | wc -l)
    total=$((total + num_students))
    count=$((count + 1))
done

if [ $count -ne 0 ]
 then
    average=$(echo "scale=2; $total / $count" | bc)
    echo "Average attendance for $CourseID = $average "
else
    echo "No sessions found for course $CourseID"
fi


