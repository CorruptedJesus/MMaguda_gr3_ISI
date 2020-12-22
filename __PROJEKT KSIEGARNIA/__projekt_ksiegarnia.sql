CREATE TABLE Klient
(
id_klient INT(4) PRIMARY KEY AUTO_INCREMENT,
imie VARCHAR(50),
nazwisko VARCHAR(50),
pesel CHAR(11),
email VARCHAR(255),
nr_tel CHAR(9),
id_plec INT(4)
);

CREATE TABLE Pracownik
(
id_pracownik INT PRIMARY KEY AUTO_INCREMENT,
imie VARCHAR(50),
nazwisko VARCHAR(50),
pesel CHAR(11),
data_urodzenia DATE,
id_zarobki INT,
id_plec INT
);

CREATE TABLE Plec
(
id_plec INT PRIMARY KEY AUTO_INCREMENT,
plec ENUM('kobieta','mezczyzna')
);

CREATE TABLE zarobki
(
id_zarobki INT PRIMARY KEY AUTO_INCREMENT,
zarobki INT(5)
);

CREATE TABLE Typ
(
id_typ INT PRIMARY KEY AUTO_INCREMENT,
typ ENUM('ksiazka', 'e-book','audiobook')
);

CREATE TABLE Towar
(
id_towar INT PRIMARY KEY AUTO_INCREMENT,
tytul VARCHAR(100),
autor VARCHAR(100),
cena DECIMAL(5,2),
id_typ INT
);

ALTER TABLE towar
MODIFY cena DECIMAL(5,2);

CREATE TABLE Magazyn
(
id_magazyn INT PRIMARY KEY AUTO_INCREMENT,
ilosc INT,
id_towaru INT
);

CREATE TABLE Sprzedaz
(
id_sprzedaz INT PRIMARY KEY AUTO_INCREMENT,
data_sprzedazy DATE,
id_towar INT,
id_pracownik INT,
id_klient INT
);

ALTER TABLE pracownik
ADD FOREIGN KEY(id_zarobki) REFERENCES zarobki(id_zarobki) ON DELETE SET NULL;

ALTER TABLE pracownik
ADD FOREIGN KEY(id_plec) REFERENCES plec(id_plec) ON DELETE SET NULL;

ALTER TABLE klient
ADD FOREIGN KEY(id_plec) REFERENCES plec(id_plec) ON DELETE SET NULL;

ALTER TABLE towar
ADD FOREIGN KEY(id_typ) REFERENCES typ(id_typ) ON DELETE SET NULL;

ALTER TABLE sprzedaz
ADD FOREIGN KEY(id_towar) REFERENCES towar(id_towar) ON DELETE SET NULL;

ALTER TABLE sprzedaz
ADD FOREIGN KEY(id_pracownik) REFERENCES pracownik(id_pracownik) ON DELETE SET NULL;

ALTER TABLE sprzedaz
ADD FOREIGN KEY(id_klient) REFERENCES klient(id_klient) ON DELETE SET NULL;

ALTER TABLE magazyn
ADD FOREIGN KEY(id_towaru) REFERENCES towar(id_towar) ON DELETE SET NULL;

INSERT INTO zarobki (zarobki) VALUES (5000),(10000),(15000),(7500),(9350),(4290);

INSERT INTO plec (plec) VALUES ('kobieta'),('mezczyzna');

INSERT INTO pracownik (imie,nazwisko,pesel,data_urodzenia,id_zarobki,id_plec) VALUES 
('Adam','Rutkowski',69030476517,'1969-03-04',1,2),
('Adrian','Maciejewski',77020525819,'1977-02-05',2,2),
('Dariusz','Jakubowski',96122756921,'1996-12-27',4,2),
('Paweł','Górecki',45091679582,'1945-09-16',3,2),
('Ireneusz','Krawczyk',65072912941,'1965-07-29',6,2),
('Maciej','Zielinski',65072145374,'1965-07-21',4,2),
('Konrad','Witkowski',46102079429,'1946-10-20',5,2),
('Diego','Gorski',65061319496,'1965-06-13',2,2),
('Jozef','Dabrowski',98072355867,'1998-07-23',1,2),
('Konstancja','Baranowska',02300642191,'1960-08-28',6,1),
('Miroslawa','Witkowska',61081319841,'1960-08-28',6,1),
('Izyda','Mroz',87071094794,'1960-08-28',6,1);

