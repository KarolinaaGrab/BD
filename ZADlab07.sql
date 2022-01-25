Zad 1 
1)
Jezeli pracuje na wikingowie nie trzeba

2)

left join - pokazalo null i wsz wyniki; teraz trzeba wstawic warunek where (...) null - wynik- postaci, kt nie brały udziału)

select k.nazwa from kreatura k
Left join uczestnicy u
on k.idKreatury=u.id_uczestnika
where u.id_uczestnika is null;

3)
select w.nazwa, sum(e.ilosc) from wyprawa w
inner join uczestnicy u
on w.id_wyprawy=u.id_wyprawy
join ekwipunek e
on u.id_uczestnika=e.idKreatury
group by w.nazwa;

#Zad2
1)
select rodzaj, count(*) from kreatura group by rodzaj;
group_concat ---- wyswietla wsz wartosci, kt znalazly sie w tej grupie na podstawie nadanego wczesniej warunku grupujacego
select rodzaj, group_concat(nazwa seperator '-') from kreatura group by rodzaj;

rozwiazanie:
select w.nazwa, count(u.id_uczestnika),group_concat(k.nazwa)
from kreatura k
inner join uczestnicy u
on u.id_uczestnika=k.idKreatury
inner join wyprawa w
on w.id_wyprawy=u.id_wyprawy
group by w.nazwa;

2)

