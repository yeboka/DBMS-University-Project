create trigger DeleteScholarship
    after update on Enroll
    when (old.student_id = new.student_id and old.section_id = new.section_id and old.grade <> new.grade and (select count(student_id) from Enroll where grade >= 70) <> (select count(student_id) from Enroll) )
    begin
        delete from Scholarship where Scholarship.stud_id = new.student_id;
    end;