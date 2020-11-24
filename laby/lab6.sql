#lab6
#zad1

#1
SELECT AVG(waga) AS 'srednia waga' FROM kreatura WHERE rodzaj='wiking';
#2
SELECT AVG(waga) AS 'srednia waga',COUNT(rodzaj),rodzaj FROM kreatura GROUP BY rodzaj;
#3
SELECT AVG(YEAR(dataUr)),rodzaj FROM kreatura GROUP rodzaj;
#zad2

#1
SELECT SUM(waga),rodzaj FROM zasob GROUP BY rodzaj;
#2
SELECT AVG(waga),COUNT(*),rodzaj FROM zasob GROUP BY rodzaj HAVING COUNT(*)>=4 AND AVG(waga)>10;
#3
SELECT COUNT(DISTINCT(nazwa)),rodzaj FROM zasob WHERE ilosc>1 GROUP BY rodzaj;
#zad3

#1
SELECT COUNT(ekwipunek.ilosc),kreatura.rodzaj FROM ekwipunek,kreatura WHERE kreatura.idKreatury=ekwipunek.idKreatury GROUP BY kreatura.rodzaj;
#sposob INNER JOIN
SELECT COUNT(ekwipunek.ilosc),kreatura.rodzaj FROM kreatura INNER JOIN ekwipunek ON kreatura.idKreatury=ekwipunek.idKreatury GROUP BY kreatura.rodzaj;

#2
SELECT kreatura.nazwa,zasob.nazwa from kreatura,ekwipunek,zasob WHERE kreatura.Idkreatury=ekwipunek.Idkreatury AND ekwipunek.idzasobu=zasob.idzasobu ORDER BY kreatura.nazwa;
#opcja INNER JOIN
SELECT kreatura.nazwa,zasob.nazwa from kreatura INNER JOIN ekwipunek ON kreatura.Idkreatury=ekwipunek.Idkreatury  INNER JOIN zasob ON ekwipunek.idzasobu=zasob.idzasobu ORDER BY kreatura.nazwa;
#3
SELECT k.nazwa, k.idKreatury,e.idKreatury FROM kreatura k LEFT JOIN ekwipunek e ON k.idKreatury=e.idKreatury WHERE e.idKreatury IS NOT NULL;
# LEFT JOIN= NULL po prawej stronie jesli nie spelniono warunku WHERE ... IS NOT NULL nie wyswietli bez dopasowania