load data
infile 'C:\Users\Szczominik\Desktop\nasze_2\sklep.csv'
append into table sklep
fields terminated by ';'
(id_sklepu,miasto,ulica)