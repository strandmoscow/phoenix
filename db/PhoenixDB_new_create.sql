-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-09-13 14:28:41.405

-- tables
-- Table: Account
CREATE TABLE Account (
    Account_Id int  NOT NULL,
    Account_Name varchar(150)  NOT NULL,
    Account_Patronymic varchar(50)  NULL,
    Account_Surname varchar(50)  NOT NULL,
    Account_Birthday date  NOT NULL,
    Account_Phone int  NOT NULL,
    Account_Email varchar  NOT NULL,
	Account_Trainer_Id int  NULL,
    Account_Student_Id int  NULL,
    Account_Parent_Id int  NULL,
    Account_Manager_Id int  NULL,
    Passport_Passport_ID int  NULL,
    CONSTRAINT Account_pk PRIMARY KEY (Account_Id)
);

-- Table: Adress
CREATE TABLE Adress (
    Adress_Id int  NOT NULL,
    Adress_Country_Id int  NOT NULL,
    Adress_Region_Id int  NOT NULL,
    Adress_City_Id int  NOT NULL,
    Adress_Street varchar(64)  NOT NULL,
    Adress_House int  NOT NULL,
    Adress_Building varchar(64)  NOT NULL,
    CONSTRAINT Adress_pk PRIMARY KEY (Adress_Id)
);

-- Table: Attendance
CREATE TABLE Attendance (
    Attendance_Id int  NOT NULL,
    Attendance_Lesson_Id int  NOT NULL,
    Attendance_Student_Id int  NOT NULL,
    CONSTRAINT Attendance_pk PRIMARY KEY (Attendance_Id)
);

-- Table: Building
CREATE TABLE Building (
    Building_Id int  NOT NULL,
    Building_Name varchar(256)  NOT NULL,
    Building_Adress_Id int  NOT NULL,
    Building_Club_Id int  NOT NULL,
    CONSTRAINT Building_pk PRIMARY KEY (Building_Id)
);

-- Table: City
CREATE TABLE City (
    City_Id int  NOT NULL,
    City_Name varchar(256)  NOT NULL,
    City_Region_Id int  NOT NULL,
    CONSTRAINT City_pk PRIMARY KEY (City_Id)
);

-- Table: Club
CREATE TABLE Club (
    Club_Id int  NOT NULL,
    Club_Name varchar(256)  NOT NULL,
    Club_Phone varchar(256)  NOT NULL,
    Club_Email varchar(256)  NOT NULL,
	Club_Adress_Id int  NOT NULL,
    Club_Federation_id int  NOT NULL,
    CONSTRAINT Club_pk PRIMARY KEY (Club_Id)
);

-- Table: Country
CREATE TABLE Country (
    Country_Id int  NOT NULL,
    Country_Name varchar(256)  NOT NULL,
    CONSTRAINT Country_pk PRIMARY KEY (Country_Id)
);

-- Table: Federation
CREATE TABLE Federation (
    Federation_id int  NOT NULL,
    Federation_Sport int  NOT NULL,
    CONSTRAINT Federation_id PRIMARY KEY (Federation_id)
);

-- Table: Group
CREATE TABLE "Group" (
    Group_Id int  NOT NULL,
    Group_Name varchar(128)  NOT NULL,
    Group_Trainer_Id int  NOT NULL,
    CONSTRAINT Group_pk PRIMARY KEY (Group_Id)
);

-- Table: Gym
CREATE TABLE Gym (
    Gym_Id int  NOT NULL,
    Gym_Name varchar(64)  NOT NULL,
    Building_Building_Id int  NOT NULL,
    CONSTRAINT Gym_pk PRIMARY KEY (Gym_Id)
);

-- Table: Lesson
CREATE TABLE Lesson (
    Lesson_Id int  NOT NULL,
    Lesson_Name varchar(256)  NULL,
    Lesson_DateTime date  NOT NULL,
    Lesson_Group_Id int  NOT NULL,
    Lesson_Gym_Id int  NOT NULL,
    CONSTRAINT Lesson_pk PRIMARY KEY (Lesson_Id)
);

