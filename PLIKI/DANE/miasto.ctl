load data
infile 'C:\Users\Szczominik\Desktop\nasze_2\miasto.csv'
append into table miasto
fields terminated by ';'
(id_miasta,wojewodztwo,nazwa_miasta)