-- Zadanie 1 --
DELIMITER //
CREATE TRIGGER waga_wieksza_od_zero
BEFORE INSERT ON kreatura

FOR EACH ROW

BEGIN
IF NEW.waga < 0 THEN
SET NEW.waga = 0;
END IF;
END;// 
DELIMITER ;

DELIMITER //
CREATE TRIGGER waga_wieksza_od_zero_update
BEFORE UPDATE ON kreatura

FOR EACH ROW

BEGIN
IF NEW.waga < 0 THEN
SET NEW.waga = 0;
END IF;
END;// 
DELIMITER ;
