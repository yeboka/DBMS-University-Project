create table Faculty (
    faculty_id INTEGER PRIMARY KEY not null UNIQUE,
    faculty_name TEXT NOT NULL,
    decan_id INTEGER NOT NULL
);

create table Department (
    dep_id INTEGER PRIMARY KEY NOT NULL UNIQUE ,
    dep_name TEXT UNIQUE NOT NULL,
    faculty_id INTEGER NOT NULL,
    FOREIGN KEY (faculty_id)
                        references Faculty (faculty_id)
);

create table Courses (
    course_id INTEGER PRIMARY KEY NOT NULL UNIQUE ,
    dep_id INTEGER NOT NULL ,
    course_name TEXT NOT NULL ,
    ects INTEGER not null ,
    degree TEXT,
    FOREIGN KEY (dep_id)
                     references Department (dep_id)
);

create table Instructors (
    instructor_id INTEGER PRIMARY KEY NOT NULL UNIQUE ,
    dep_id INTEGER NOT NULL ,
    name TEXT NOT NULL ,
    degree TEXT ,
    sex TEXT ,
    age INTEGER ,
    FOREIGN KEY (dep_id)
                         references Department (dep_id)
);

create table Sections (
    section_id PRIMARY KEY NOT NULL UNIQUE ,
    course_id NOT NULL ,
    instructor_id NOT NULL ,
    FOREIGN KEY (course_id)
                      references Courses (course_id),
    FOREIGN KEY (instructor_id)
                      references Instructors (instructor_id)
);

create table Students (
    student_id INTEGER PRIMARY KEY NOT NULL UNIQUE ,
    dep_id INTEGER NOT NULL ,
    name TEXT NOT NULL ,
    last_name INTEGER NOT NULL ,
    age INTEGER NOT NULL ,
    year INTEGER NOT NULL ,
    degree TEXT NOT NULL ,
    GPA REAL,
    balance INTEGER ,
    FOREIGN KEY  (dep_id)
                      references Department (dep_id)
);

create table Enroll (
    section_id INTEGER NOT NULL ,
    student_id INTEGER NOT NULL ,
    grade REAL,
    PRIMARY KEY (section_id, student_id) ,
    FOREIGN KEY (student_id)
                    references Students (student_id) ,
    FOREIGN KEY (section_id)
                    references Sections (section_id)
);

create table Clubs (
    club_id INTEGER PRIMARY KEY NOT NULL UNIQUE ,
    name TEXT NOT NULL UNIQUE ,
    head_id INTEGER NOT NULL UNIQUE ,
    room TEXT ,
    FOREIGN KEY (head_id)
                   references Students (student_id)
);

create table EnrollClubs (
    student_id INTEGER NOT NULL ,
    club_id INTEGER NOT NULL ,
    PRIMARY KEY (student_id, club_id),
    FOREIGN KEY (student_id)
                         references Students (student_id),
    FOREIGN KEY (club_id)
                         references Clubs (club_id)
);

create table Groups (
    group_id INTEGER NOT NULL UNIQUE PRIMARY KEY ,
    instructor_id INTEGER NOT NULL UNIQUE ,
    FOREIGN KEY (instructor_id)
                    references Instructors (instructor_id)
);

create table Rooms (
    room_id INTEGER NOT NULL ,
    campus_id INTEGER NOT NULL ,
    num_residents INTEGER,
    max_residents INTEGER NOT NULL ,
    PRIMARY KEY (room_id, campus_id)
);

create table University (
    id INTEGER PRIMARY KEY NOT NULL UNIQUE ,
    name text UNIQUE NOT NULL ,
    rector_name TEXT UNIQUE NOT NULL ,
    address TEXT NOT NULL ,
    phone_number TEXT NOT NULL
);

