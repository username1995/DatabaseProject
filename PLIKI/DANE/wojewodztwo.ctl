load data
infile 'C:\Users\Szczominik\Desktop\nasze_2\wojewodztwo.csv'
into table wojewodztwo
fields terminated by ';'optionally enclosed by '"'	
(id_wojewodztwa,nazwa_wojewodztwa)