INSERT INTO klient (imie,nazwisko,pesel,email,nr_tel,id_plec) VALUES
('Adriana','Zakrzewska',88111073685,'adriana.zakrzewska@gmail.com',014765088,1),
('Urszula','Ziółkowska',84073056586,'urszula.ziolkowska@gmail.com',897977639,1),
('Dorota','Malinowska',04270191129,'dorota.malinowska@gmail.com',484678783,1),
('Blanka','Sikorska',80031995177,'blanka.sikorska@gmail.com',632019628,1),
('Gabriela','Maciejewska',67091764712,'gabriela.maciejowska@gmail.com',774461134,1),
('Milan','Piotrowski',74010363141,'milan.piotrowski@gmail.com',799266135,2),
('Mieszko','Zieliński',80011364296,'mieszko.zielinski@gmail.com',518720782,2),
('Franciszek','Cieślak',69050917739,'franciszek.cieslak@gmail.com',293739852,2),
('Daniel','Duda',87050258782,'daniel.duda@gmail.com',602538251,2),
('Igor','Kubiak',58030495639,'igor.kubiak@gmail.com',968841820,2);

INSERT INTO typ (typ) VALUES ('ksiazka'),('e-book'),('audiobook');

INSERT INTO towar (tytul,autor,cena,id_typ) VALUES
('To','Stephen King',45.90,1),
('To','Stephen King',45.90,2),
('To','Stephen King',45.90,3),
('Instytut','Stephen King',47,1),
('Instytut','Stephen King',47,2),
('Instytut','Stephen King',47,3),
('Komorka','Stephen King',29.9,1),
('Komorka','Stephen King',29.9,2),
('Komorka','Stephen King',29.9,3),
('Worek kosci','Stephen King',37,2),
('Wiedzmin.Sezon Burz','Andrzej Sapkowski',27.83,1),
('Wiedzmin.Tom 1. Ostatnie zyczenie','Andrzej Sapkowski',30.12,1),
('Wiedzmin.Tom 1. Ostatnie zyczenie','Andrzej Sapkowski',30.12,3),
('Wiedzmin.Tom 2. Miecz przeznaczenia','Andrzej Sapkowski',30.24,1),
('Wiedzmin.Tom 2. Miecz przeznaczenia','Andrzej Sapkowski',30.24,3),
('Wiedzmin.Tom 3. Krew elfow','Andrzej Sapkowski',30.11,1),
('Wiedzmin.Tom 3. Krew elfow','Andrzej Sapkowski',30.11,3),
('Wiedzmin.Tom 4. Czas pogardy','Andrzej Sapkowski',30.11,1),
('Wiedzmin.Tom 4. Czas pogardy','Andrzej Sapkowski',30.11,3),
('Wiedzmin.Tom 5. Chrzest ognia','Andrzej Sapkowski',29.71,1),
('Wiedzmin.Tom 5. Chrzest ognia','Andrzej Sapkowski',29.71,3),
('Wiedzmin.Tom 6. Wieza Jaskolki','Andrzej Sapkowski',47.60,1),
('Wiedzmin.Tom 6. Wieza Jaskolki','Andrzej Sapkowski',47.60,3),
('Wiedzmin.Tom 7. Pani Jeziora','Andrzej Sapkowski',30.52,1),
('Wiedzmin.Tom 7. Pani Jeziora','Andrzej Sapkowski',30.52,3),
('Krolestwo','Jo Nesbo',27.12,1),
('Krolestwo','Jo Nesbo',27.12,2),
('Krolestwo','Jo Nesbo',27.12,3),
('Trzeci klucz','Jo Nesbo',32.50,1),
('Trzeci klucz','Jo Nesbo',32.50,2),
('Trzeci klucz','Jo Nesbo',32.50,3),
('Syn','Jo Nesbo',33,1),
('Syn','Jo Nesbo',33,2),
('Syn','Jo Nesbo',33,3),
('Macbeth','Jo Nesbo',33,1),
('Macbeth','Jo Nesbo',33,2),
('Macbeth','Jo Nesbo',33,3),
('Syn','Jo Nesbo',29,3),
('Syn','Jo Nesbo',29,2),
('Ruiny Gorlanu. Cykl Zwiadowcy. Ksiega 1','John Flanagan',32.90,1),
('Plonacy most. Cykl Zwiadowcy. Ksiega 2','John Flanagan',31.50,1),
('Ziemia skuta lodem. Cykl Zwiadowcy. Ksiega 3','John Flanagan',32.90,1),
('Bitwa o Skandie. Cykl Zwiadowcy. Ksiega 4','John Flanagan',37.90,1),
('Czarnoksieznik z Polnocy. Cykl Zwiadowcy. Ksiega 5','John Flanagan',37.90,1),
('Oblezenie Macindaw. Cykl Zwiadowcy. Ksiega 6','John Flanagan',36,1),
('Okup za Eraka. Cykl Zwiadowcy. Ksiega 7','John Flanagan',37,1),
('Krolowie Clonmelu. Cykl Zwiadowcy. Ksiega 8','John Flanagan',37,1),
('Halt w niebezpieczenstwie. Cykl Zwiadowcy. Ksiega 9','John Flanagan',33,1),
('Cesarz Nihon-Ja. Cykl Zwiadowcy. Ksiega 10','John Flanagan',39.90,1),
('Zaginione historie. Cykl Zwiadowcy. Ksiega 11','John Flanagan',39,1),
('Turniej w Gorlanie. Cykl Zwiadowcy Wczesne lata. Ksiega 1','John Flanagan',37.90,1),
('Bitwa na wrzosowiskach. Cykl Zwiadowcy Wczesne lata. Ksiega 2','John Flanagan',39.90,1);

