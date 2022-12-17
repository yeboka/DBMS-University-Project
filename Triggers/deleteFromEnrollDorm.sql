create trigger DeleteFromEnrollDorm
     after insert on EnrollDorm
    when(select num_residents from Rooms where new.room_id = Rooms.room_id)
            = (select max_residents from Rooms where new.room_id = Rooms.room_id)
    begin
        delete from EnrollDorm where student_id =new.student_id;
    end;