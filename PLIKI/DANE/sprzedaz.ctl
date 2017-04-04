load data
infile 'C:\Users\Szczominik\Desktop\nasze_2\sprzedaz.csv'
append into table sprzedaz
fields terminated by ';'
(id_sprzedazy,sklep,pracownik,dzien,produkt,ilosc,wartosc,platnosc)