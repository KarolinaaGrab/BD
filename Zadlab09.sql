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
4) 
select towar from stan_magazynowy where ilosc>10;

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
select from towar t
inner join stan_magazynowy sm on sm.towar=t.id_towaru
where sm.jm='szt'
order by t.cena_zakupu desc;


use grabowskak;
11)
CREATE TABLE towary_pozywej_100 SELECT * FROM towar where cena_zakupu>=100;  
12)
create table pracownik_50_plus like pracownik;
INSERT INTO pracownik_50_plus SELECT * FROM pracownik WHERE YEAR(curdate()-YEAR(data_urodzenia))>=50;


Zad - czesc 2 
1) pracownik dzial
select p.imie, p.nazwisko, d.nazwa from pracownik p
left join dzial d on d.id_dzialu=p.dzial;

2) towar stan magazynowy i kategoria
select t.nazwa_towaru, k.nazwa_kategori, sm.ilosc from towar t
inner join stan_magazynowy sm on sm.towar=t.id_towaru
inner join kategoria k k.id_kategori=t.id_towaru
order by sm.ilosc desc;

3) 


4)klient adresklienta
select * from klient k
inner join adres_klienta ak on ak.klient=k.id_klienta
where ak.miejscowosc='Olsztyn';


5)
select sm.jm from stan_magazynowy sm



6)zamowienie towar stan magazynowy 

select from towar t
left join  


7)
create table towary_full_info (
  nazwa_towaru, cena_zakupu, kategoria(nazwa),ilosc , jednostka miary(nazwa)

8)
select pz.id_pozycji from pozycja_zamowienia pz
left join zamowienie z where z.id_zamowienia=pz.zamowienie
order by data_zamowienia asc limit 5;

9)
select * from zamowienie z
left join status_zamowienia sz on sz.id_statusu_zamowienia = z.status_zamowienia
where nazwa_statusu_zamowienia not like 'zrealizowane';

10) wyarazenia regularne {}-ilosc powtorzen
select * from adresy_klienta
where kod not regexp '[0-9]{2}-[0-9]{3}';
[a-zA-Z] - male duze litery 
