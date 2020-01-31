DELIMITER //
create trigger ID_ASADAS
before insert on ASADA
for each row
begin
    select count(*) into @CANT from ASADA where DISTRITO_id = new.DISTRITO_id;
    select char(@CANT + 65) into @char;
    set new.ID := concat(new.DISTRITO_id, @char);
end; //
DELIMITER ;
