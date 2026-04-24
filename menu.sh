#------------------main Menu---------------------#
while true
do
echo "---Main Menu---"
echo "1.Number of sessions per course"
echo "2.Average attendence per course"
echo "3.List of absent students per course"
echo "4.List of late arrivals per session"
echo "5.List of students leaving early"
echo "6.Average attendance time per student per course"
echo "7.Average Number of attendances per instructor"
echo "8.Most frequently used tool"
echo "9.Exit"
#Choose your option
echo "Enter The Operation"
read opr
case "$opr"
in
1)./option1.sh;;
2)./option2.sh ;;
3)./option3.sh;;
4)./option4.sh;;
5)./option5.sh;;
6)./option6.sh;;
7)./option7.sh;;
8)./option8.sh;;
9)echo "Good Bye....!!"
exit 0;;
*)echo "Wrong choice! please try again!!!";;
esac
done
