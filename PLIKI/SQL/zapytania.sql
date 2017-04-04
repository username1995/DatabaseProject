 
------ROLL UP

--------------JAKIE PRODUKTY KUPIONO W JAKIM MIESCIE--------------------------
SELECT m.nazwa_miasta,p.nazwa_produktu FROM sprzedaz s,sklep w,produkt p,miasto m
where s.sklep=w.id_sklepu and s.produkt=p.id_produktu and m.id_miasta=w.miasto
GROUP BY ROLLUP(m.nazwa_miasta,p.nazwa_produktu)



-------ILOSC PRODUKTOW SPRZEDANYCH W DANYM SKLEPIE-------------------

SELECT sklep.miasto,produkt.nazwa_produktu,  Sum(ilosc) FROM sprzedaz, produkt,sklep,miasto
WHERE sprzedaz.produkt=produkt.id_produktu AND sklep.miasto=sprzedaz.sklep
GROUP BY rollup(sklep.miasto, sprzedaz.produkt, nazwa_produktu) ORDER BY sklep.miasto


--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
---------CUBE

-----------------------PRODUKTY PO CENIE MALEJ¥CO--------------------------------

SELECT produkt.nazwa_produktu, cena, ilosc, (produkt.cena*sprzedaz.ilosc) AS wp³ywy FROM sprzedaz, produkt WHERE
sprzedaz.produkt=produkt.id_produktu GROUP BY cube(sprzedaz.produkt, produkt.nazwa_produktu, cena, ilosc) ORDER BY sprzedaz.produkt, produkt.nazwa_produktu;


--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

--------GROUPING SETS

---------ile wynosila ogolna sprzeda¿ w danym miesi¹cu w danym miescie------------------

SELECT   miesiac.id_miesiaca, rok.rok,miesiac.miesiac, miasto.nazwa_miasta AS nazwa_miasta, Sum(sprzedaz.ilosc) FROM miesiac,sklep, miasto, sprzedaz,rok
           WHERE miesiac.rok = rok.id_roku  AND miasto.id_miasta=sklep.miasto AND sklep.id_sklepu=sprzedaz.sklep
GROUP BY rok.rok,  Grouping sets ((miesiac.miesiac, miasto.nazwa_miasta, miesiac.id_miesiaca), (miasto.nazwa_miasta))
ORDER BY rok.rok, miesiac.id_miesiaca ;

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------




-------PARTITION BY
---------------------------------------------sprzedaz najdroszych towarow-----------------------------------
SELECT sprzedaz.sklep, miasto.nazwa_miasta AS "miasto", produkt.nazwa_produktu AS "nazwa produktu", ilosc, cena, Rank() OVER (PARTITION BY sprzedaz.sklep ORDER BY cena desc) AS ranking
FROM sprzedaz, miasto,sklep, produkt
WHERE miasto.id_miasta=sklep.miasto AND sklep.id_sklepu=sprzedaz.sklep AND produkt.id_produktu=sprzedaz.produkt;



-------------------------------PO TYPIE PLATNOSCI------------------------------------------------------------

SELECT sprzedaz.sklep, typ_platnosci.nazwa_platnosci AS "platnosc", produkt.nazwa_produktu AS "nazwa produktu", ilosc, cena, Rank() OVER (PARTITION BY platnosc ORDER BY cena asc) AS ranking
FROM sprzedaz, miasto,sklep, produkt,typ_platnosci
WHERE miasto.id_miasta=sklep.miasto AND sklep.id_sklepu=sprzedaz.sklep AND produkt.id_produktu=sprzedaz.produkt AND sprzedaz.platnosc=typ_platnosci.id_platnosci;

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

------FUNKCJE STATYSTYCZNE

----statystyczna procentowy udzial poszczegolnych artyku³ów w ogólnej sprzedazy -------------


SELECT produkt.nazwa_produktu AS "Produkt", miasto.nazwa_miasta AS "Miasto",rok.rok,produkt.cena ,ilosc, Sum(produkt.cena) over (PARTITION BY produkt.nazwa_produktu) as "suma dochodu",
Round(100*produkt.cena/(Sum(produkt.cena) over (PARTITION BY produkt.nazwa_produktu)),5) "UDZIAL w %"
FROM sprzedaz, produkt, miasto, rok,sklep
WHERE produkt.id_produktu=sprzedaz.produkt AND miasto.id_miasta=sklep.miasto AND sklep.id_sklepu=sprzedaz.sklep
ORDER BY produkt.nazwa_produktu, rok.rok;
