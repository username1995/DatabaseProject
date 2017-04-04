load data
infile 'C:\Users\Szczominik\Desktop\nasze_2\kategoria.csv'
append into table kategoria
fields terminated by ';'
(id_kategorii,nazwa_kategorii)