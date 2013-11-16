CREATE TABLE Uzytkownik (
  ID       int(10) NOT NULL AUTO_INCREMENT, 
  Login    varchar(50), 
  Haslo    varchar(32), 
  Mail     varchar(255), 
  Imie     varchar(50), 
  Nazwisko varchar(50), 
  Adres    varchar(300), 
  Telefon  varchar(20), 
  Aktywny  tinyint(1), 
  Lokacja  varchar(50), 
  Nr_Konta varchar(20), 
  PRIMARY KEY (ID)) type=InnoDB;
CREATE TABLE Restauracja (
  ID      int(10) NOT NULL AUTO_INCREMENT, 
  Nazwa   varchar(50), 
  Adres   varchar(50), 
  Telefon varchar(20), 
  Strona  varchar(400), 
  PRIMARY KEY (ID)) type=InnoDB;
CREATE TABLE Danie (
  ID             int(10) NOT NULL AUTO_INCREMENT, 
  Restauracja_ID int(10) NOT NULL, 
  Nazwa          varchar(200), 
  Cena           double, 
  Uwagi          varchar(255), 
  PRIMARY KEY (ID)) type=InnoDB;
CREATE TABLE Pozycje_Zamowienia (
  ID            int(10) NOT NULL AUTO_INCREMENT, 
  Danie_ID      int(10) NOT NULL, 
  Uzytkownik_ID int(10) NOT NULL, 
  Zamowienie_ID int(10) NOT NULL, 
  Ilosc         int(10), 
  Uwagi         varchar(255), 
  PRIMARY KEY (ID)) type=InnoDB;
CREATE TABLE Zamowienie (
  ID              int(10) NOT NULL AUTO_INCREMENT, 
  Restauracja_ID  int(10) NOT NULL, 
  Zamawiajacy_ID  int(10) NOT NULL, 
  Data_Zamowienia datetime NULL, 
  Data_Zamkniecia datetime NULL, 
  Zamkniete       tinyint(1), 
  PRIMARY KEY (ID)) type=InnoDB;
CREATE TABLE Rozliczenie (
  ID               int(10) NOT NULL AUTO_INCREMENT, 
  Zamowienie_ID    int(10) NOT NULL, 
  Data_Rozliczenia datetime NULL, 
  Napiwek          double, 
  Uwagi            varchar(255), 
  Dane_Przelew     varchar(500), 
  PRIMARY KEY (ID)) type=InnoDB;
CREATE TABLE Pozycje_Rozliczenia (
  ID                 int(10) NOT NULL AUTO_INCREMENT, 
  Rozliczenie_ID     int(10) NOT NULL, 
  Uzytkownik_ID      int(10) NOT NULL, 
  Danie_Nazwa        varchar(200), 
  Danie_Cena         double, 
  Pakowanie          double, 
  Upust              double, 
  Danie_Cena_Koncowa double, 
  Uwagi              varchar(255), 
  PRIMARY KEY (ID)) type=InnoDB;
ALTER TABLE Pozycje_Zamowienia ADD INDEX FKPozycje_Za291103 (Uzytkownik_ID), ADD CONSTRAINT FKPozycje_Za291103 FOREIGN KEY (Uzytkownik_ID) REFERENCES Uzytkownik (ID);
ALTER TABLE Pozycje_Zamowienia ADD INDEX FKPozycje_Za36101 (Danie_ID), ADD CONSTRAINT FKPozycje_Za36101 FOREIGN KEY (Danie_ID) REFERENCES Danie (ID);
ALTER TABLE Pozycje_Zamowienia ADD INDEX FKPozycje_Za976909 (Zamowienie_ID), ADD CONSTRAINT FKPozycje_Za976909 FOREIGN KEY (Zamowienie_ID) REFERENCES Zamowienie (ID);
ALTER TABLE Danie ADD INDEX FKDanie235180 (Restauracja_ID), ADD CONSTRAINT FKDanie235180 FOREIGN KEY (Restauracja_ID) REFERENCES Restauracja (ID);
ALTER TABLE Rozliczenie ADD INDEX FKRozliczeni214376 (Zamowienie_ID), ADD CONSTRAINT FKRozliczeni214376 FOREIGN KEY (Zamowienie_ID) REFERENCES Zamowienie (ID);
ALTER TABLE Pozycje_Rozliczenia ADD INDEX FKPozycje_Ro796778 (Rozliczenie_ID), ADD CONSTRAINT FKPozycje_Ro796778 FOREIGN KEY (Rozliczenie_ID) REFERENCES Rozliczenie (ID);
ALTER TABLE Pozycje_Rozliczenia ADD INDEX FKPozycje_Ro457183 (Uzytkownik_ID), ADD CONSTRAINT FKPozycje_Ro457183 FOREIGN KEY (Uzytkownik_ID) REFERENCES Uzytkownik (ID);
ALTER TABLE Zamowienie ADD INDEX FKZamowienie82654 (Restauracja_ID), ADD CONSTRAINT FKZamowienie82654 FOREIGN KEY (Restauracja_ID) REFERENCES Restauracja (ID);
ALTER TABLE Zamowienie ADD INDEX FKZamowienie422161 (Zamawiajacy_ID), ADD CONSTRAINT FKZamowienie422161 FOREIGN KEY (Zamawiajacy_ID) REFERENCES Uzytkownik (ID);
