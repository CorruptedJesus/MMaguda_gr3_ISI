#lab7

#zad1
#2
SELECT k.nazwa FROM kreatura k LEFT JOIN uczestnicy u ON  k.idKreatury=u.id_uczestnika WHERE u.id_uczestnika IS NULL;
#3
SELECT w.nazwa, SUM(e.ilosc) FROM wyprawa w
INNER JOIN uczestnicy  u ON u.id_wyprawy=w.id_wyprawy
INNER JOIN kreatura k ON u.id_uczestnika=k.idKreatury
INNER JOIN ekwipunek e ON e.idKreatury=k.idKreatury
GROUP BY w.nazwa;

#zad2
#1
SELECT w.nazwa, COUNT(u.id_uczestnika) AS liczba_uczestnikow, GROUP_CONCAT(k.nazwa) AS uczestnicy FROM wyprawa AS w
JOIN uczestnicy AS u ON w.id_wyprawy=u.id_wyprawy
JOIN kreatura AS k ON k.idKreatury=u.id_uczestnika
GROUP BY w.nazwa;
#2
SELECT ew.idEtapu, s.nazwa, w.data_rozpoczecia, w.kierownik FROM etapy_wyprawy AS ew
JOIN sektor AS s ON s.id_sektora=ew.sektor
JOIN wyprawa AS w ON w.id_wyprawy=ew.idWyprawy
ORDER BY w.data_rozpoczecia, ew.kolejnosc;

#zad3
#1
SELECT sektor.nazwa,COUNT(etapy_wyprawy.sektor) AS ilosc_odwiedzin FROM sektor LEFT JOIN etapy_wyprawy ON sektor.id_sektora=etapy_wyprawy.sektor GROUP BY sektor.nazwa ;
#2
SELECT DISTINCT(kreatura.nazwa),IF(uczestnicy.id_wyprawy IS NULL,"Nie bral udzialu w wyprawie","bral udzialu w wyprawie") FROM kreatura LEFT JOIN uczestnicy ON kreatura.Idkreatury=uczestnicy.id_uczestnika   ORDER BY kreatura.nazwa;

#zad4
#1
SELECT w.nazwa,SUM(length(ew.dziennik)) AS suma FROM wyprawa AS w,etapy_wyprawy AS ew where ew.idWyprawy=w.id_wyprawy GROUP BY w.nazwa HAVING suma<400 ;
#2
SELECT w.nazwa,COUNT(DISTINCT(u.id_uczestnika)),
SUM(e.ilosc*z.waga)/COUNT(DISTINCT(u.id_uczestnika)) AS "średnia waga"
FROM wyprawa AS w
LEFT JOIN uczestnicy AS u ON w.id_wyprawy = u.id_wyprawy
LEFT JOIN kreatura AS k ON u.id_uczestnika = k.idKreatury
LEFT JOIN ekwipunek AS e ON k.idKreatury= e.idKreatury
LEFT JOIN zasob AS z ON e.idZasobu = z.idZasobu
GROUP BY w.nazwa;

#zad5
#1
SELECT k.nazwa, DATEDIFF(w.data_rozpoczecia, k.dataUr) AS wiek FROM wyprawa AS w
JOIN uczestnicy AS u ON w.id_wyprawy = u.id_wyprawy
JOIN kreatura AS k ON u.id_uczestnika = k.idKreatury
JOIN etapy_wyprawy AS ew ON w.id_wyprawy=ew.idWyprawy
WHERE ew.sektor = 7;