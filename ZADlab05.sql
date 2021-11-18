#lab 05
#zad 1
przypadek 1 - baza imienna (aktywna)
1) CREATE TABLE kreatura SELECT * FROM wikingowie.kreatura;

Przypadek 2 - aktywna baza to baza wikingowie
CREATE TABLE grabowskak.kreatura select * from kreatura;
CREATE TABLE grabowskak.zasob select * from zasob;
CREATE TABLE grabowskak.ekwipunek select * from ekwipunek;

2)
SELECT * from zasob;
3) 
SELECT * from zasob where rodzaj='jedzenie';

4) 
select idZasobu, ilosc from ekwipunek WHERE idKreatury IN (1,3,5);

#############
.... wHERE idPostaci=1 or idPostaci=2 ...
... WHERE idPostaci IN (1,2)...
#############


Zad 2
select * from kreatura where rodzaj!='wiedzma' and udzwig >=50;
select * from zasob where waga BETWEEN  2 and 5;
select * from kreatura where nazwa like '%or%' and udzwig BETWEEN 30 and 70;

Zad 3
###### - pokazuje tylko miesiąc pozyskania zasobu
select month(dataPozyskania) from zasob; 
######

select nazwa, dataPozyskania from zasob where month(dataPozyskania) in (7,8);

select * from zasob where rodzaj is not null order by waga asc;

select * from kreatura order by dataUr asc limit 5;

#############
...Limit 5;
... Limit 5,5;   #indeks start, ile elementow (zacznij od indeksu 5 i podaj 5 kol elementow)
#############

Zad 4
1) select distinct rodzaj from zasob; #bez powtorzen - ujnikalne rodzaje zasobow

################## albo funkcja distinct
select distinct(rodzaj) from zasob; - ten sam efekt
select distinct rodzaj, nazwa from zasob; - sprawdza unikalne wartosci z tych wskazanych kolumn
##################

2) #concat(łańcuch znaków, łańcuch znajów, ...)
select concat ('Ala ma kota, o imieniu', nazwa) as wierszyk from kreatura;
############


select concat (nazwa,'-', rodzaj) from kreatura where rodzaj like 'Wi%';

3)
select (waga*ilosc) from zasoby WHERE (year)dataPozyskania BETWEEN 2000 and 2007;


Zad 5
1)
select nazwa, (waga*0.7) as netto, (waga*0.3) as odpadki from zasob where rodzaj='jedzenie';

2)
select * from zasob where rodzaj is null;

3)
select distinct rodzaj, nazwa from zasob where nazwa like 'Ba%' or nazwa like '%os' order by rodzaj asc;
