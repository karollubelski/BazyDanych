---ZADANEI 1---
a)
CREATE TABLE zasob AS SELECT*FROM wikingowie.zasob;
CREATE TABLE kreatura AS SELECT*FROM wikingowie.kreatura;
CREATE TABLE ekwipunek AS SELECT*FROM wikingowie.ekwipunek;

b)
select*from zasob;
desc zasob; --??

c)
SELECT*FROM zasob WHERE rodzaj='jedzenie';

d)
SELECT idZasobu,ilosc FROM ekwipunek WHERE idKreatury IN('1,3,5');
---ZADANIE 2---
a)
SELECT*FROM kreatura WHERE rodzaj !='wiedzma' AND udzwig>=50;
b)
SELECT*FROM zasob WHERE waga BETWEEN 2 AND 5;
c)
SELECT*FROM kreatura WHERE nazwa LIKE '%or%' AND udzwig BETWEEN 30 AND 80; //do 80kg bo nikt nie ma do 70kg

--ZADANIE 3--
a)
SELECT*FROM zasob WHERE MONTH(dataPozyskania) IN(7,8);
b)
SELECT*FROM zasob WHERE rodzaj IS NOT NULL ORDER BY waga ASC;
c)
SELECT*FROM kreatura ORDER BY dataUr ASC LIMIT 5;
--ZADANIE 4--
a)
SELECT DISTINCT rodzaj FROM zasob;
b)
SELECT nazwa,rodzaj FROM kreatura WHERE nazwa LIKE 'wi%';
c)
SELECT ilosc*waga FROM zasob WHERE year(dataPozyskania) BETWEEN 2000 AND 2007; --dobrze
SELECT ilosc*waga FROM zasob WHERE year(dataPozyskania) IN(2000,2007); --tylko w roku 2000 i 2007 -- zle


--- ZADANIE 5 ---
a) 
SELECT waga*0.7 AS 'masa netto', waga*0.3 AS 'waga odpadu' FROM zasob;
b) 
SELECT*FROM zasob WHERE rodzaj IS NULL;
c)
SELECT DISTINCT rodzaj FROM zasob WHERE nazwa LIKE 'Ba%' OR nazwa LIKE '%os' ORDER BY rodzaj ASC;


