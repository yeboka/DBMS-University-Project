
create trigger gpaEvaluate
    after update on Enroll
    when (old.student_id = new.student_id and old.section_id = new.section_id and old.grade <> new.grade)
    begin
        update Students set GPA = (((select sum(grade) from Enroll where Enroll.student_id = new.student_id)
                                       / (select count(grade) from Enroll where Enroll.student_id = new.student_id)) * 4 / 100 )
                        where Students.student_id = new.student_id;
    end;