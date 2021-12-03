# przypomnienie

#krok 1 - określenie niezbędnych tabel
#krok 2 - połączenie tabel

porządkowanie znioru kt sie wyswietla
ograniczenie zbioru przez limit

select * from kreatura
order by year(dataUr), udzwig DESC; 


# Zad 2.2
sektor wyprawa - data, kreatura - nazwa kierownika
sektor i wyprawa - nie ma bezposr polaczenia - klucza obcego - ale jest tabela - etapy wyprawy
kolor czerwony - foreign key miedzy etapy_wypr i sektor
show create table etapy_wyprawy - tam znajdziemy polaczenia



select w.id_wyprawy, w.data_rozpoczecia, ew.idEtapu, s.nazwa, ew.kolejnosc, k.nazwa from kreatura k
inner join wyprawa w on k.idKreatury=w.kierownik
inner join etapy_wyprawy ew on w.id_wyprawy=ew.idWyprawy
inner join sektor s on s.id_sektora=ew.sektor;
order by w.data_rozpoczecia, ew.kolejnosc;

# zad 3.1
ifnull
jezeli null bedzie id kreatury w ekiwpunku to zwroc brak wlasciciela


select k.idKreatury, ifnull(e.idKreatury, 'Brak własciciela')
from ekwipunek e
left join kreatura k on k.idKreatury=e.idKreatury;

select k.idKreatury, if(e.idKreatury is null, 'Brak własciciela', e.idKreatury)
from ekwipunek e
left join kreatura k on k.idKreatury=e.idKreatury;

'Brak własciciela' - wartosc jezeli prawda 
e.idKreatury - wartosc jezeli fałsz

zad 3.1
################################
sektor i etapy wyprawy
inner join - tylko czesc wspolna
left join - beda tez te kt nie ma w etapach wyprawy
################################

select s.nazwa, if(count(ew.sektor) is null, '0', count(ew.idEtapu)) from sektor s 
left join etapy_wyprawy ew on ew.sektor=s.id_sektora
group by s.id_sektora;


WYSTARCZY 
select s.nazwa, count(ew.sektor) from sektor s 
left join etapy_wyprawy ew on ew.sektor=s.id_sektora
group by s.id_sektora;


3.2
uczesticy, kreatura
select *, if( >0, 'brał udział w wyprawie', 'nie brał udziału w wyprawie')

select k.nazwa, if(count(u.id_uczestnika)=0, 'nie brał udział w wyprawie', 'brał udział w wyprawie') from 
right join kreatura k on k.idKreatury=u.id_uczestnika
group by k.nazwa;



# zad 4 abs - wartosc bezwzgledna
1)
select idwyprawy, sum(length(dziennik)) as suma from etapy_wyprawy 
group by idWyprawy having suma<400;


2)zasob, ekwipunek, kreatura, uczestnicy, wyprawa


select (z.waga*z.ilosc)/(count(id_uczestnika)) from zasob
inner join ekwipunek e on e.idZasobu=z.idZasobu
left join kreatura k on k.idKreatury=e.idKreatury
inner join uczesticy u on u.id_uczestnika=k.idKreatury
inner join wyprawa w on w.id_wyprawy=u.id_wyprawy;

NIeKAZDY NIESIE COS! STAD - LEFT JOIN 

kreature da sie ominac wystarczy wyprawa uczestnicy ekwipunek





#Zad5 kreatura, wyprawa, uczestnicy, etapy_wyprawy - chatka dziadka 7


select k.nazwa, datediff(w.data_rozpoczecia, k.dataUr) from kreatura
insert into uczesticy u on u.id_uczestnika=k.idKreatury
insert into wyprawa w on w.id_wyprawy=u.id_wyprawy
insert into etapy_wyprawy ew on ew.idWyprawy=w.id_wyprawy
insert into sektor s on s.id_sektora=ew.sektor
where s.nazwa='chatka dziadka';

