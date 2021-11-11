# zad1 

CREATE TABLE postac (
id_postaci int PRIMARY KEY AUTO_INCREMENT, 
nazwa VARCHAR(40) not null, 
rodzaj enum('wiking','ptak','kobieta'),
data_ur date,
wiek int(3) unsigned
);

INSERT INTO postac VALUES
(1, 'Bjorn', 'wiking', '1945-12-12', 30),
(2, 'Drozd', 'ptak', '1970-12-12', 5),
(3, 'Tesciowa', 'kobieta', '1930-10-10', 45);

UPDATE postac SET wiek=88 WHERE nazwa='Tesciowa';

# zad 2

CREATE TABLE walizka (
id_walizki int PRIMARY KEY AUTO_INCREMENT,
pojemnosc int unsigned,
kolor enum('rozowy', 'teczowy', 'zolty'),
id_wlasciciela int,
 FOREIGN KEY (id_wlasciciela) REFERENCES postac(id_postaci) on delete cascade);

ALTER TABLE walizka ALTER kolor SET DEFAULT 'rozowy';

INSERT INTO walizka VALUES
(default, 15, 'zolty', 1),
(default, 20, 'rozowy', 3);

# 3

CREATE TABLE izba (
adres_budynku VARCHAR(40) not null,
nazwa_izby VARCHAR (40) not null,
 PRIMARY KEY (adres_budynku, nazwa_izby),
metraz int unsigned,
wlasciciel int,
FOREIGN KEY (wlasciciel) REFERENCES postac (id_postaci) on delete set null);

INSERT INTO izba VALUES
('sienkiewicza 3', 'spizarnia', 40, 1);

ALTER TABLE izba ADD kolor VARCHAR(40) default 'czarny' after metraz;
# 4

CREATE TABLE przetwory (
id_przetworu int PRIMARY KEY,
rok_produkcji int(4) default '1654',
id_wykonawcy int,
FOREIGN KEY (id_wykonawcy) REFERENCES postac (id_postaci),
zawartosc VARCHAR(40),
dodatek VARCHAR(40) default 'papryczka chilli',
id_konsumenta int,
FOREIGN KEY (id_konsumenta) REFERENCES postac (id_postaci));

INSERT INTO przetwory (id_przetworu, zawartosc) VALUES
(1, 'bigos');

# 5

INSERT INTO postac VALUES
(default, 'Jan','wiking','2020-01-02',48),
(default, 'Piotr', 'wiking', '1999-05-05', 24),
(default, 'Jonasz', 'wiking', '2002-06-24', 19),
(default, 'Adam', 'wiking', '1984-07-15', 42),
(default, 'Witold', 'wiking', '1999-09-19', 21);

CREATE TABLE statek (
nazwa_statku VARCHAR(40) PRIMARY KEY,
rodzaj_statku enum('wojenny','handlowy','pasazerski'),
data_wodowania DATE,
max_ladownosc int unsigned);

INSERT INTO statek VALUES
('Ogien', 'wojenny', '1923-10-12', 40),
('Ekipa', 'pasazerski', '1929-10-10', 25);

ALTER TABLE postac ADD COLUMN funkcja VARCHAR(40);

UPDATE postac SET funkcja='kapitan' WHERE nazwa='Bjorn';

ALTER TABLE postac ADD statek VARCHAR(40);
ALTER TABLE postac ADD FOREIGN KEY(statek) REFERENCES statek(nazwa_statku);
UPDATE postac SET statek='Ogien' WHERE nazwa 'Bjorn';

UPDATE postac SET statek='Ekipa' WHERE rodzaj='wiking';
UPDATE postac SET statek='Ogien' WHERE nazwa='Bjorn';

DELETE FROM izba WHERE nazwa_izby='spizarnia';
DROP TABLE izba;
