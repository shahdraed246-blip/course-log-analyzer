#-----------------Number of sessions per course---------------#
echo "Enter CourseID:"
read CourseID
#Checking if file exists
if [ ! -f logfile.csv ]
then
echo "File is not exist"
exit 1
fi
#Find lines for the given course id
grep "$CourseID" logfile.csv > course.txt
#Extract only Sessions id
cut -d',' -f9 course.txt > sessions.txt
#Sorting to remove Duplicates
sort sessions.txt | uniq > uniq.txt
sum=$(cat uniq.txt | wc -l)
echo "Number of sessions for '$CourseID' is: $sum"
#Remove unused files
rm course.txt sessions.txt uniq.txt
