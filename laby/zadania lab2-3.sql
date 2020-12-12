#lab_2
#https://github.com/kropiak/zti_bazy/tree/master/lab_2

#1
SELECT p.imie,p.nazwisko,d.nazwa FROM pracownik p, dzial d
WHERE p.dzial=d.id_dzialu;

#2
SELECT t.nazwa_towaru,t.kategoria,sm.ilosc FROM towar t
JOIN stan_magazynowy sm ON sm.towar=id_towaru ORDER BY sm.ilosc DESC;

#3
SELECT z.* FROM zamowienie z 
JOIN status_zamowienia sm 
ON sm.id_statusu_zamowienia=z.status_zamowienia
WHERE z.status_zamowienia = 6;

#4
SELECT k.* FROM klient k
JOIN adres_klienta ad ON ad.klient=k.id_klienta
WHERE ad.miejscowosc='Olsztyn';

#5
SELECT j_m.nazwa FROM jednostka_miary AS j_m
LEFT JOIN stan_magazynowy AS s_m ON s_m.jm=j_m.id_jednostki
WHERE s_m.jm IS NULL;

#6
SELECT z.id_zamowienia,t.nazwa_towaru,pz.ilosc,pz.cena
FROM pozycja_zamowienia pz
JOIN towar t ON t.id_towaru=pz.towar
JOIN zamowienie z ON z.id_zamowienia=pz.zamowienie
WHERE YEAR(z.data_zamowienia)=2018;

#7
CREATE TABLE towary_full_info
(
	nazwa_towaru VARCHAR(),
    cena_zakupu FLOAT(),
    kategoria(nazwa) VARCHAR(),
    ilosc INT(),
    jednostka_miary(nazwa) VARCHAR()
)

#8
SELECT  * from zamowienie ORDER BY data_zamowienia
ASC LIMIT 5;

#9
SELECT z.* FROM zamowienie z
JOIN status_zamowienia sz
ON sz.id_statusu_zamowienia=z.status_zamowienia
WHERE sz.id_statusu_zamowienia !=5;

#10
SELECT * from adres_klienta
WHERE kod NOT LIKE '__-___';

#lab_3 zadania 1

#1
SELECT imie,nazwisko,YEAR(data_urodzenia)
FROM pracownik;

#2
select imie,nazwisko,
TIMESTAMPDIFF(YEAR,data_urodzenia,CURDATE()) AS 'wiek'
from pracownik;

#3
select d.nazwa,COUNT(p.id_pracownika) AS ilosc from pracownik p
JOIN dzial d on d.id_dzialu=p.dzial
GROUP BY d.nazwa;

#4
select k.nazwa_kategori,COUNT(sm.ilosc) AS 'ilosc' from towar t
JOIN kategoria k ON k.id_kategori=t.kategoria
JOIN stan_magazynowy sm ON sm.towar=t.id_towaru
GROUP BY k.nazwa_kategori;

#5
SELECT k.nazwa_kategori,GROUP_concat('->',t.nazwa_towaru)
FROM kategoria k
JOIN towar t ON t.kategoria=k.id_kategori
GROUP BY k.nazwa_kategori;

#6
SELECT round(AVG(pensja),2) FROM pracownik;

#7
SELECT id_pracownika, AVG(pensja),
TIMESTAMPDIFF(YEAR, data_zatrudnienia, CURDATE()) AS staz
FROM pracownik
WHERE 
TIMESTAMPDIFF(YEAR, data_zatrudnienia, CURDATE()) > 5
GROUP BY id_pracownika;

#8

