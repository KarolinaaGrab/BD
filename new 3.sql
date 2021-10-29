# Zadanie 1

SELECT * FROM osoba;

CREATE TABLe postac (
id_postaci int primary key auto_increment,
nazwa varchar(40) not null,
rodzaj enum('wiking','ptak','kobieta'),
data_ur date,
wiek int(3) unsigned
);


select * from postac;
select nazwa from postac;
 insert into postac(nazwa) values('Gargamel');
 insert into postac(nazwa) values('Bjorn');
insert into postac(nazwa) values('Drozd');
insert into postac(nazwa) values('Tesciowa');


INSERT INTO Gargamel(imie, nazwisko, wiek) VALUES('Gargamel', 'Kowalski', 35);
INSERT INTO Drozd(imie, nazwisko, wiek) VALUES('Drozd', 'Kwas', 36);
INSERT INTO Bjorn(imie, nazwisko, wiek) VALUES('Bjorn', 'Lewandowski', 25);
INSERT INTO Tesciowa(imie, nazwisko, wiek) VALUES('Bjorn', 'Lewandowski', 25);

UPDATE Tesciowa SET wiek=88;

# Zad 2
CREATE TABLE walizka (id_walizki int auto_increment primary key,
pojemnosc int unsigned,
kolor set('rozowy','czerwony','teczowy','zolty'),
id_wlasciciela int,
foreign key (id_wlasciciela) references postac(id_postaci) on delete cascade
);


# zad 3
CREATE TABLE adres_budynku (id_adres_budynku int
CREATE TABLE nazwa_izby (id_nazwa_izby int),
metraz int unsigned,
wlasciciel FOREIGN KEY (postac) REFERENCES postac(id_postaci),
)
ALTER TABLE izba ADD COLUMN kolor izby AFTER metraz;



# Zad 4
CREATE TABLE przetwory (id_przetworu primary key, 
rok_produkcji int(4), default 1654,
id_wykonawcy
zawartosc
dodatek
id_konsumenta FOREIGN KEY (postac) REFERENCES postac(id_postaci)),




# Zad 5





drop table spizarnia from izba;
delete izba;