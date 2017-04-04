load data
infile 'C:\Users\Szczominik\Desktop\nasze_2\pracownik.csv'
append into table pracownik
fields terminated by ';'
(id_pracownika,imie,nazwisko,wiek)