DROP TABLE sprzedaz;
DROP TABLE sklep;
DROP TABLE miasto;
DROP TABLE wojewodztwo;
DROP TABLE dzien;
DROP TABLE miesiac;
DROP TABLE rok;
DROP TABLE produkt;
DROP TABLE kategoria;
--DROP TABLE typ_platnosci;
DROP TABLE pracownik;



CREATE TABLE wojewodztwo (
id_wojewodztwa NUMBER(2),
nazwa_wojewodztwa VARCHAR2(20),
CONSTRAINT wojewodztwo_01 PRIMARY KEY (id_wojewodztwa)
);

CREATE TABLE miasto (
id_miasta NUMBER(3),
wojewodztwo NUMBER(2),
nazwa_miasta VARCHAR2(45),
CONSTRAINT miasto_01 PRIMARY KEY (id_miasta),
CONSTRAINT miasto_02 FOREIGN KEY (wojewodztwo) REFERENCES wojewodztwo (id_wojewodztwa)
);

CREATE TABLE sklep (
id_sklepu NUMBER(4),
miasto NUMBER(3),
ulica VARCHAR2(50),
CONSTRAINT sklep_01 PRIMARY KEY (id_sklepu),
CONSTRAINT sklep_02 FOREIGN KEY (miasto) REFERENCES miasto (id_miasta)
);

CREATE TABLE rok (
id_roku NUMBER(6),
rok NUMBER(4),
CONSTRAINT rok_01 PRIMARY KEY (id_roku)
);

CREATE TABLE miesiac (
id_miesiaca NUMBER(6),
rok NUMBER(6),
miesiac VARCHAR(25),
CONSTRAINT miesiac_01 PRIMARY KEY (id_miesiaca),
CONSTRAINT miesiac_02 FOREIGN KEY (rok) REFERENCES rok (id_roku)
);

CREATE TABLE dzien (
id_dnia NUMBER(6),
miesiac NUMBER(6),
dzien NUMBER(6),
CONSTRAINT dzien_01 PRIMARY KEY (id_dnia),
CONSTRAINT dzien_02 FOREIGN KEY (miesiac) REFERENCES miesiac (id_miesiaca)
);

CREATE TABLE pracownik (
id_pracownika NUMBER(6),
imie VARCHAR2(30),
nazwisko VARCHAR2(35),
wiek NUMBER(3),
CONSTRAINT pracownik_01 PRIMARY KEY (id_pracownika)
);

CREATE TABLE kategoria (
id_kategorii NUMBER(2),
nazwa_kategorii VARCHAR2(20),
CONSTRAINT kategoria_01 PRIMARY KEY (id_kategorii)
);

CREATE TABLE produkt (
id_produktu NUMBER(6),
kategoria NUMBER(2),
nazwa_produktu VARCHAR2(50),
cena NUMBER(6,2),
CONSTRAINT produkt_01 PRIMARY KEY (id_produktu),
CONSTRAINT produkt_02 FOREIGN KEY (kategoria) REFERENCES kategoria (id_kategorii)

);

CREATE TABLE typ_platnosci (
id_platnosci NUMBER(2),
nazwa_platnosci VARCHAR2(20),
CONSTRAINT platnosc_01 PRIMARY KEY (id_platnosci)
);

CREATE TABLE sprzedaz (
id_sprzedazy NUMBER(8),
sklep NUMBER(4),
pracownik NUMBER(6),
dzien NUMBER(6),
produkt NUMBER(6),
ilosc NUMBER(4),
wartosc NUMBER(8,2),
platnosc NUMBER(2),
CONSTRAINT sprzedaz_01 PRIMARY KEY (id_sprzedazy),
CONSTRAINT sprzedaz_02 FOREIGN KEY (sklep) REFERENCES sklep (id_sklepu),
CONSTRAINT sprzedaz_03 FOREIGN KEY (pracownik) REFERENCES pracownik (id_pracownika),
CONSTRAINT sprzedaz_04 FOREIGN KEY (dzien) REFERENCES dzien (id_dnia),
CONSTRAINT sprzedaz_05 FOREIGN KEY (produkt) REFERENCES produkt (id_produktu),
CONSTRAINT sprzedaz_06 FOREIGN KEY (platnosc) REFERENCES typ_platnosci (id_platnosci)


);


