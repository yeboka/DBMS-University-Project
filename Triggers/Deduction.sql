create trigger Deduction
    after delete on Students
    begin
        delete from Enroll where Enroll.student_id = old.student_id ;
        delete from EnrollClubs where EnrollClubs.student_id = old.student_id;
        delete from EnrollDorm where EnrollDorm.student_id = old.student_id;
    end;