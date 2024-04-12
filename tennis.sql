CREATE TABLE SPELERS

      (SPELERSNR    INTEGER NOT NULL PRIMARY KEY,

       NAAM         CHAR(15) NOT NULL,

       VOORLETTERS  CHAR(3) NOT NULL,

       GEB_DATUM    DATE,

       GESLACHT     CHAR(1) NOT NULL

                    CHECK(GESLACHT IN ('V','M')),

       JAARTOE      SMALLINT NOT NULL

                    CHECK(JAARTOE > 1969),

       STRAAT       VARCHAR(30)  NOT NULL,

       HUISNR       CHAR(4),

       POSTCODE     CHAR(6) CHECK(POSTCODE LIKE '______'),

       PLAATS       VARCHAR(30) NOT NULL,

       TELEFOON     CHAR(13),

       BONDSNR      CHAR(4))

;

CREATE TABLE TEAMS

      (TEAMNR       INTEGER NOT NULL PRIMARY KEY,

       SPELERSNR    INTEGER NOT NULL,

       DIVISIE      CHAR(6) NOT NULL

                    CHECK(DIVISIE IN ('ere', 'tweede')),

       FOREIGN KEY  (SPELERSNR) REFERENCES SPELERS (SPELERSNR))

;

CREATE TABLE WEDSTRIJDEN

      (WEDSTRIJDNR  INTEGER NOT NULL PRIMARY KEY,

       TEAMNR       INTEGER NOT NULL,

       SPELERSNR    INTEGER NOT NULL,

       GEWONNEN     SMALLINT NOT NULL

                    CHECK(GEWONNEN BETWEEN 0 AND 3),

       VERLOREN     SMALLINT NOT NULL

                    CHECK(VERLOREN BETWEEN 0 AND 3),

       FOREIGN KEY  (TEAMNR) REFERENCES TEAMS (TEAMNR),

       FOREIGN KEY  (SPELERSNR) REFERENCES SPELERS (SPELERSNR))

;

CREATE TABLE BOETES

      (BETALINGSNR  INTEGER NOT NULL PRIMARY KEY,

       SPELERSNR    INTEGER NOT NULL,

       DATUM        DATE NOT NULL

                    CHECK(DATUM >= DATE('1969-12-31')),

       BEDRAG       DECIMAL(7,2) NOT NULL

                    CHECK(BEDRAG > 0),

       FOREIGN KEY  (SPELERSNR) REFERENCES SPELERS (SPELERSNR))

;

CREATE TABLE BESTUURSLEDEN

      (SPELERSNR    INTEGER NOT NULL,

       BEGIN_DATUM  DATE NOT NULL,

       EIND_DATUM   DATE,

       FUNCTIE      CHAR(20),

       PRIMARY KEY  (SPELERSNR, BEGIN_DATUM),

       FOREIGN KEY  (SPELERSNR) REFERENCES SPELERS (SPELERSNR),

       CHECK(BEGIN_DATUM < EIND_DATUM),

       CHECK(BEGIN_DATUM >= DATE('1990-01-01')))

;

COMMIT WORK

;

INSERT INTO SPELERS VALUES (

  2, 'Elfring', 'R', '1948-09-01', 'M', 1975, 'Steden', 

    '43', '3575NH', 'Den Haag', '070-237893', '2411')

;

INSERT INTO SPELERS VALUES (

  6, 'Permentier', 'R', '1964-06-25', 'M', 1977, 'Hazensteinln',

    '80', '1234KK', 'Den Haag', '070-476537', '8467')

;

INSERT INTO SPELERS VALUES (

  7, 'Wijers', 'GWS', '1963-05-11', 'M', 1981, 'Erasmusweg', 

    '39', '9758VB', 'Den Haag', '070-347689', NULL)

;

INSERT INTO SPELERS VALUES (

  8, 'Niewenburg', 'B', '1962-07-08', 'V', 1980, 'Spoorlaan',

    '4', '6584WO', 'Rijswijk', '070-458458', '2983')

;

INSERT INTO SPELERS VALUES (

 27, 'Cools', 'DD', '1964-12-28', 'V', 1983, 'Liespad', 

    '804', '8457DK', 'Zoetermeer', '079-234857', '2513')

;

INSERT INTO SPELERS VALUES (

 28, 'Cools', 'C', '1963-06-22', 'V', 1983, 'Oudegracht',

    '10', '1294QK', 'Leiden', '010-659599', NULL)

;

INSERT INTO SPELERS VALUES (

 39, 'Bischoff', 'D', '1956-10-29', 'M', 1980, 'Ericaplein', 

    '78', '9629CD', 'Den Haag', '070-393435', NULL)

;

INSERT INTO SPELERS VALUES (

 44, 'Bakker, de', 'E', '1963-01-09', 'M', 1980, 'Lawaaistraat',

    '23', '4444LJ', 'Rijswijk', '070-368753', '1124')

;

INSERT INTO SPELERS VALUES (

 57, 'Bohemen, van', 'M',  '1971-08-17', 'M', 1985, 'Erasmusweg',

    '16', '4377CB', 'Den Haag', '070-473458', '6409')

;

INSERT INTO SPELERS VALUES (

 83, 'Hofland', 'PK', '1956-11-11', 'M', 1982, 'Mariakade',

    '16a', '1812UP', 'Den Haag', '070-353548', '1608')

