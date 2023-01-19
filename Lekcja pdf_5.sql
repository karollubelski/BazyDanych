-- ZADANIE 1 --
a)
CREATE TABLE uczestnicy SELECT * FROM wikingowie.uczestnicy;
CREATE TABLE etapy_wyprawy SELECT * FROM wikingowie.etapy_wyprawy;
CREATE TABLE sektor SELECT * FROM wikingowie.sektor;
CREATE TABLE wyprawa SELECT * FROM wikingowie.wyprawa;
b)
SELECT kreatura.nazwa FROM kreatura WHERE idKreatury NOT IN (SELECT id_uczestnika FROM uczestnicy WHERE id_uczestnika GROUP BY id_uczestnika);
lub
SELECT kreatura.nazwa FROM kreatura LEFT JOIN uczestnicy ON kreatura.idKreatury=uczestnicy.id_uczestnika WHERE uczestnicy.id_uczestnika IS NULL;
3)
SELECT wyprawa.nazwa, SUM(ilosc) as ilosc_ekwipunku FROM uczestnicy JOIN wyprawa ON wyprawa.id_wyprawy=uczestnicy.id_wyprawy JOIN ekwipunek 
ON ekwipunek.idKreatury=uczestnicy.id_uczestnika GROUP BY wyprawa.id_wyprawy;


-- ZADANIE 2 --
a)
SELECT wyprawa.nazwa, COUNT(uczestnicy.id_uczestnika) as liczba_uczestnikow, GROUP_CONCAT(kreatura.nazwa) as nazwa_uczestnikow FROM uczestnicy 
JOIN kreatura ON kreatura.idKreatury=uczestnicy.id_uczestnika JOIN wyprawa ON wyprawa.id_wyprawy=uczestnicy.id_wyprawy GROUP BY uczestnicy.id_wyprawy;
b)
SELECT wyprawa.nazwa, sektor.nazwa FROM etapy_wyprawy JOIN sektor ON sektor.id_sektora=etapy_wyprawy.sektor JOIN wyprawa ON wyprawa.id_wyprawy=etapy_wyprawy.idWyprawy
ORDER BY wyprawa.data_rozpoczecia, wyprawa.data_rozpoczecia;


-- ZADANIE 3 --
a)
SELECT sektor.nazwa, COUNT(sub.sektor) as ilosc_odwiedzin FROM sektor LEFT JOIN (SELECT etapy_wyprawy.sektor FROM etapy_wyprawy GROUP BY sektor) sub 
ON sektor.id_sektora=sub.sektor GROUP BY sektor.id_sektora;
b)
SELECT kreatura.nazwa, CASE WHEN sub.liczba > 0 THEN "bral udzial w wyprawie" WHEN IFNULL(sub.liczba,0) = 0 THEN "nie bral udzialu w wyprawie" 
END AS opis FROM kreatura LEFT JOIN (SELECT uczestnicy.id_uczestnika, COUNT(uczestnicy.id_uczestnika) AS liczba FROM uczestnicy GROUP BY id_uczestnika) sub 
ON kreatura.idKreatury=sub.id_uczestnika;


-- ZADANIE 4 --
a)
SELECT wyprawa.nazwa, SUM(LENGTH(etapy_wyprawy.dziennik)) AS liczba_znakow FROM etapy_wyprawy JOIN wyprawa ON
etapy_wyprawy.idWyprawy=wyprawa.id_wyprawy GROUP BY wyprawa.id_wyprawy HAVING liczba_znakow < 400;
b)
SELECT sub.id_wyprawy, ROUND(sub.laczna_waga/COUNT(uczestnicy.id_wyprawy),2) AS srednia_waga_zasobu FROM uczestnicy JOIN (SELECT uczestnicy.id_wyprawy,
SUM(ekwipunek.ilosc*zasob.waga) AS laczna_waga FROM uczestnicy JOIN ekwipunek ON ekwipunek.idKreatury=uczestnicy.id_uczestnika 
JOIN zasob ON zasob.idZasobu=ekwipunek.idZasobu GROUP BY uczestnicy.id_wyprawy) sub ON sub.id_wyprawy=uczestnicy.id_wyprawy GROUP BY id_wyprawy;


-- ZADANIE 5 --
a)
SELECT sub3.nazwa, sub3.wiek_w_dniach FROM uczestnicy JOIN (SELECT etapy_wyprawy.idWyprawy, SUM(CASE WHEN etapy_wyprawy.sektor=7 THEN 1 ELSE 0 END)
AS czy_przechodzil FROM etapy_wyprawy GROUP BY etapy_wyprawy.idWyprawy HAVING czy_przechodzil > 0) sub ON sub.idWyprawy=uczestnicy.id_wyprawy 
LEFT JOIN (SELECT kreatura.nazwa, uczestnicy.id_wyprawy, uczestnicy.id_uczestnika, DATEDIFF(wyprawa.data_rozpoczecia, kreatura.dataUr) AS wiek_w_dniach
FROM uczestnicy JOIN wyprawa ON uczestnicy.id_wyprawy=wyprawa.id_wyprawy JOIN kreatura ON kreatura.idKreatury=uczestnicy.id_uczestnika) sub3 
ON uczestnicy.id_uczestnika=sub3.id_uczestnika AND sub.idWyprawy=sub3.id_wyprawy;
