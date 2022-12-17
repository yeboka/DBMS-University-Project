create trigger gpaEvaluate
    after update of grade on Enroll
    begin
        update Students set GPA = (((select sum(grade) from Enroll where Enroll.student_id = new.student_id)
                                       / (select count(grade) from Enroll where Enroll.student_id = new.student_id)) * 4 / 100 )
                        where Students.student_id = new.student_id;
    end;