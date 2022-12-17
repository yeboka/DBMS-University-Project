BEGIN TRANSACTION;

INSERT INTO EnrollClubs (student_id, club_id)
VALUES (123, 222);

UPDATE Club_info
SET num_of_members = num_of_members + 1
WHERE name = (SELECT club_name FROM Clubs WHERE club_id = 222);

COMMIT;


CREATE INDEX my_index_name ON Clinic(doctor_id, patient_id, diagnosis, date);
CREATE INDEX idx_persons on Person (id, name, mail, type, sex);

select * from Clinic indexed by my_index_name;
select *
from Person INDEXED BY idx_persons;

select *
from Clinic;
select *
from Person;