--1 Tabela--

CREATE TABLE zadanie (id_postaci INT NOT NULL PRIMARY KEY AUTO_INCREMENT, nazwa VARCHAR(40), rodzaj ENUM('wiking','ptak','kobieta'), data_ur DATE, wiek INT UNSIGNED);
INSERT INTO postac (id_postaci, nazwa, rodzaj, data_ur, wiek) VALUES('0','Bjorn','wiking','1997-03-21','25');
INSERT INTO postac (id_postaci, nazwa, rodzaj, data_ur, wiek) VALUES('2','Drozd','ptak','2021-04-11','1');
INSERT INTO postac (id_postaci, nazwa, rodzaj, data_ur, wiek) VALUES('3','Tesciowa','kobieta','1949-07-07','73');
UPDATE postac SET wiek=88 WHERE nazwa='tesciowa');


--2 Tabela--
CREATE TABLE walizka(id_walizki int not null auto_increment PRIMARY KEY,pojemnosc INT UNSIGNED not null, kolor ENUM("rozowy","czerwony","teczowy","zolty"),id_wlasciciela INT, FOREIGN KEY(id_wlasciciela)REFERENCES postac(id_postaci) ON DELETE CASCADE);
ALTER TABLE walizka ALTER COLUMN kolor SET DEFAULT "rozowy";
INSERT INTO walizka(id_walizki,pojemnosc,kolor,id_wlasciciela) VALUES('0','5','rozowy','1');
INSERT INTO walizka(id_walizki,pojemnosc,kolor,id_wlasciciela) VALUES('0','10','zolty','3');

--3 Tabela--
CREATE TABLE izba(adres_budynku VARCHAR(50), nazwa_izby VARCHAR(50), metraz INT UNSIGNED, wlasciciel INT, FOREIGN KEY(wlasciciel) REFERENCES postac(id_postaci) ON DELETE SET NULL, PRIMARY KEY(adres_budynku,nazwa_izby));
ALTER TABLE izba ADD COLUMN kolor_izby VARCHAR(40) AFTER metraz;
ALTER TABLE izba ALTER COLUMN kolor_izby SET DEFAULT "czarny";
INSERT INTO izba VALUES("Basniowa 69","spizarnia","69","czarny","1");

--4 Tabela--
CREATE TABLE przetwory(id_przetworu INT AUTO_INCREMENT PRIMARY KEY, rok_produkcji YEAR, id_wykonawcy INT, zawartosc VARCHAR(50),dodatek VARCHAR(50) DEFAULT "papryczka chili", id_konsumenta INT, FOREIGN KEY(id_wykonawcy) REFERENCES postac(id_postaci),FOREIGN KEY(id_konsumenta) REFERENCES postac(id_postaci));
ALTER TABLE przetwory ALTER COLUMN rok_produkcji SET DEFAULT "1927";


--5 Tabela--
NSERT INTO postac VALUES("0","Mateusz","wiking","1969-06-09","53");
INSERT INTO postac VALUES("0","Maksymilian","wiking","1977-11-10","45");
INSERT INTO postac VALUES("0","Maciek","wiking","1993-01-09","29");
INSERT INTO postac VALUES("0","Dawid", "wiking","1991-01-07","31");
INSERT INTO postac VALUES("0","Tomasz","wiking","1983-08-21","39");
CREATE TABLE statek (nazwa_statku VARCHAR(60) PRIMARY KEY, rodzaj_statku ENUM("okret","langskip"), data_wodowania DATE,ladownosc INT UNSIGNED);
INSERT INTO statek VALUES("Statek1","okret","2022-11-05","2137");
INSERT INTO statek VALUES("Statek2","langskip","2022-11-11","2115");
ALTER TABLE postac ADD COLUMN funkcja AFTER rodzaj;
ALTER TABLE postac ADD FOREIGN KEY(statek) REFERENCES statek(nazwa_statku);
DELETE FROM izba WHERE nazwa_izby="spizarnia";
DROP TABLE izba;


