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

# podzapytanie

#wyświetl wszystkie idKreatury z tabeli kreatura
#gdzie to idKreatury nie występuje w tabeli
#ekwipunek;
SELECT idKreatury FROM kreatura WHERE idKreatury
NOT IN (SELECT idKreatury FROM ekwipunek
WHERE idKreatury IS NOT NULL);

#zad4
#1
##NATURAL JOIN pomija kolumny ktore nazwy sie powtarzaja{ten sam typ}
SELECT kreatura.nazwa,zasob.nazwa FROM kreatura NATURAL JOIN ekwipunek INNER join zasob ON zasob.idzasobu = ekwipunek.idzasobu WHERE kreatura.rodzaj='wiking' AND YEAR(kreatura.dataUr) BETWEEN 1670 AND 1680 ;
#2
SELECT k.nazwa FROM kreatura k,ekwipunek e,zasob z WHERE k.idKreatury=e.idKreatury AND e.idZasobu=z.idZasobu AND z.rodzaj='jedzenie' ORDER BY YEAR(k.dataUr) DESC LIMIT 5;
#lub
SELECT k.nazwa, e.idZasobu, z.nazwa, k.dataUr FROM kreatura AS k NATURAL JOIN ekwipunek AS e JOIN zasob z ON e.idZasobu=z.idZasobu WHERE z.rodzaj = 'jedzenie' ORDER BY dataUr DESC LIMIT 5;
#3
SELECT CONCAT(k1.nazwa,'-',k2.nazwa) FROM kreatura k1, kreatura k2 WHERE k1.idKreatury-k2.idKreatury=5 OR k1.idKreatury+k2.idKreatury=5;
#lub
SELECT CONCAT(tabk1.nazwa, " - ", tabk2.nazwa) FROM kreatura AS tabk1, kreatura AS tabk2
WHERE tabk1.idKreatury - tabk2.idKreatury=5;

#zad5
#1
SELECT k.rodzaj,AVG(z.waga) FROM kreatura k, zasob z ,ekwipunek e WHERE k.idKreatury=e.idKreatury AND e.idZasobu=z.idZasobu AND k.rodzaj <>'malpa' OR k.rodzaj <>'waz' AND z.ilosc <30 GROUP BY k.rodzaj;
#2
#DO DOMU
SELECT k.rodzaj,k.nazwa,MIN(k.dataUr) FROM kreatura k UNION SELECT k.rodzaj,k.nazwa,MAX(k.dataUr) FROM kreatura k;
