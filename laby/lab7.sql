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