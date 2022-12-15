create trigger retakers
    after insert on Retakes
    when(select stud_id from Scholarship) not null
    begin
        delete from Scholarship where Scholarship.stud_id = new.stud_id ;
    end;