
create table Person
(
    id   INTEGER not null
        primary key
        unique,
    name TEXT    not null,
    age  INTEGER not null,
    mail TEXT    not null,
    sex  TEXT    not null,
    type TEXT    not null
);

create table Faculty
(
    faculty_id   INTEGER not null
        primary key
        unique,
    faculty_name TEXT    not null,
    decan_name   TEXT    not null
);

create table Department
(
    dep_id     INTEGER not null
        primary key
        unique,
    dep_name   TEXT    not null
        unique,
    faculty_id INTEGER not null
        references Faculty
);



create table Instructors
(
    instructor_id INTEGER not null
        primary key
        unique
        references Person,
    dep_id        INTEGER not null
        references Department,
    degree        TEXT
);

create table Groups
(
    group_id      INTEGER not null
        primary key
        unique,
    instructor_id INTEGER not null
        unique
        references Instructors
);


create table Students
(
    student_id INTEGER        not null
        primary key
        unique
        references Person,
    dep_id     INTEGER        not null
        references Department,
    group_id   INTEGER        not null
        references Groups,
    year       INTEGER        not null,
    degree     TEXT           not null,
    GPA        REAL default 0 not null
);


create table Jobs
(
    job_id INTEGER           not null
        primary key
        unique,
    name   TEXT              not null
        unique,
    salary INTEGER default 0 not null
);

create table Stuff
(
    stuff_id INTEGER not null
        primary key
        unique
        references Person,
    job_id   INTEGER not null
        references Jobs
);

create table Courses
(
    course_id   INTEGER not null
        primary key
        unique,
    dep_id      INTEGER not null
        references Department,
    ects        INTEGER not null,
    degree      TEXT,
    course_name text    not null
);

create table Sections
(
    section_id    not null
        primary key
        unique,
    course_id     not null
        references Courses,
    instructor_id not null
        references Instructors
);

create table Enroll
(
    section_id INTEGER not null
        references Sections,
    student_id INTEGER not null
        references Students,
    grade      REAL,
    primary key (section_id, student_id)
);

create table Club_info
(
    name           text              not null
        primary key
        unique,
    head_id        integer           not null
        unique
        references Students,
    room           text,
    num_of_members integer default 0 not null
);

create table Clubs
(
    club_id   integer not null
        primary key
        references Club_info,
    club_name text    not null
        unique
);

create table Scholarship_type
(
    scholarship_type text
        primary key,
    amount           integer default 0 not null
);

create table Scholarship
(
    stud_id          Integer
        unique
        references Students,
    scholarship_type text default 'Academic Scholarships' not null
        references Scholarship_type
);

create table Retakes
(
    stud_id   integer not null
        references Students,
    course_id integer not null
        references Courses
);

create table Rooms
(
    room_id       INTEGER           not null
        primary key,
    num_residents INTEGER default 0 not null,
    max_residents INTEGER           not null
);

create table EnrollDorm
(
    student_id INTEGER not null
        unique
        references Students,
    room_id    INTEGER not null
        references Rooms
);

create table EnrollClubs
(
    student_id INTEGER not null
        references Students,
    club_id    INTEGER not null
        references Clubs,
    primary key (student_id, club_id)
);

create table Clinic
(
    id         integer
        primary key,
    doctor_id  INTEGER not null
        references Stuff,
    patient_id INTEGER not null
        references Person,
    diagnosis  TEXT    not null,
    date       TEXT    not null
);

create table Checkpoint
(
    person_id INTEGER not null
        references Person,
    I_O       Text    not null,
    date      TEXT    not null
);

create table Parking
(
    number    INTEGER not null
        primary key
        unique,
    person_id INTEGER not null
        unique
        references Person
);





