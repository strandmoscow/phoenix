-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-09-13 14:28:41.405

-- foreign keys
ALTER TABLE Account
    DROP CONSTRAINT Account_Manager;

ALTER TABLE Account
    DROP CONSTRAINT Account_Parents;

ALTER TABLE Account
    DROP CONSTRAINT Account_Passport;

ALTER TABLE Account
    DROP CONSTRAINT Account_Student;

ALTER TABLE Account
    DROP CONSTRAINT Account_Trainer;

ALTER TABLE Adress
    DROP CONSTRAINT Adress_City;

ALTER TABLE Adress
    DROP CONSTRAINT Adress_Country;

ALTER TABLE Adress
    DROP CONSTRAINT Adress_Region;

ALTER TABLE Attendance
    DROP CONSTRAINT Attendance_Lesson;

ALTER TABLE Attendance
    DROP CONSTRAINT Attendance_Student;

ALTER TABLE Building
    DROP CONSTRAINT Building_Adress;

ALTER TABLE Building
    DROP CONSTRAINT Building_Club;

ALTER TABLE City
    DROP CONSTRAINT City_Region;

ALTER TABLE Club
    DROP CONSTRAINT Club_Adress;

ALTER TABLE Club
    DROP CONSTRAINT Club_Federation;

ALTER TABLE Federation
    DROP CONSTRAINT Federation_Sport;

ALTER TABLE "Group"
    DROP CONSTRAINT Group_Trainer;

ALTER TABLE Gym
    DROP CONSTRAINT Gym_Building;

ALTER TABLE Lesson
    DROP CONSTRAINT Lesson_Group;

ALTER TABLE Lesson
    DROP CONSTRAINT Lesson_Gym;

ALTER TABLE Parents
    DROP CONSTRAINT Parents_Parent_Type;

ALTER TABLE Region
    DROP CONSTRAINT Region_Country;

ALTER TABLE Students
    DROP CONSTRAINT Student_Group;

ALTER TABLE Student_Parent
    DROP CONSTRAINT Student_Parent_Parents;

ALTER TABLE Student_Parent
    DROP CONSTRAINT Student_Parent_Student;

ALTER TABLE Trainer
    DROP CONSTRAINT Trainer_Federation;

-- tables
DROP TABLE Account;

DROP TABLE Adress;

DROP TABLE Attendance;

DROP TABLE Building;

DROP TABLE City;

DROP TABLE Club;

DROP TABLE Country;

DROP TABLE Federation;

DROP TABLE "Group";

DROP TABLE Gym;

DROP TABLE Lesson;

DROP TABLE Manager;

DROP TABLE Parent_Type;

DROP TABLE Parents;

DROP TABLE Passport;

DROP TABLE Region;

DROP TABLE Sport;

DROP TABLE Student_Parent;

DROP TABLE Students;

DROP TABLE Trainer;

-- End of file.

