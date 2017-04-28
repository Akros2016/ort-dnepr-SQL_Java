DROP DATABASE IF EXISTS academy;
CREATE DATABASE academy;
USE academy;


CREATE TABLE Passports
(
	id SERIAL,
    first_name    VARCHAR(64) NOT NULL DEFAULT "Unknown",
	last_name     VARCHAR(64) NOT NULL DEFAULT "Unknown",
    PRIMARY KEY (id)
);

CREATE TABLE Students
(
	id SERIAL,
    id_passport BIGINT UNSIGNED ,
    start_date DATE,
    finish_date DATE,
    PRIMARY KEY(id),
	FOREIGN KEY (id_passport) REFERENCES Passports(id)
);

CREATE TABLE forms
(
	id       SERIAL,
    name     VARCHAR(64) NOT NULL DEFAULT "Unknown",
    PRIMARY KEY(id)
);

CREATE TABLE Groups
(
	id       SERIAL,
    name     VARCHAR(64) NOT NULL DEFAULT "Unknown",
    id_form  BIGINT UNSIGNED ,
    PRIMARY KEY (id),
    FOREIGN KEY (id_form) REFERENCES forms(id)
);

CREATE TABLE Student_group
(
	id_student BIGINT UNSIGNED,
    id_group   BIGINT UNSIGNED ,
	FOREIGN KEY (id_student) REFERENCES Students(id),
    FOREIGN KEY (id_group) REFERENCES Groups(id)
);

CREATE TABLE teachers
(
	id SERIAL,
    id_passport BIGINT UNSIGNED ,
	PRIMARY KEY(id),
	FOREIGN KEY (id_passport) REFERENCES Passports(id)
);

CREATE TABLE Subjects
(
	id        SERIAL ,
	name      VARCHAR(64) NOT NULL DEFAULT "Unknown",
    PRIMARY KEY(id)
);

CREATE TABLE subject_teacher
(
	id_subject     BIGINT UNSIGNED ,
    id_teacher     BIGINT UNSIGNED ,
    FOREIGN KEY (id_subject) REFERENCES Subjects(id),
    FOREIGN KEY (id_teacher) REFERENCES teachers(id)
);

CREATE TABLE marks
(
    id         SERIAL,
    id_student BIGINT UNSIGNED,
    id_group   BIGINT UNSIGNED,
    id_subject BIGINT UNSIGNED,
    mark       VARCHAR(64) NOT NULL DEFAULT "Unknown",
    date       DATE,
    id_teacher     BIGINT UNSIGNED ,
    PRIMARY KEY(id),
    FOREIGN KEY (id_student) REFERENCES Students(id),
    FOREIGN KEY (id_group) REFERENCES Groups(id),
    FOREIGN KEY (id_subject) REFERENCES Subjects(id),
    FOREIGN KEY (id_teacher) REFERENCES teachers(id)
);

INSERT INTO Passports
(first_name, last_name)
VALUES
('Vasiliy'   , 'Pupkin'),
('Natalia'   , 'Zemlyanaya'),
('Vitaliy'   , 'Vecikovskiy'),
('Irina'     , 'Gaponidze'),
('Konstantyn', 'Vladimirov'),
('Yuliya'    , 'Krapiva'),
('Anatoliy'  , 'Melnik'),
('Irina'     , 'Drugova'),
('Vasiliy'   , 'Pupkin'),
('Anna'      , 'French'),
('Vitaliy'   , 'Klichko'),
('Kristina'  , 'Tishenko'),
('Vladimir'  , 'Klichko'),
('Karina'    , 'Bunina'),
('Yevhen'    , 'Koval'),
('Natalia'   , 'Melnik'),
('Roman'     , 'Kravtsov'),
('Kateryna'  , 'Black'),
('Vasiliy'   , 'Gromov'),
('Tatyana'   , 'Zhorina'),
('Anatoliy'  , 'Gorb');

INSERT INTO Students
(id_passport, start_date, finish_date)
VALUES
( 1, '2010-09-01', '2015-06-30'),
( 2, '2010-09-01', '2015-06-30'),
( 3, '2010-09-01', '2015-06-30'),
( 4, '2011-09-01', '2016-06-30'),
( 5, '2011-09-01', '2014-06-30'),
( 6, '2011-09-01', '2016-06-30'),
( 7, '2011-09-01', '2016-06-30'),
( 8, '2012-09-01', '2014-06-30'),
( 9, '2012-09-01', NULL),
(10, '2012-09-01', NULL),
(11, '2013-09-01', NULL),
(12, '2013-09-01', NULL),
(13, '2013-09-01', NULL),
(14, '2014-09-01', NULL),
(15, '2014-09-01', NULL),
(16, '2014-09-01', NULL),
(17, '2015-09-01', NULL),
(18, '2016-09-01', NULL),
(19, '2016-09-01', NULL);

INSERT INTO forms
(name)
VALUES
('full-time'),
('evening'),
('corresponding');

INSERT INTO Groups
(name, id_form)
VALUES
('F10', 1),
('F11', 1),
('E11', 2),
('F12', 1),
('C13', 3),
('F13', 1),
('F14', 1),
('C15', 3),
('F16', 1);

INSERT INTO Subjects
(name)
VALUES
('Mathematic'),('History'),('Chemistry'),('Physics');

INSERT INTO marks
(mark,date)
VALUES
('Unsatisfactory', '2014-09-01'),
('Good',           '2015-03-22'),
('Excellent',      '2016-01-14');

#SELECT * 
#FROM Passport, Students
#WHERE start_date > '2014-01-01'
#AND id_passport = Passport.id;

#SELECT *
#FROM Passports, Students, Student_group, Groups
#WHERE Groups.name = 'F10'
#AND Groups.id = Student_group.id_group
#AND Student_group.id_student = Students.id
#AND Students.id_passport = Passports.id;

SELECT * 
FROM Passports
INNER JOIN Students
ON Students.id_passport = Passports.id
INNER JOIN Student_group
ON Students.id = Student_group.id_student
INNER JOIN Groups
ON Groups.id = Student_group.id_group
WHERE Groups.name = 'F10';



