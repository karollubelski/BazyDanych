---ZADANIE 1---
a)
SELECT AVG(waga) FROM kreatura WHERE rodzaj='wiking';
b)
SELECT AVG(waga) AS 'srednia waga',COUNT(rodzaj)FROM kreatura GROUP BY rodzaj;
c)
SELECT rodzaj, AVG(2022-YEAR(dataUr)) AS 'sredni wiek' FROM kreatura GROUP BY rodzaj;

---ZADANIE 2---
a)
SELECT rodzaj, SUM(waga) FROM zasob GROUP BY rodzaj;
b)
SELECT nazwa,AVG(waga) FROM zasob WHERE ilosc>=4 GROUP BY nazwa HAVING SUM(waga)>10;
c)
SELECT rodzaj, COUNT(DISTINCT nazwa) FROM zasob WHERE ilosc>1 GROUP BY rodzaj;

---ZADANIE 3---
a)
SELECT kreatura.nazwa, SUM(ekwipunek.ilosc) FROM kreatura JOIN ekwipunek ON kreatura.idKreatury = ekwipunek.idKreatury GROUP BY kreatura.nazwa;
b)
SELECT kreatura.nazwa, zasob.nazwa FROM kreatura JOIN ekwipunek ON kreatura.idKreatury = ekwipunek.idKreatury JOIN zasob 
ON ekwipunek.idZasobu = zasob.idZasobu ORDER BY kreatura.nazwa ASC;
c)
SELECT kreatura.nazwa FROM kreatura LEFT JOIN ekwipunek ON kreatura.idKreatury = ekwipunek.idKreatury WHERE ekwipunek.idKreatury IS NULL;

---ZADANIE 4---
a)
SELECT kreatura.nazwa, zasob.nazwa FROM kreatura NATURAL JOIN ekwipunek JOIN zasob ON ekwipunek.idZasobu = zasob.idZasobu WHERE YEAR(kreatura.dataUr) 
BETWEEN 1670 AND 1679 ORDER BY kreatura.nazwa ASC;
b)
SELECT kreatura.nazwa,zasob.nazwa FROM kreatura NATURAL JOIN ekwipunek JOIN zasob ON ekwipunek.idZasobu = zasob.idZasobu WHERE zasob.rodzaj = 'jedzenie' 
ORDER BY kreatura.dataUr DESC LIMIT 5;
c)
SELECT a.nazwa, b.nazwa FROM kreatura AS a, kreatura AS b WHERE a.idKreatury - b.idKreatury = 5;

---ZADANIE 5---
a)
SELECT kreatura.rodzaj, AVG(zasob.waga * zasob.ilosc) FROM kreatura JOIN ekwipunek ON kreatura.idKreatury = ekwipunek.idKreatury JOIN zasob 
ON ekwipunek.idZasobu = zasob.idZasobu WHERE kreatura.rodzaj NOT IN ('malpa','waz') AND ekwipunek.ilosc < 30 GROUP BY kreatura.rodzaj;
