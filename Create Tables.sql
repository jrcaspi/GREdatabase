Create table Student(
CollegeBoard_ID number(10) constraint student_id_pk primary key,
School_ID number(5),
Alt_Student_ID number(11),
Student_First_Name varchar(50),
Student_Last_Name varchar(50),
Grad_Year number(4),
Gender varchar(2),
Address_1 varchar(50),
Address_2 varchar(50),
City varchar(50),
State_US varchar(50),
Zip number(8)
);

Create table SAT_Results(
SAT_Results_ID varchar(30) constraint sat_results_id_pk primary key,
CollegeBoard_ID number(10),
Test_ID varchar(20),
Total_Score number(4),
Verbal_Score number(3),
Math_Score number(3)
);

Create table SAT_Test(
Test_ID varchar(50) constraint test_id_pk primary key,
Test_Name varchar(50),
Test_Date varchar(50)
);


Create table Question_Answer(
Question_Answer_ID varchar(50) constraint question_answer_id_pk primary key,
CollegeBoard_ID number(10),
Test_ID varchar(20),
Question_Test_ID varchar(50),
Answer varchar(10)
);

Create table Question_Test(
Question_Test_ID varchar(50) constraint question_test_id_pk primary key,
Question_ID varchar(50),
Test_ID varchar(20),
Tag_ID varchar(30),
Question_Subject varchar(50)
);

Create table School(
School_ID number(10) constraint school_id_pk primary key,
School_Name varchar(100),
School_Type varchar(8),
Address_1 varchar(50),
Address_2 varchar(50),
City varchar(50),
State_US varchar(50),
Zip number(8)
);

Create table Tags(
Tag_ID varchar(30) constraint tag_id_pk primary key,
Subject_Tag1_description varchar(200),
Subject_Tag2_description varchar(200),
Subject_tag3_description varchar(200)
);



ALTER TABLE question_test
ADD CONSTRAINT test_id_fk
FOREIGN KEY (test_id) REFERENCES sat_test(test_id); 

ALTER TABLE question_test
ADD CONSTRAINT tag_id_fk
FOREIGN KEY (tag_id) REFERENCES tags(tag_id); 

ALTER TABLE student
ADD CONSTRAINT school_id_fk
FOREIGN KEY (school_id) REFERENCES school(school_id); 

ALTER TABLE sat_results
ADD CONSTRAINT collegeboard_id_fk
FOREIGN KEY (collegeboard_id) REFERENCES student(collegeboard_id); 

ALTER TABLE sat_results
ADD CONSTRAINT test_sat_results_id_fk
FOREIGN KEY (test_id) REFERENCES sat_test(test_id); 

ALTER TABLE question_answer
ADD CONSTRAINT collegeboard_qa_id_fk
FOREIGN KEY (collegeboard_id) REFERENCES student(collegeboard_id);

ALTER TABLE question_answer
ADD CONSTRAINT question_test_id_fk
FOREIGN KEY (question_test_id) REFERENCES question_test(question_test_id);

ALTER TABLE question_answer
ADD CONSTRAINT test_qa_id_fk
FOREIGN KEY (test_id) REFERENCES sat_test(test_id);