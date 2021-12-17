zti_bazy/lab_3/lab_3_zadania_1.md
#zad1
select imie, nazwisko, year(data_urodzenia) from pracownik;

#zad2
select imie, nazwisko, year(curdate()-year(data_urodzenia)) from pracownik;

#zad3
Wyświetl nazwę działu i liczbę pracowników przypisanych do każdego z nich.
select d.nazwa sum(p.id_pracownika) from dzial d
inner join pracowik p on p.dzial=d.id_dzialu
group by d.nazwa;

#zad4 kategoria, towar, stan magazynowy
Wyświetl nazwę kategorii oraz liczbę produktów w każdej z nich.

select k.nazwa, sm.ilosc from kategoria k
left join towar t on t.kategoria=k.id_kategori
left join stan_magazynowy sm on sm.towar=t.id_towaru;

#zad5 
Wyświetl nazwę kategorii i w kolejnej kolumnie listę wszystkich produktów należącej do każdej z nich.

select k.nazwa_kategori, t.nazwa_towaru from kategoria k
left join towar t on t.kategoria-k.id_kategori;

#zad6 round przyklad ROUND(TotalDue,2);round(liczba, precyzja)

Wyświetl średnie zarobki pracowników za zaokrągleniem do 2 miejsc po przecinku.
select round(avg(pensja),2) from pracownik group by id_pracowika;

#zad7
Wyświetl średnie zarobki pracowników, którzy pracują co najmniej od 5 lat.
select avg(pensja) from pracownik where year(curdate()-year(data_zatrudnienia)>='5' group by id_pracowika;

#zad8 max(zbiór liczb) - zwraca wartość największą. ??; count(); COUNT(DISTINCT())
Wyświetl 10 najczęściej sprzedawanych produktów.

select 


#zad9
Wyświetl numer zamówienia, jego wartość (suma wartości wszystkich jego pozycji) 
zarejestrowanych w pierwszym kwartale 2017 roku.

select 


#zad10 pracownik; zamowienie towar
Wyświetl imie, nazwisko i sumę wartości zamówień, 
które dany pracownik dodał. Posortuj malejąco po sumie.

select from p.imie, p.nazwisko, sum(pz.ilosc*pz.cena) zamowienie z
inner join pracownik p on z.pracownik_id_pracownika=p.id_pracownika
inner join pozycja_zamowienia pz on pz.zamowienie=z.id_zamowienia
inner join towar t on t.id_towaru=pz.towar;