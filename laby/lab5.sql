#lab 05
#zad1
#1
CREATE TABLE kreatura SELECT * FROM wikingowie.kreatura;
CREATE TABLE zasob SELECT * FROM wikingowie.zasob;
CREATE TABLE ekwipunek SELECT * FROM wikingowie.ekwipunek;
lub
CREATE TABLE kreatura AS SELECT * FROM wikingowie.kreatura;
#2
SELECT * FROM zasob;
#3
SELECT * FROM zasob WHERE rodzaj='jedzenie';
#4
SELECT idZasobu,ilosc FROM zasob WHERE idZasobu='1' OR idZasobu='3' OR idZasobu='5';
#zad2
#1
SELECT nazwa FROM kreatura WHERE rodzaj <> 'wiedzma' AND udzwig < 50;
#2
SELECT nazwa FROM zasob WHERE waga BETWEEN 2 AND 5;
#3
SELECT nazwa FROM kreatura WHERE nazwa LIKE %or% AND udzwig BETWEEN 30 AND 70;
#zad3
#1
SELECT nazwa FROM zasob WHERE MONTH(dataPozyskania) BETWEEN 7 AND 8;
#2
SELECT * FROM zasob WHERE rodzaj !='' ORDER BY waga ASC;
#3
SELECT * FROM kreatura ORDER BY dataUr LIMIT 5;
SELECT * FROM kreatura ORDER BY dataUr LIMIT 0,5;
#0-nr indexu 5-dlugosc
#zad 4
#1
SELECT distinct(rodzaj) From zasob;
#2
SELECT concat(nazwa,' ',rodzaj) FROM kreatura WHERE rodzaj LIKE 'wi%';
#3
SELECT nazwa, ilosc*waga AS 'calkowita waga',YEAR(dataPozyskania) AS 'rok pozyskania' FROM zasob WHERE YEAR(dataPozyskania) BETWEEN 2000 AND 2007;
#zad5
#1
SELECT waga*0.3 AS '30%',(waga-waga*0.3),ilosc FROM zasob WHERE rodzaj='jedzenie';
#2
SELECT * FROM zasob WHERE rodzaj IS NULL;
#3
SELECT DISTINCT(rodzaj),nazwa FROM zasob WHERE nazwa LIKE 'Ba%' OR nazwa LIKE '%os' ORDER BY nazwa;
