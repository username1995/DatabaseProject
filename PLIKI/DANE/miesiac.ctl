load data
infile 'C:\Users\Szczominik\Desktop\nasze_2\miesiac.csv'
append into table miesiac
fields terminated by ';'
(id_miesiaca,rok,miesiac)