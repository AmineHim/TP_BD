

drop table travailler;
drop table theme;
alter table equipe drop constraint resp_equipe;
alter table laboratoire drop constraint dir_labo;
alter table chercheur drop constraint Eq_ch;
drop table CHERCHEUR;
drop table LABORATOIRE;
drop table EQUIPE;


-- creation de la base

create table CHERCHEUR
( CodeCh number(5) constraint Key_Chercheur PRIMARY KEY,
  NomCh varchar(20),
  CodeEq Number(5),
  Salaire Number(5));

create table LABORATOIRE
( CodeLabo number(5) constraint Key_Labo PRIMARY KEY,
  Type varchar(5) constraint Type_labo Check (Type in ('UNIV', 'INRIA', 'CNRS')),
  NomLabo varchar(20),
  URL varchar(15),
  CodeDir number(5),
  constraint Dir_Labo Foreign key (CodeDir) references CHERCHEUR (CodeCh));

create table EQUIPE
( CodeEq number(5) constraint Key_Equipe PRIMARY KEY,
  NomEq varchar(20),
  CodeResp number(5),
  CodeLabo number(5),
  DateCrea date,
  Budget number(5),
  constraint Resp_Equipe foreign key (CodeResp) references CHERCHEUR (CodeCh));

Alter table CHERCHEUR
add constraint Eq_Ch foreign key (CodeEq) references EQUIPE (CodeEq);

 create table THEME
 (CodeTh number(5) constraint Key_Theme PRIMARY KEY,
  Libelle varchar(35));
  
  create table TRAVAILLER
  ( CodeCh number(5),
    CodeTh number(5),
    constraint Trv_Ch foreign key (CodeCh) references CHERCHEUR (CodeCh),
    constraint Trv_Th foreign key (CodeTh) references THEME (CodeTh));
    
    -- Instanciation de la table CHERCHEUR

Alter table chercheur
disable constraint Eq_Ch;

INSERT INTO CHERCHEUR VALUES (1, 'CARRON',2,1900);
INSERT INTO CHERCHEUR VALUES (2, 'DEJEANOT', 3,1000);
INSERT INTO CHERCHEUR VALUES (3, 'PERRYSSON',2,1100);
INSERT INTO CHERCHEUR VALUES (4,'ACEBE', 1,3000);
INSERT INTO CHERCHEUR VALUES (5,'ALEXANDRE', 1,1000);
INSERT INTO CHERCHEUR VALUES (6,'MOLLARDO',2,1200);
INSERT INTO CHERCHEUR VALUES (7,'STEMMERA',3,2500);
INSERT INTO CHERCHEUR VALUES (8,'MARTIN', 5,2400);
INSERT INTO CHERCHEUR VALUES (9,'ANTOINE', 4,1100);
INSERT INTO CHERCHEUR VALUES (10,'FAURE', 4,3000);
INSERT INTO CHERCHEUR VALUES (11,'FARINAS', 1,1000);
INSERT INTO CHERCHEUR VALUES (12,'NEXON', 2,1000);
INSERT INTO CHERCHEUR VALUES (13, 'AGASSE', 5,1100);

-- INSTANCIATION DE LA TABLE EQUIPE
INSERT INTO EQUIPE VALUES (1,'SMM', 4,1,'06/10/1998', 30000);
INSERT INTO EQUIPE VALUES (2, 'FIRM',1, 2,'10/02/1985', 25000);
INSERT INTO EQUIPE VALUES (3,'LSA', 7,1,'01/12/2001', 60000);
INSERT INTO EQUIPE VALUES (4, 'PSA', 10,1,'05/11/2003', 45000);
INSERT INTO EQUIPE VALUES (5, 'SIMPA',8,3,'01/01/2000', 10000);

ALTER TABLE CHERCHEUR
ENABLE CONSTRAINT EQ_CH;

--INSTANCIATION DE LA TABLE LABORATOIRE
INSERT INTO LABORATOIRE VALUES (1, 'UNIV', 'IRIT', 'www.irit.fr', 11);
INSERT INTO LABORATOIRE VALUES (2, 'CNRS', 'LORIM', 'www.lorim.fr', 12);
INSERT INTO LABORATOIRE VALUES (3, 'INRIA', 'LIFL', 'www.lifl.fr', 13);

