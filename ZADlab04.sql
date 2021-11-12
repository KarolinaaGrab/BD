# Lab 04 
Zad 1

alter table walizka drop foreign key walizka_ibfk_1; (tu koniec)
 alter table przetwory drop foreign key przetwory_ibfk_1;
alter table przetwory drop foreign key przetwory_ibfk_2;


ALTER TABLE postac MODIFY id_postaci int;
ALTER TABLE postac DROP PRIMARY KEY;


# Zad 2 tu

ALTER TABLE postac ADD COLUMN pesel CHAR(11) PRIMARY KEY;
ALTER TABLE postac MODIFY rodzaj enum('wiking', 'ptak', 'kobieta', 'syrena');

INSERT INTO postac VALUES
(4, 'Gertruda nieszczera', 'syrena' 1956-05-05, 19);


# Zad 3
select nazwa from postac where nazwa like 'a%';
INSERT INTO statek  WHERE statek='Statek1';

UPDATE statek SET max_ladownosc=max_ladownosc*0,7 
WHERE data_wodowania >= '1901-01-01' and data_wodowania <= '2000-12-31';


#c)??


#ZAd 4
#a)

ALTER TABLE postac MODIFY rodzaj enum('wiking', 'ptak', 'kobieta', 'syrena', 'waz');
INSERT INTO postac VALUES
(5, 'Loko', 'waz','1956-03-03', 3);

#b)

#1 sposob (nie przenosza sie klucze i dane)
desc postac; #(co w tabeli)
create table marynarz like postac;

 #2 sposob TEN - kopia z danymi
 create table marynarz select rodzaj, nazwa, data_ur drom postac;
 #ALIAS
  create table marynarz select rodzaj, nazwa as bohater, data_ur drom postac;
 
 #przenoszenie danych miedzy tabelami + TO
 
 insert into marynarz select * from postac where statek is not null;

#TAK NIE ZADZIALA	
!= null  
#

#c) - tylko gdy create table like postac;









# zad 5
#a)
UPDATE INTO statek 
#b)
ALTER TABLE wiking DROP WHERE nazwa='Jan';
#c)

#d) 
DROP TABLE statek;

#e)
CREATE TABLE zwierz (
id PRIMARY KEY AUTO_INCREMENT,
nazwa VARCHAR,
wiek int unsigned
);
#f)
INSERT INTO zwierz select * from postac WHERE rodzaj=('waz', 'ptak');
