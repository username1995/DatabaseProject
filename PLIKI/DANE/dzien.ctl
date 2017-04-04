load data
infile 'C:\Users\Szczominik\Desktop\nasze_2\dzien.csv'
append into table dzien
fields terminated by ';'
(id_dnia,miesiac,dzien)