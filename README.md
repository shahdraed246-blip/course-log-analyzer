# ENCS3130 Linux Laboratory  
# Shell Scripting Project – Online Course Log Analyzer
# Student1: Shahd Raed Shwekeyeh -1222105 sec#1
# Student2: Ghada Sawalha -1220064 sec#1

# Overview:
This project implements a{menu-based shell script} that analyzes online course log files generated from platforms such as Zoom and Microsoft Teams.
The script helps instructors and administrators monitor student attendance, lateness, and session usage. 
#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#features (Menu Options)
1. Number of sessions per course
2. Average attendance per course
3. List of absent students per course 
4. List of late arrivals per session
5. List of students leaving early 
6. Average attendance time per student per course
7. Average number of attendances per instructor 
8. Most frequently used tool (Zoom/Teams)
9. Exit


#Project Structure
                                   project1
                                          |                       
                                           regs--->>(ENCS101.csv,CS101.csv,CS102.csv)
                                          | 
                                           menu.sh , option1.sh...option7.sh,logfile.csv,README.md

#////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#Code Usage
Ex:
Run ./menu.sh to display the menu.  
Select option 2 and enter CourseID to calculate average attendance for that course.
or select option 9 to exit 
| Script     | Description                                                               | Input Required                                                    |
| ---------- | --------------------------------------------------------------------------| ----------------------------------------------------------------- |
| option1.sh | Calculates the number of sessions conducted for a given course.           | CourseID                                                          |
| option2.sh | Computes average attendance per course.                                   | CourseID                                                          |
| option3.sh | Lists students registered but absent for a course.                        | CourseID                                                          |
| option4.sh | Lists students who arrived late for a specific session.                   | CourseID, SessionID, X (late threshold in minutes)                |
| option5.sh | Lists students who left early for a specific session.                     | CourseID, SessionID, Y (early leaving threshold in minutes)       |
| option6.sh | Calculates average attendance time per student for a course.              | CourseID                                                          |
| option7.sh | Computes average number of attendances per instructor across all courses. | None                                                              |
| option8.sh | Determines the most frequently used platform (Zoom or Teams).             | None                                                              |
| option9    | Exit                                                                      | None                                                              |

# Execution instructions
1. open terminal 
2. open directory project1
3. make all files executable using chmod
4. run this command  ./main.sh
5. enter your option you can use the table to choose your option
6. Follow the on-screen instructions:
 Enter CourseID for course-specific options (1, 2, 3, 6).
 Enter SessionID and X/Y minutes for session-specific options (4 and 5).
 Select option 9 to exit the program.
#/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#Test Cases:
------------- logfile.csv content ---------------------------
Zoom,1001,Ali,Ahmed,I200,ENCS101,2025-05-01 09:00,90,S1, 09:05, 10:30
Zoom,1002,Sara,Omar,I200,ENCS101,2025-05-01 09:00,90,S1, 09:00, 10:35
Teams,1003,Mohammed,Hassan,I201,CS102,2025-05-01 11:00,60,S1, 11:02, 11:55
Teams,1004,Lina,Khalid,I201,CS102,2025-05-01 11:00,60,S1, 11:10, 11:45
Zoom,1001,Ali,Ahmed,I200,CS101,2025-05-03 09:00,90,S2,09:00,10:20
Zoom,1002,Sara,Omar,I200,CS101,2025-05-03 09:00,90,S2, 09:08, 10:30

 .\menu.sh
---Main Menu---
1.Number of sessions per course
2.Average attendence per course
3.List of absent students per course
4.List of late arrivals per session
5.List of students leaving early
6.Average attendance time per student per course
7.Average Number of attendances per instructor
8.Most frequently used tool
9.Exit
------------ option 1: ----------------------------------------------------------------------------

Enter The Operation
1
Enter CourseID:
CS102
Number of sessions for 'CS102' is: 1

Teams,1003,Mohammed,Hassan,I201,CS102,2025-05-01 11:00,60,S1, 11:02, 11:55
Teams,1004,Lina,Khalid,I201,CS102,2025-05-01 11:00,60,S1, 11:10, 11:45
>>> just one session

---------- option 2 : ------------------------------------------------------------------------------

Enter The Operation
2
Enter CourseID:
CS101
Average attendance for CS101 = 2.00

Zoom,1001,Ali,Ahmed,I200,CS101,2025-05-03 09:00,90,S2,09:00,10:20
Zoom,1002,Sara,Omar,I200,CS101,2025-05-03 09:00,90,S2, 09:08, 10:30
>>>> 2(2 students per session )/1(one session)

---------- option 3: ---------------------------------------------------------------------------------

Enter The Operation
3
Enter Course ID :
ENCS101
The students who did not attend for course ENCS101:
 - 1003 (Ghada Sawallha)
** ENCS101.csv content **
1001,Ali,Ahmed
1002,Sara,Omar
1003,Ghada,Sawallha
**students who attended to sessions**
Zoom,1001,Ali,Ahmed,I200,ENCS101,2025-05-01 09:00,90,S1, 09:05, 10:30
Zoom,1002,Sara,Omar,I200,ENCS101,2025-05-01 09:00,90,S1, 09:00, 10:35
>>> Sara & Ali>> Ghada did not attend  

---------- option 4: -----------------------------------------------------------------------------------

Enter The Operation
4
Enter Course id
ENCS101
Enter Session id
S1
Enter Delay (X minutes):
5
Ali Ahmed ID=1001 late for (5 min)

Zoom,1001,Ali,Ahmed,I200,ENCS101,2025-05-01 09:00,90,S1, 09:05, 10:30
Zoom,1002,Sara,Omar,I200,ENCS101,2025-05-01 09:00,90,S1, 09:00, 10:35
>>>> Ahmed (5 min late )

--------------- option 5: ----------------------------------------------------------------------------
Enter The Operation
5
Enter Course ID:
CS101
Enter Session ID:
s1
Enter Early threshold (Y minutes):
5
No such session found for course CS101 and session s1
Zoom,1001,Ali,Ahmed,I200,CS101,2025-05-03 09:00,90,S2,09:00,10:20
Zoom,1002,Sara,Omar,I200,CS101,2025-05-03 09:00,90,S2, 09:08, 10:30
>>>> there is no s1 just s2 
------------ option 6: ------------------------------------------------------------------------------------

Enter The Operation
6
Enter Course ID:
ENCS101
Average number of minutes each student attended in a given course:
Student with this ID:1001 85 minutes
Student with this ID:1002 95 minutes
>>> 1-- 9:05 - 10:30 (85 per session)
>>> 2-- 9:00 - 10:35 (95 per session)
------------ option 7: -----------------------------------------------------------------------------------


Enter The Operation
7
Average Number of attendences per instructur
I200 has 2.00 attendences per sessions
I201 has 2.00 attendences per sessions
>>> I200 ---( 2 per session)
>>> I201 ---(4 per 2 sessions -->2per 1 session)

---------- option 8:------------------------------------------------------------------------------------

Enter The Operation
8
Zoom is the most frequently used tool
>>> 4 zoom( 2 sessions ) /// 2 Teams ( 1 session )

--------- option 9: ------------------------------------------------------------------------------------


Enter The Operation
9
Good Bye....!!