-- Table: Manager
CREATE TABLE Manager (
    Manager_Id int  NOT NULL,
    CONSTRAINT Manager_pk PRIMARY KEY (Manager_Id)
);

-- Table: Parent_Type
CREATE TABLE Parent_Type (
    Parent_Type_Id int  NOT NULL,
    Parent_Type_Name varchar(256)  NOT NULL,
    CONSTRAINT Parent_Type_pk PRIMARY KEY (Parent_Type_Id)
);

-- Table: Parents
CREATE TABLE Parents (
    Parent_Id int  NOT NULL,
    Parent_Type_Parent_Type_Id int  NOT NULL,
    CONSTRAINT Parents_pk PRIMARY KEY (Parent_Id)
);

-- Table: Passport
CREATE TABLE Passport (
    Passport_ID int  NOT NULL,
    Passport_Ser int  NOT NULL,
    Passport_Num int  NOT NULL,
    Passport_Podr_Code int  NULL,
    Passport_Podr_Name varchar(1028)  NOT NULL,
    CONSTRAINT Passport_pk PRIMARY KEY (Passport_ID)
);

-- Table: Region
CREATE TABLE Region (
    Region_Id int  NOT NULL,
    Region_Name varchar(256)  NOT NULL,
    Region_Country_Id int  NOT NULL,
    CONSTRAINT Region_pk PRIMARY KEY (Region_Id)
);

-- Table: Sport
CREATE TABLE Sport (
    Sport_Id int  NOT NULL,
    Sport_Name varchar(100)  NOT NULL,
    CONSTRAINT Sport_pk PRIMARY KEY (Sport_Id)
);

-- Table: Student_Parent
CREATE TABLE Student_Parent (
    SP_Id int  NOT NULL,
    Students_Student_Id int  NOT NULL,
    Parents_Parent_Id int  NOT NULL,
    CONSTRAINT Student_Parent_pk PRIMARY KEY (SP_Id)
);

-- Table: Students
CREATE TABLE Students (
    Student_Id int  NOT NULL,
    Student_Health_Insurance int  NOT NULL,
    Student_Birth_Certificate int  NOT NULL,
    Student_SNILS int  NOT NULL,
    Student_Group_Id int  NOT NULL,
    CONSTRAINT Students_pk PRIMARY KEY (Student_Id)
);

-- Table: Trainer
CREATE TABLE Trainer (
    Trainer_Id int  NOT NULL,
    Federation_Federation_id int  NOT NULL,
    CONSTRAINT Trainer_pk PRIMARY KEY (Trainer_Id)
);