INSERT INTO magazyn (ilosc,id_towaru) VALUES
(7,1),
(10,2),
(15,3),
(30,4),
(12,5),
(16,6),
(17,7),
(47,8),
(9,9),
(3,10),
(9,11),
(20,12),
(11,13),
(19,14),
(21,15),
(10,16),
(16,17),
(13,18),
(19,19),
(20,20),
(5,21),
(3,22),
(9,23),
(8,24),
(7,25),
(3,26),
(4,27),
(13,28),
(15,29),
(21,30),
(31,31),
(34,32),
(29,33),
(25,34),
(32,35),
(27,36),
(7,37),
(3,38),
(5,39),
(37,40),
(7,41),
(11,42),
(13,43),
(7,44),
(19,45),
(7,46),
(9,47),
(7,48),
(18,49),
(3,50),
(2,51),
(0,52),
(0,53);

INSERT INTO sprzedaz (data_sprzedazy,id_towar,id_pracownik,id_klient) VALUES
('1969-06-26',11,1,1),
('1969-12-16',43,1,1),
('1972-07-27',33,1,2),
('1976-04-27',4,2,2),
('1984-01-16',17,2,2),
('1984-11-21',29,2,2),
('1985-01-28',21,2,2),
('1986-07-14',19,3,3),
('1986-11-14',53,3,3),
('1990-07-11',10,3,3),
('1994-06-29',45,3,3),
('1995-05-25',38,4,3),
('1996-05-10',47,4,4),
('1997-03-10',41,4,4),
('1997-07-24',6,4,4),
('1998-11-09',24,5,4),
('2002-06-20',30,5,4),
('2003-09-22',8,5,5),
('2006-07-07',19,5,5),
('2007-10-05',24,5,5),
('2008-08-22',38,6,5),
('2008-11-17',13,6,5),
('2011-02-09',18,6,5),
('2012-12-24',30,6,6),
('2019-07-22',45,6,6),
('1990-05-18',43,6,6),
('1991-04-25',44,7,6),
('1991-09-27',50,7,6),
('1992-04-13',29,7,6),
('1993-02-23',53,7,6),
('1997-02-27',52,8,7),
('2000-12-14',10,8,7),
('2001-06-27',31,8,7),
('2002-05-24',49,8,7),
('2002-08-02',25,8,8),
('2003-01-31',16,9,8),
('2003-10-03',38,9,8),
('2004-03-04',5,9,8),
('2005-06-06',39,9,9),
('2006-08-14',15,10,9),
('2007-10-10',48,10,10),
('2007-11-21',33,10,10),
('2015-09-07',43,10,10),
('2015-10-14',8,10,10),
('2017-01-05',43,11,10),
('2017-07-21',15,11,1),
('2017-09-04',27,11,5),
('2017-12-11',26,11,7),
('2019-06-05',53,12,3),
('2020-04-16',26,12,5),
('2001-09-27',33,13,4),
('2004-02-09',4,13,2),
('2014-09-22',1,13,8);


DELIMITER //
CREATE TRIGGER cena_0_towar
BEFORE INSERT ON towar
FOR EACH ROW
BEGIN
	IF NEW.cena <= 0
    THEN
    SET NEW.cena = NULL;
    END IF;
END
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER powtorz_email_klient
BEFORE INSERT ON klient
FOR EACH ROW
BEGIN
	IF NEW.email IN(SELECT email from klient)
    THEN
    SET NEW.email='nie wlasciwy';
	END IF;
END
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE cena(IN id int,IN cena1 decimal(5,2))
BEGIN
UPDATE towar SET cena = cena1 WHERE id_towar=id;
END
//
DELIMITER ;

#CALL cena(53,49.9)

DELIMITER //
CREATE FUNCTION ile_towarow()
	RETURNS INT
BEGIN
	DECLARE ile INT;
    SELECT COUNT(*) INTO @ile FROM towar;
    RETURN @ile;
END //

select ile_towarow();