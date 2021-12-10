# Zad 4 b) lab 7

select u.id_wyprawy, u.id_uczestnika, round(sum(e.ilosc*z.waga)/count(distinct u.id_uczestnika)), 2)
from uczestnicy u
left join ekwipunek e on u.id_uczestnika=e.idKreatury
left join zasob z z.idZasobu=e.idZasobu
group by u.id_wyprawy;

#lab 2 zti
#zadania - czesc 1

select nazwisko from pracownik order by nazwisko asc;

2)
select imie, nazwisko, pensja from pracownik where YEAR(data_urodzenia)>1979;
3)
select * from pracownik where pensja between 3500 and 5000;
4) ?
select * from stan_magazynowy where ilosc > 10

select t.nazwa from stan_magazynowy sm where ilosc > 10
inner join towar t on t.id_towaru=sm.towar;

5)
select * from towar where nazwa_towaru like 'A%' or nazwa_towaru like 'B%' or nazwa_towaru like 'C%';

6)
select * from klient where czy_firma=0;

7)
select * from zamowienie where order by data_zamowienia desc limit 10;

8)
select * from pracownik order by pensja asc limit 5;
9)
select * from towar where nazwa_towaru not like '%a%' order by cena_zakupu desc limit 10;
10)?
select * from towar t
inner join stan_magazynowy sm on t.id_towaru=sm.towar
where sm.jm='szt' order by t.nazwa_towaru asc, t.cena_zakupu desc;

11)
CREATE TABLE towary_pozywej_100 SELECT * FROM towar where cena_zakupu>=100;  
12)
create table pracownik_50_plus like 


Zad - czesc 2 
1)
select imie, nazwisko









10) wyarazenia regularne {}-ilosc powtorzen
select * from adresy_klienta
where kod not regexp '[0-9]{2}-[0-9]{3}';
[a-zA-Z] - male duze litery 
