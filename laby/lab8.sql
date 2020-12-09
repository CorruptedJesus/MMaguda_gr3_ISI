#lab8

#zad1
#1
DELIMITER //
CREATE TRIGGER waga_kreatura_before_insert
BEFORE INSERT ON kreatura
FOR EACH ROW
BEGIN
	IF NEW.waga > 0
THEN
	SET NEW.waga=0;
END IF ;
END
//
DELIMITER ;

INSERT INTO kreatura VALUES (999,'cos','wiking','1001-01-01',666,50);

SELECT * from kreatura where idKreatury=999;

#zad2

CREATE table archiwum_wypraw
(
id_wyprawy INT(4),
nazwa VARCHAR(50),
data_rozpoczecia DATE,
data_zakonczenia DATE,
kierownik VARCHAR(50)
);

DELIMITER //
CREATE TRIGGER wyprawa_before_delete
BEFORE DELETE ON wyprawa
FOR EACH ROW
BEGIN
INSERT INTO archiwum_wypraw
SELECT w.id_wyprawy,w.nazwa,w.data_rozpoczecia,w.data_zakonczenia,k.nazwa
FROM wyprawa AS w JOIN kreatura AS k ON w.kierownik=k.idKreatury
WHERE w.id_wyprawy=old.id_wyprawy;
END
//
DELIMITER ;

#zad3

#1

#2

