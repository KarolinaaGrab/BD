#zad1
1)
select avg(waga) FROM kreatura where rodzaj='wiking';

2)
select rodzaj, avg(waga), count(rodzaj)  FROM kreatura group by rodzaj;


########
Warunki dla kolumn zagregowanych
Do tej pory warunki określaliśmy w części WHERE to dla kolumn, na których używamy funkcji agregujących musimy to zrobić przez HAVING.
np. SELECT dzial, count(dzial) FROM pracownik GROUP BY dzial HAVING count(dzial) > 2;

Grupowanie danych polega na ich złączaniu w zbiory o 
tej samej wartości w kolumnie (kolumnach), które zostały określone jako parametr wyrażenia GROUP BY
############

3)
select rodzaj, avg(YEAR(CURDATE())-YEAR(dataUr)) AS 'sredni wiek' FROM kreatura GROUP BY rodzaj;

#zad2
1)
select rodzaj, sum(waga) as 'waga' from zasob group by rodzaj;

2)
select nazwa, avg(waga) from zasob where ilosc>=4 group by nazwa having sum(waga)>10;

########
Poniższy przykład wyświetli id działu, jego liczebność, jeżeli ta liczebność jest wieksza niż 
2. Kolejność GROUP BY i HAVING nie jest przypadkowa.

SELECT dzial, count(dzial) FROM pracownik GROUP BY dzial HAVING count(dzial) > 2;

#########

3)
select rodzaj, count(distinct(nazwa)) from zasob group by rodzaj having sum(ilosc)>1;

#Zad 3
1)
SELECT kreatura.nazwa, sum(ekwipunek.ilosc) 
FROM kreatura, ekwipunek 
WHERE kreatura.idKreatury=ekwipunek.idKreatury 
GROUP BY kreatura.idKreatury; 

2)
SELECT k.nazwa, z.nazwa
FROM kreatura k
INNER JOIN ekwipunek e
ON k.idKreatury=e.idKreatury
INNER JOIN zasob z 
ON e.idZasobu=z.idZasobu;

3)
SELECT k.idKreatury, k.nazwa, e.idKreatury, e.idZasobu FROM kreatura k
LEFT JOIN ekwipunek e
ON k.idKreatury=e.idKreatury
WHERE e.idKreatury IS NULL;


#Zad 4
select kreatura.nazwa zasob.nazwa from kreatura
INNER JOIN ekwipunek
ON kreatura.idKreatury=ekwipunek.idKreatury
INNER JOIN zasob
ON ekwipunek.idZasobu=zasob.idZasobu where rodzaj='wiking' and kreatura.dataUr between '1670-01-01' and '1700-12-31' from kreatura;

 