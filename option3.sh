#!/bin/bash
# List of absent students per course (option 3)

echo "Enter Course ID :"
read courseID

# Check if logfile exists
if [ ! -f logfile.csv ]; then
  echo "File does not exist !! "
  exit 1
fi

dir="./regs"
file="$dir/$courseID.csv"

# Check if registration file exists
if [ ! -f "$file" ]; then
  echo "Registration file does not exist !! "
  exit 1
fi

# Registered students (IDs)
stds=$(cut -d',' -f1 "$file")

# Students who attended
stds_attended=$(grep ",$courseID," logfile.csv | cut -d',' -f2 | sort | uniq)

echo "The students who did not attend for course $courseID: "

# Compare
for student in $stds; do
    if ! echo "$stds_attended" | grep -q "^$student$"; then
        stdname=$(grep "^$student," "$file" | cut -d',' -f2-3 | tr ',' ' ')
        printf " - %s (%s)\n" "$student" "$stdname"
    fi
done

