load data
infile 'C:\Users\Szczominik\Desktop\nasze_2\produkt.csv'
append into table produkt
fields terminated by ';'
(id_produktu,kategoria,nazwa_produktu,cena)