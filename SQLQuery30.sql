
use D_project;

CREATE TABLE Student
(
    student_ID int NOT NULL,
    FirstName VARCHAR(30) NOT NULL,
    FamilyName VARCHAR(30) NOT NULL,
    Gender CHAR(30) NOT NULL ,
    Scholarship_ID int NOT NULL,
    Date_OF_Birth VARCHAR(20) NOT NULL,
    Phon_No INT NOT NULL,
    PRIMARY KEY(student_ID)
    );
    
 CREATE TABLE Scholarship
 (
     Scholarship_ID int NOT NULL,
     Scolarship_Percentage int NOT NULL,
     Maintain_Condition VARCHAR(50)  NOT NULL,
     start_year INT NOT NULL,
     finish_year INT NOT NUll,
     PRIMARY KEY (Scholarship_ID)
     );
     
CREATE TABLE Enrolment
(
    Enrolment_ID int NOT NULL,
    student_ID int NOT NULL,
    Enrolment_year INT NOT NULL,
    Finish_year INT NOT NULL,
    Course_ID VARCHAR(10) NOT NUll,
    PRIMARY KEY (Enrolment_ID)
    );
    
CREATE TABLE Grade
(
    student_ID INT NOT NULL,
    Exam_ID INT NOT NULL,
    Num_Attempts INT NOT NULL,
    Score INT NOT NULL
    );
    
 CREATE TABLE Exam (
     Exam_ID int NOT NULL,
     Exam_Name VARCHAR(30) NOT NULL,
     Exam_requirement int NOT NUll,
     Grade VARCHAR(50) NOT NULL,
     PRIMARY KEY ( Exam_ID)
     );
     
 CREATE TABLE Subject
 (
     Subject_ID int NOT NULL,
     Exam_ID int NOT NULL,
     

     PRIMARY KEY(Subject_ID) 
     );
     
     CREATE TABLE Course
     (
		 Enrolment_ID int NOT NULL,
		  student_ID INT NOT NULL,
		  Subject_ID int NOT NULL,
           Course_Name VARCHAR(40) NOT NULL,

     );
     
 CREATE TABLE ProviderInfo_Scholarship 
(
    ProviderInfo_ID INT NOT NULl,
    Scholarship_ID int NOT NULL,
    Description Text NOT NULl
    );
    
 CREATE TABLE ProviderInfo
 (
     ProviderInfo_ID INT NOT Null,
     ProviderInfo_name VARCHAR(30) NOT NULL,
     Organisation VARCHAR(30) NOT NULL,
     PRIMARY KEY(ProviderInfo_ID)
     );
 ALTER TABLE Grade
 ADD CONSTRAINT fk_grade1
 FOREIGN KEY (student_ID) REFERENCES Student(student_ID);

 ALTER TABLE Grade
 ADD CONSTRAINT fk_grade2
 FOREIGN KEY (Exam_ID) REFERENCES Exam(Exam_ID);

  ALTER TABLE Grade
 ADD CONSTRAINT Composite_Key_grade
 Primary Key (student_ID,Exam_ID);

 ALTER TABLE Student
 ADD CONSTRAINT fk_student
 FOREIGN KEY (Scholarship_ID) REFERENCES Scholarship(Scholarship_ID);
 
 ALTER TABLE Enrolment
 ADD CONSTRAINT fk_enrolment
 FOREIGN KEY (student_ID) REFERENCES Student(student_ID);

  ALTER TABLE Course
 ADD CONSTRAINT fk_course1
 FOREIGN KEY (student_ID) REFERENCES Student(student_ID);

   ALTER TABLE Course
 ADD CONSTRAINT fk_course2
 FOREIGN KEY (Enrolment_ID) REFERENCES Enrolment(Enrolment_ID);

    ALTER TABLE Course
 ADD CONSTRAINT fk_course3
 FOREIGN KEY (Subject_ID) REFERENCES Subject(Subject_ID);


     ALTER TABLE Course
 ADD CONSTRAINT Composite_PK_course3
PRIMARY KEY(Enrolment_ID,student_ID);
 
 ALTER TABLE ProviderInfo_Scholarship
 ADD CONSTRAINT fk_ProviderInfo_scholarship
 FOREIGN KEY (Scholarship_ID) REFERENCES Scholarship(Scholarship_ID);

  ALTER TABLE ProviderInfo_Scholarship
 ADD CONSTRAINT fk_ProviderInfo_scholarship1
 FOREIGN KEY (ProviderInfo_ID) REFERENCES  ProviderInfo(ProviderInfo_ID);


   ALTER TABLE ProviderInfo_Scholarship
 ADD CONSTRAINT Composit_ProviderInfo_scholarship1
PRIMARY KEY(Scholarship_ID,ProviderInfo_ID);
 
 ALTER TABLE Subject
 ADD CONSTRAINT fk_subject
 FOREIGN KEY (Exam_ID) REFERENCES Exam(Exam_ID);
 