-- foreign keys
-- Reference: Account_Manager (table: Account)
ALTER TABLE Account ADD CONSTRAINT Account_Manager
    FOREIGN KEY (Account_Manager_Id)
    REFERENCES Manager (Manager_Id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Account_Parents (table: Account)
ALTER TABLE Account ADD CONSTRAINT Account_Parents
    FOREIGN KEY (Account_Parent_Id)
    REFERENCES Parents (Parent_Id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Account_Passport (table: Account)
ALTER TABLE Account ADD CONSTRAINT Account_Passport
    FOREIGN KEY (Passport_Passport_ID)
    REFERENCES Passport (Passport_ID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Account_Student (table: Account)
ALTER TABLE Account ADD CONSTRAINT Account_Student
    FOREIGN KEY (Account_Student_Id)
    REFERENCES Students (Student_Id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Account_Trainer (table: Account)
ALTER TABLE Account ADD CONSTRAINT Account_Trainer
    FOREIGN KEY (Account_Trainer_Id)
    REFERENCES Trainer (Trainer_Id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Adress_City (table: Adress)
ALTER TABLE Adress ADD CONSTRAINT Adress_City
    FOREIGN KEY (Adress_City_Id)
    REFERENCES City (City_Id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Adress_Country (table: Adress)
ALTER TABLE Adress ADD CONSTRAINT Adress_Country
    FOREIGN KEY (Adress_Country_Id)
    REFERENCES Country (Country_Id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Adress_Region (table: Adress)
ALTER TABLE Adress ADD CONSTRAINT Adress_Region
    FOREIGN KEY (Adress_Region_Id)
    REFERENCES Region (Region_Id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Attendance_Lesson (table: Attendance)
ALTER TABLE Attendance ADD CONSTRAINT Attendance_Lesson
    FOREIGN KEY (Attendance_Lesson_Id)
    REFERENCES Lesson (Lesson_Id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Attendance_Student (table: Attendance)
ALTER TABLE Attendance ADD CONSTRAINT Attendance_Student
    FOREIGN KEY (Attendance_Student_Id)
    REFERENCES Students (Student_Id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Building_Adress (table: Building)
ALTER TABLE Building ADD CONSTRAINT Building_Adress
    FOREIGN KEY (Building_Adress_Id)
    REFERENCES Adress (Adress_Id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Building_Club (table: Building)
ALTER TABLE Building ADD CONSTRAINT Building_Club
    FOREIGN KEY (Building_Club_Id)
    REFERENCES Club (Club_Id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: City_Region (table: City)
ALTER TABLE City ADD CONSTRAINT City_Region
    FOREIGN KEY (City_Region_Id)
    REFERENCES Region (Region_Id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Club_Adress (table: Club)
ALTER TABLE Club ADD CONSTRAINT Club_Adress
    FOREIGN KEY (Club_Adress_Id)
    REFERENCES Adress (Adress_Id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Club_Federation (table: Club)
ALTER TABLE Club ADD CONSTRAINT Club_Federation
    FOREIGN KEY (Club_Federation_id)
    REFERENCES Federation (Federation_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Federation_Sport (table: Federation)
ALTER TABLE Federation ADD CONSTRAINT Federation_Sport
    FOREIGN KEY (Federation_Sport)
    REFERENCES Sport (Sport_Id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Group_Trainer (table: Group)
ALTER TABLE "Group" ADD CONSTRAINT Group_Trainer
    FOREIGN KEY (Group_Trainer_Id)
    REFERENCES Trainer (Trainer_Id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Gym_Building (table: Gym)
ALTER TABLE Gym ADD CONSTRAINT Gym_Building
    FOREIGN KEY (Building_Building_Id)
    REFERENCES Building (Building_Id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Lesson_Group (table: Lesson)
ALTER TABLE Lesson ADD CONSTRAINT Lesson_Group
    FOREIGN KEY (Lesson_Group_Id)
    REFERENCES "Group" (Group_Id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Lesson_Gym (table: Lesson)
ALTER TABLE Lesson ADD CONSTRAINT Lesson_Gym
    FOREIGN KEY (Lesson_Gym_Id)
    REFERENCES Gym (Gym_Id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Parents_Parent_Type (table: Parents)
ALTER TABLE Parents ADD CONSTRAINT Parents_Parent_Type
    FOREIGN KEY (Parent_Type_Parent_Type_Id)
    REFERENCES Parent_Type (Parent_Type_Id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Region_Country (table: Region)
ALTER TABLE Region ADD CONSTRAINT Region_Country
    FOREIGN KEY (Region_Country_Id)
    REFERENCES Country (Country_Id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Student_Group (table: Students)
ALTER TABLE Students ADD CONSTRAINT Student_Group
    FOREIGN KEY (Student_Group_Id)
    REFERENCES "Group" (Group_Id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Student_Parent_Parents (table: Student_Parent)
ALTER TABLE Student_Parent ADD CONSTRAINT Student_Parent_Parents
    FOREIGN KEY (Parents_Parent_Id)
    REFERENCES Parents (Parent_Id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Student_Parent_Student (table: Student_Parent)
ALTER TABLE Student_Parent ADD CONSTRAINT Student_Parent_Student
    FOREIGN KEY (Students_Student_Id)
    REFERENCES Students (Student_Id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Trainer_Federation (table: Trainer)
ALTER TABLE Trainer ADD CONSTRAINT Trainer_Federation
    FOREIGN KEY (Federation_Federation_id)
    REFERENCES Federation (Federation_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

