create trigger DeleteScholarship
    after update of grade on Enroll
    when ((select count(student_id) from Enroll where grade >= 70) <> (select count(student_id) from Enroll) )
    begin
        delete from Scholarship where Scholarship.stud_id = new.student_id;
    end;