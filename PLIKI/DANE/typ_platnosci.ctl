LOAD DATA
 INFILE 'C:\Users\Szczominik\Desktop\nasze_2\typ_platnosci.csv'
 INTO TABLE typ_platnosci
 fields terminated by ";" optionally enclosed by '"'		  
 (id_platnosci,nazwa_platnosci)