-- INSTANCIATION DE LA TABLE THEME
INSERT INTO THEME VALUES (1, 'MODELISATION MATHEMATIQUE');
INSERT INTO THEME VALUES (2, 'PROGRAMMATION DYNAMIQUE');
INSERT INTO THEME VALUES (3, 'SYSTEMES HYPERMEDIA');
INSERT INTO THEME VALUES (4, 'INTERFACE HOMME-MACHINE');
INSERT INTO THEME VALUES (5, 'GENIE-LOGICIEL');
INSERT INTO THEME VALUES (6, 'SYSTEMES DINFORMATION GEOGRAPHIQUE');

-- INSTANCIATION DE LA TABLE TRAVAILLER
INSERT INTO TRAVAILLER VALUES (1, 4);
INSERT INTO TRAVAILLER VALUES (2,2);
INSERT INTO TRAVAILLER VALUES (3,1);
INSERT INTO TRAVAILLER VALUES (4,5);
INSERT INTO TRAVAILLER VALUES (5,1);
INSERT INTO TRAVAILLER VALUES (6,4);
INSERT INTO TRAVAILLER VALUES (7,2);
INSERT INTO TRAVAILLER VALUES (8,3);
INSERT INTO TRAVAILLER VALUES (9,2);
INSERT INTO TRAVAILLER VALUES (10,1);
INSERT INTO TRAVAILLER VALUES (11,5);
INSERT INTO TRAVAILLER VALUES (12, 4);
INSERT INTO TRAVAILLER VALUES  (13,6);

INSERT INTO TRAVAILLER VALUES (4,1);
INSERT INTO TRAVAILLER VALUES (4,2);
INSERT INTO TRAVAILLER VALUES (4,3);
INSERT INTO TRAVAILLER VALUES (4,4);
INSERT INTO TRAVAILLER VALUES (4,6);
INSERT INTO TRAVAILLER VALUES (10,2);
INSERT INTO TRAVAILLER VALUES (10,3);
INSERT INTO TRAVAILLER VALUES (7,3);
INSERT INTO TRAVAILLER VALUES (8,4);

--Q1

CREATE OR REPLACE VIEW CHERCHEUR_2400(CodeCh, NomCh, Salaire) 
AS SELECT CodeCh, NomCh, Salaire
from chercheur
where Salaire>=2400;

Select * from cat; --tables+vues
Select * from tab; -- tables

INSERT INTO CHERCHEUR values (15, 'Thierry', 2, 2600);

SELECT * from chercheur;
SELECT * from CHERCHEUR_2400;

--Q2
--a
CREATE OR REPLACE VIEW CHERCHEUR_EQ1(CodeCh, NomCh) 
AS SELECT CodeCh, NomCh
from chercheur
where CodeEq=1;
--b
SELECT * from CHERCHEUR_EQ1;

INSERT INTO CHERCHEUR values (14, 'RENAUD', 1, 2500);

SELECT * FROM CHERCHEUR;
SELECT * FROM CHERCHEUR_EQ1;

--c
UPDATE CHERCHEUR SET NomCh='RENAUDIN' where NomCh='RENAUD';

--d
INSERT INTO CHERCHEUR values (18, 'LALANDE',null,null);

SELECT * from CHERCHEUR_EQ1;
SELECT * FROM CHERCHEUR;


DELETE from CHERCHEUR where nomCh='LALANDE';
--DELETE from CHERCHEUR where nomCh='RENAUDIN';

--PARTIE II
--Q1
SELECT * from chercheur ORDER BY NomCh;
--Q2
SELECT nomch, nomeq from chercheur,equipe where chercheur.codeeq=equipe.codeeq;
--Q3
SELECT nomch from chercheur,equipe where chercheur.codeeq=equipe.codeeq and NomEq='PSA';
--Q4
SELECT count(nomch) from chercheur,equipe where chercheur.codeeq=equipe.codeeq and NomEq='FIRM';
--Q5
SELECT codelabo,nomlabo,count(chercheur.codech) 
from chercheur,equipe,laboratoire 
where chercheur.codeeq=equipe.codeeq
and laboratoire.codelabo=equipe.codelabo
group by NomLabo;


select nomecurie, annee, count(nupilote)
from ecurie,appartenir
where ecurie.nuecurie=appartenir.nuecurie
group by nomecurie,annee;