;

INSERT INTO SPELERS VALUES (

 95, 'Meuleman', 'P', '1963-05-14', 'M', 1972, 'Hoofdweg',

    '33a', '5746OP', 'Voorburg', '070-867564', NULL)

;

INSERT INTO SPELERS VALUES (

100, 'Permentier', 'P', '1963-02-28', 'M', 1979, 'Hazensteinln',

    '80', '6494SG', 'Den Haag', '070-494593', '6524')

;

INSERT INTO SPELERS VALUES (

104, 'Moerman', 'D', '1970-05-10', 'V', 1984, 'Stoutlaan',

    '65', '9437AO', 'Zoetermeer', '079-987571', '7060')

;

INSERT INTO SPELERS VALUES (

112, 'Baalen, van', 'IP', '1963-10-01', 'V', 1984, 'Vosseweg', 

    '8', '6392LK', 'Rotterdam', '010-548745', '1319')

;



INSERT INTO TEAMS VALUES (1,  6, 'ere')

;

INSERT INTO TEAMS VALUES (2, 27, 'tweede')

;



INSERT INTO WEDSTRIJDEN VALUES ( 1, 1,   6, 3, 1)

;

INSERT INTO WEDSTRIJDEN VALUES ( 2, 1,   6, 2, 3)

;

INSERT INTO WEDSTRIJDEN VALUES ( 3, 1,   6, 3, 0)

;

INSERT INTO WEDSTRIJDEN VALUES ( 4, 1,  44, 3, 2)

;

INSERT INTO WEDSTRIJDEN VALUES ( 5, 1,  83, 0, 3)

;

INSERT INTO WEDSTRIJDEN VALUES ( 6, 1,   2, 1, 3)

;

INSERT INTO WEDSTRIJDEN VALUES ( 7, 1,  57, 3, 0)

;

INSERT INTO WEDSTRIJDEN VALUES ( 8, 1,   8, 0, 3)

;

INSERT INTO WEDSTRIJDEN VALUES ( 9, 2,  27, 3, 2)

;

INSERT INTO WEDSTRIJDEN VALUES (10, 2, 104, 3, 2)

;

INSERT INTO WEDSTRIJDEN VALUES (11, 2, 112, 2, 3)

;

INSERT INTO WEDSTRIJDEN VALUES (12, 2, 112, 1, 3)

;

INSERT INTO WEDSTRIJDEN VALUES (13, 2,   8, 0, 3)

;



INSERT INTO BOETES VALUES (1,   6, '1980-12-08', 100)

;

INSERT INTO BOETES VALUES (2,  44, '1981-05-05',  75)

;

INSERT INTO BOETES VALUES (3,  27, '1983-09-10', 100)

;

INSERT INTO BOETES VALUES (4, 104, '1984-12-08',  50)

;

INSERT INTO BOETES VALUES (5,  44, '1980-12-08',  25)

;

INSERT INTO BOETES VALUES (6,   8, '1980-12-08',  25)

;

INSERT INTO BOETES VALUES (7,  44, '1982-12-30',  30)

;

INSERT INTO BOETES VALUES (8,  27, '1984-11-12',  75)

;



INSERT INTO BESTUURSLEDEN VALUES (  6, '1990-01-01', '1990-12-31', 'Secretaris')

;

INSERT INTO BESTUURSLEDEN VALUES (  6, '1991-01-01', '1992-12-31', 'Lid')

;

INSERT INTO BESTUURSLEDEN VALUES (  6, '1992-01-01', '1993-12-31', 'Penningmeester')

;

INSERT INTO BESTUURSLEDEN VALUES (  6, '1993-01-01', NULL, 'Voorzitter')

;

INSERT INTO BESTUURSLEDEN VALUES (  2, '1990-01-01', '1992-12-31', 'Voorzitter')

;

INSERT INTO BESTUURSLEDEN VALUES (  2, '1994-01-01', NULL, 'Lid')

;

INSERT INTO BESTUURSLEDEN VALUES (112, '1992-01-01', '1992-12-31', 'Lid')

;

INSERT INTO BESTUURSLEDEN VALUES (112, '1994-01-01', NULL, 'Secretaris')

;

INSERT INTO BESTUURSLEDEN VALUES (  8, '1990-01-01', '1990-12-31', 'Penningmeester')

;

INSERT INTO BESTUURSLEDEN VALUES (  8, '1991-01-01', '1991-12-31', 'Secretaris')

;

INSERT INTO BESTUURSLEDEN VALUES (  8, '1993-01-01', '1993-12-31', 'Lid')

;

INSERT INTO BESTUURSLEDEN VALUES (  8, '1994-01-01', NULL, 'Lid');

INSERT INTO BESTUURSLEDEN VALUES ( 57, '1992-01-01', '1992-12-31', 'Secretaris');

INSERT INTO BESTUURSLEDEN VALUES ( 27, '1990-01-01', '1990-12-31', 'Lid');

INSERT INTO BESTUURSLEDEN VALUES ( 27, '1991-01-01', '1991-12-31', 'Penningmeester');

INSERT INTO BESTUURSLEDEN VALUES ( 27, '1993-01-01', '1993-12-31', 'Penningmeester');

INSERT INTO BESTUURSLEDEN VALUES ( 95, '1994-01-01', NULL, 'Penningmeester');

