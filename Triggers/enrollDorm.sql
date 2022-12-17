create trigger EnrollToDorm
     after insert on EnrollDorm
    when(select num_residents from Rooms where new.room_id = Rooms.room_id)
            <> (select max_residents from Rooms where new.room_id = Rooms.room_id)
    begin
        update Rooms set num_residents = (select num_residents from Rooms
                                                               where new.room_id = Rooms.room_id) + 1 where new.room_id = Rooms.room_id;
    end;