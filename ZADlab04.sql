# Lab 04 
Zad 1

DELETE FROM postac WHERE rodzaj='wiking' AND nazwa!='Bjorn' ORDER BY data_ur ASC LIMIT 2;

alter table postac drop foreign key postac_ibfk_1;
alter table walizka drop foreign key walizka_ibfk_1; 
 alter table przetwory drop foreign key przetwory_ibfk_1;
alter table przetwory drop foreign key przetwory_ibfk_2;


ALTER TABLE postac MODIFY id_postaci int;
ALTER TABLE postac DROP PRIMARY KEY;


# Zad 2 tu

ALTER TABLE postac ADD COLUMN pesel CHAR(11) not null;
update postac set pesel='12345678900'+id_postaci;
alter table postac ADD PRIMARY KEY(pesel);

ALTER TABLE postac MODIFY rodzaj enum('wiking', 'ptak', 'kobieta', 'syrena');


INSERT INTO postac (id_postaci, nazwa, rodzaj, data_ur, wiek, pesel) VALUES 
(9, 'Gertruda nieszczera', 'syrena', '1956-05-05', 19, '12345678909');

# Zad 3
# select * from postac where nazwa like 'a%'
update postac set statek='Ekipa' where rodzaj ='wiking' and nazwa like '%a%';

UPDATE statek SET max_ladownosc=max_ladownosc*0.7 WHERE data_wodowania BETWEEN '1901-01-01' and '2000-12-31';


#c)
ALTER TABLE postac ADD CHECK (wiek<=1000);

#ZAd 4
#a)

ALTER TABLE postac MODIFY rodzaj enum('wiking', 'ptak', 'kobieta', 'syrena', 'waz');
INSERT INTO postac (id_postaci, nazwa, rodzaj, data_ur, wiek, pesel) VALUES
(5, 'Loko', 'waz','1956-03-03', 3, 12345678905);

#b)

create table marynarz like postac;
#############################
 create table marynarz select rodzaj, nazwa, data_ur drom postac;
 #ALIAS
  create table marynarz select rodzaj, nazwa as bohater, data_ur drom postac;
 
 #przenoszenie danych miedzy tabelami + TO
 ###############################
 insert into marynarz select * from postac where statek is not null;

#TAK NIE ZADZIALA	
!= null  
#

#c) - tylko gdy CREATE TABLE marynarz SELECT * FROM postac;
Tworzy nową tabelę o nazwie marynarz o strukturze tabeli postac (ale bez kluczy) 
i wstawia do niej dane wybrane poleceniem SELECT.




# zad 5
#a)
UPDATE postac set statek = NULL;
#b)
DELETE FROM postac WHERE nazwa='Jan';
DELETE FROM marynarz WHERE nazwa='Jan';
#c)
DELETE FROM statek;
#d) 
DROP TABLE statek;

#e)
CREATE TABLE zwierz (
id int PRIMARY KEY AUTO_INCREMENT,
nazwa VARCHAR(50),
wiek int
);
f)
INSERT INTO zwierz select id_postaci, nazwa, wiek from postac WHERE rodzaj='waz' or rodzaj='ptak';
