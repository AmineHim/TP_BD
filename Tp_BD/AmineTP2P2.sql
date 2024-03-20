

DROP TABLE Effectuer;
DROP TABLE EffectuerQualification;
DROP TABLE Course;
DROP TABLE Circuit;
DROP TABLE Appartenir;
DROP TABLE Ecurie;
DROP TABLE Pilote;


-- script de creation des tables de la base F1
CREATE TABLE Pilote(
nuPilote number(5) constraint pk_pilote Primary key, 
nomPilote varchar2(20), 
prenomPilote varchar2(20),
nationalite varchar2(20)
);

create table Ecurie(
nuEcurie number(5) constraint pk_ecurie Primary key,
nomEcurie varchar2(20)
);

create table Appartenir(
nuPilote number(5) constraint fk_pilote_appartenir references Pilote(nuPilote),
nuEcurie number(5) constraint fk_ecurie references Ecurie(nuEcurie),
annee number(4),
constraint pk_appartenir primary key (nuPilote, nuEcurie, annee)
);


CREATE TABLE Circuit(
nuCi number(5) constraint pk_circuit primary key,
nomCi varchar2(20),
paysCi varchar2(20),
longueurCi number(5),
nbTours number(3)
);

create table Course(
nuCo number(5) constraint pk_course primary key,
anneeCo number(4),
meteo varchar2(5) constraint ck_meteo check (meteo in ('sec','pluie','mix')),
nuCi number(5) constraint fk_co_ci references Circuit(nuCi)
);

create table EffectuerQualification(
nuCo number(5) constraint fk_co_effectuerQualif references Course(nuCo),
nuPilote number(5) constraint fk_pilote_effectuerQualif references Pilote(nuPilote),
classement number(2),
tempsTour number(6),
constraint pk_effectuerQualification primary key (nuCO, nuPilote)
);


create table Effectuer(
nuCo number(5) constraint fk_co_effectuer references Course(nuCo),
nuPilote number(5) constraint fk_pilote_effectuer references Pilote(nuPilote),
classement number(2),
temps number(6),
tempsTour number(6),
constraint pk_effectuer primary key (nuCO, nuPilote)
);




INSERT INTO PILOTE VALUES (1, 'HAMILTON','Lewis', 'Royaume-Uni');    
INSERT INTO PILOTE VALUES (2, 'MASSA', 'Felipe', 'Bresil');
INSERT INTO PILOTE VALUES (3, 'RAIKKONEN','Kimi', 'Finlande');
INSERT INTO PILOTE VALUES (4, 'KUBICA', 'Robert', 'Pologne');
INSERT INTO PILOTE VALUES (5, 'SCHUMACHER', 'Mickael', 'Allemagne');
INSERT INTO PILOTE VALUES (6, 'ALONSO','Fernando', 'Espagne'); 
INSERT INTO PILOTE VALUES (7, 'FISICHELLA', 'Giancarlo','Italie');



INSERT INTO ECURIE values (1, 'Ferrari');
INSERT INTO ECURIE values (2, 'McLarenMercedes');
INSERT INTO ECURIE values (3, 'Renault');
INSERT INTO ECURIE values (4, 'WilliamsBMW');
INSERT INTO ECURIE values (5, 'Force India');



INSERT INTO APPARTENIR values (1,2,2009);
INSERT INTO APPARTENIR values (1,2,2008);
INSERT INTO APPARTENIR values (1,2,2007);    
INSERT INTO APPARTENIR values (2,1,2009);
INSERT INTO APPARTENIR values (2,1,2008);
INSERT INTO APPARTENIR values (2,1,2007);
INSERT INTO APPARTENIR values (2,1,2006);
INSERT INTO APPARTENIR values (3,1,2009);
INSERT INTO APPARTENIR values (3,1,2008);
INSERT INTO APPARTENIR values (3,1,2007);
INSERT INTO APPARTENIR values (3,2,2006);
INSERT INTO APPARTENIR values (4,4,2009);
INSERT INTO APPARTENIR values (4,4,2008);
INSERT INTO APPARTENIR values (4,4,2007);
INSERT INTO APPARTENIR values (4,4,2006);
INSERT INTO APPARTENIR values (5,1,2006);
INSERT INTO APPARTENIR values (6,3,2009);
INSERT INTO APPARTENIR values (6,3,2008);
INSERT INTO APPARTENIR values (6,2,2007);
INSERT INTO APPARTENIR values (6,3,2006);
INSERT INTO APPARTENIR values (7,5,2009);
INSERT INTO APPARTENIR values (7,5,2008);
INSERT INTO APPARTENIR values (7,3,2007);
INSERT INTO APPARTENIR values (7,3,2006);

INSERT INTO CIRCUIT values (1, 'Silverstone','Grande-Bretagne',5141, 60);
INSERT INTO CIRCUIT values (2, 'Gilles-Villeneuve','Canada',4361, 70);
INSERT INTO CIRCUIT values (3, 'Shangai','Chine', 5451, 56);
INSERT INTO CIRCUIT values (4, 'Albert Park','Australie', 5303, 58);
INSERT INTO CIRCUIT values (5, 'Magny-Cours','France', 4411, 68);
INSERT INTO CIRCUIT values (6, 'Yas Marina Circuit','Emirats Arabes Unis', 5505, 55);



INSERT INTO COURSE values (1, 2006, 'pluie',1);
INSERT INTO COURSE values (2, 2006, 'sec',2);
INSERT INTO COURSE values (3, 2006, 'pluie',3);
INSERT INTO COURSE values (4, 2006, 'pluie',5);
INSERT INTO COURSE values (5, 2007, 'sec',1);
INSERT INTO COURSE values (6, 2007, 'sec',2);
INSERT INTO COURSE values (7, 2007, 'pluie',3);
INSERT INTO COURSE values (8, 2008, 'mix',1);
INSERT INTO COURSE values (9, 2008, 'sec',2);
INSERT INTO COURSE values (10, 2008, 'pluie',3);
INSERT INTO COURSE values (11, 2009, 'pluie',1);
INSERT INTO COURSE values (12, 2009, 'pluie',2);
INSERT INTO COURSE values (13, 2009, 'mix',3);
INSERT INTO COURSE values (14, 2009, 'sec',6);



INSERT INTO EFFECTUERQUALIFICATION values (1,6,1, 80);
INSERT INTO EFFECTUERQUALIFICATION values (1,5,2, 81);
INSERT INTO EFFECTUERQUALIFICATION values (1,3,6, 82);
INSERT INTO EFFECTUERQUALIFICATION values (1,2,3, 81);
INSERT INTO EFFECTUERQUALIFICATION values (1,7,4, 82);


INSERT INTO EFFECTUER values (1,6,1, 4980, 81);
INSERT INTO EFFECTUER values (1,5,2, 4996, 81);
INSERT INTO EFFECTUER values (1,3,3 , 5010, 82);
INSERT INTO EFFECTUER values (1,2,5,5016, 82);
INSERT INTO EFFECTUER values (1,7,4,5012, 82);

INSERT INTO EFFECTUERQUALIFICATION values (2,6,1, 75);
INSERT INTO EFFECTUERQUALIFICATION values (2,5,2, 75);
INSERT INTO EFFECTUERQUALIFICATION values (2,7,6, 76);
INSERT INTO EFFECTUERQUALIFICATION values (2,2,7, 77);

INSERT INTO EFFECTUER values (2,6,1,5390, 75);
INSERT INTO EFFECTUER values (2,5,2,5395, 75);
INSERT INTO EFFECTUER values (2,7,3,5410, 75);
INSERT INTO EFFECTUER values (2,2,4,5416, 76);

INSERT INTO EFFECTUERQUALIFICATION values (3,5,1, 77);
INSERT INTO EFFECTUERQUALIFICATION values (3,6,6, 79);
INSERT INTO EFFECTUERQUALIFICATION values (3,7,2, 77);
INSERT INTO EFFECTUERQUALIFICATION values (3,4,9, 80);

INSERT INTO EFFECTUER values (3,5,1, 4559, 78);
INSERT INTO EFFECTUER values (3,6,2, 4580, 79);
INSERT INTO EFFECTUER values (3,7,3, 5601, 79);
INSERT INTO EFFECTUER values (3,4,13,4630, 82);



INSERT INTO EFFECTUERQUALIFICATION values (5,3,3, 80);
INSERT INTO EFFECTUERQUALIFICATION values (5,6,1, 79);
INSERT INTO EFFECTUERQUALIFICATION values (5,1,2, 79);
INSERT INTO EFFECTUERQUALIFICATION values (5,4,8, 81);
INSERT INTO EFFECTUERQUALIFICATION values (5,2,7, 81);


INSERT INTO EFFECTUER values (5,3,1, 5000, 80);
INSERT INTO EFFECTUER values (5,6,2, 5010, 79);
INSERT INTO EFFECTUER values (5,1,3, 5060, 80);
INSERT INTO EFFECTUER values (5,4,4, 5070, 81);
INSERT INTO EFFECTUER values (5,2,5, 5075, 80);

INSERT INTO EFFECTUERQUALIFICATION values (6,1,3,76);
INSERT INTO EFFECTUERQUALIFICATION values (6,3,4,78);
INSERT INTO EFFECTUERQUALIFICATION values (6,6,6,79);
INSERT INTO EFFECTUERQUALIFICATION values (6,5,7,79);


INSERT INTO EFFECTUER values (6,1,1,5450, 77);
INSERT INTO EFFECTUER values (6,3,5,5502, 82);
INSERT INTO EFFECTUER values (6,6,7,5523, 83);
INSERT INTO EFFECTUER values (6,5,8,5524, 84);

INSERT INTO EFFECTUERQUALIFICATION values (7,3,1, 76);
INSERT INTO EFFECTUERQUALIFICATION values (7,6,2, 77);
INSERT INTO EFFECTUERQUALIFICATION values (7,2,3, 78);
INSERT INTO EFFECTUERQUALIFICATION values (7,7,11, 82);

INSERT INTO EFFECTUER values (7,3,1, 4570, 75);
INSERT INTO EFFECTUER values (7,6,2, 4600, 76);
INSERT INTO EFFECTUER values (7,2,3, 4610, 78);
INSERT INTO EFFECTUER values (7,7,11, 4650, 79);

INSERT INTO EFFECTUERQUALIFICATION values (8,1,1, 79);
INSERT INTO EFFECTUERQUALIFICATION values (8,3,4, 81);
INSERT INTO EFFECTUERQUALIFICATION values (8,6,6, 82);
INSERT INTO EFFECTUERQUALIFICATION values (8,2,13, 84);

INSERT INTO EFFECTUER values (8,1,1, 4990, 79);
INSERT INTO EFFECTUER values (8,3,4, 4999, 78);
INSERT INTO EFFECTUER values (8,6,6, 5050, 80);



INSERT INTO EFFECTUER values (9,1,1, 5400, 75);
INSERT INTO EFFECTUER values (9,2,2, 5403, 75);
INSERT INTO EFFECTUER values (9,3,3, 5410, 76);
INSERT INTO EFFECTUER values (9,6,4, 5490, 76);
INSERT INTO EFFECTUER values (9,4,6, 5500, 77);
INSERT INTO EFFECTUER values (9,7,17, 5530, 76);

commit;



SELECT * FROM PILOTE;
SELECT nompilote, nupilote FROM PILOTE;
SELECT nuci FROM COURSE;
SELECT DISTINCT nuci FROM COURSE ;
SELECT meteo, anneeCo FROM COURSE WHERE nuci=2;
SELECT NUPILOTE, CLASSEMENT FROM EFFECTUER WHERE nuco=3;
SELECT NUCO, ANNEECO, METEO FROM COURSE WHERE nuci=2 ORDER BY anneeco;
SELECT NUCI, NOMCI, PAYSCI, LONGUEURCI FROM CIRCUIT ORDER BY paysci DESC;
SELECT * FROM PILOTE WHERE nompilote like 'F%';
SELECT nupilote FROM APPARTENIR WHERE  (nuecurie=1 or nuecurie=2) and annee=2009;
SELECT nupilote FROM EFFECTUER WHERE classement<=3 and nuco=9;
SELECT nuci, nomci, (longueurci*nbtours)/1000 as distancetotale FROM CIRCUIT;
SELECT DISTINCT COUNT(nuci) FROM circuit;
SELECT nuco, AVG(temps) FROM effectuer where nuco=1 GROUP BY nuco;
SELECT nuco, AVG(temps) FROM effectuer GROUP BY nuco ORDER BY AVG(temps);
SELECT nuco, AVG(temps) FROM effectuer GROUP BY nuco HAVING AVG(temps)<5000;
SELECT DISTINCT nupilote FROM appartenir, ecurie WHERE appartenir.nuecurie!=ecurie.nuecurie and appartenir.;
SELECT nuco, anneeco, nomci, paysci FROM course, circuit;
SELECT nuco, anneeco, nomci, paysci FROM course, circuit where course.nuci=circuit.nuci;
SELECT DISTINCT nomci, paysci FROM circuit, course WHERE course.meteo='pluie' and course.nuci=circuit.nuci;
SELECT nompilote, prenompilote, nationalite FROM pilote Where nupilote in (SELECT nupilote from appartenir where nuecurie in (select nuecurie from ecurie where nomecurie='Ferrari'));
SELECT DISTINCT nompilote, prenompilote, nationalite FROM pilote P, appartenir A, ecurie E WHERE P.nupilote=A.nupilote and A.nuEcurie=E.nuecurie and nomEcurie='Ferrari';
SELECT nompilote, prenompilote, nationalite FROM pilote Where nupilote in (SELECT nupilote from appartenir where annee=2006 and nuecurie in (select nuecurie from ecurie where nomecurie='Ferrari'));
SELECT DISTINCT nompilote, prenompilote, nationalite FROM pilote P, appartenir A, ecurie E WHERE A.annee=2006 and P.nupilote=A.nupilote and A.nuEcurie=E.nuecurie and nomEcurie='Ferrari';

SELECT DISTINCT nompilote, prenompilote, nationalite 
FROM pilote P, appartenir A, ecurie E, effectuer EF, circuit C, course CO 
WHERE  EF.classement=1 and C.nomCi='Silvertone' and C.nuci=CO.nuci 
and CO.nuco=EF.nuco and P.nupilote=A.nupilote and A.nuEcurie=E.nuecurie and nomEcurie='Ferrari';

SELECT nompilote, prenompilote, nationalite, tempstour
FROM pilote,circuit, effectuer, course
WHERE pilote.nupilote=effectuer.nupilote
and effectuer.nuco=course.nuco
and course.nuci=circuit.nuci
and nomCi='Silverstone'
and effectuer.classement='1';

(select nuci from circuit) minus (select nuci from course);

SELECT DISTINCT nompilote, prenompilote
FROM pilote,circuit c1 c2, effectuer, course
WHERE pilote.nupilote=effectuer.nupilote
and effectuer.nuco=course.nuco
and course.nuci=circuit.nuci
and (c1.nomCi='Silverstone' and c2.nomCi='Gilles-Villeneuve')
and effectuer.classement='1';

SELECT nomci from circuit where nuci not in (select nuci from course where anneeco=2009);

select nomci from circuit where nuci in ((select nuci from circuit) minus (select nuci from course where anneeco=2009));

SELECT nomci from circuit where (nuci not in (select nuci from course where anneeco=2009)) and (nuci in (select nuci from course where anneeco<2009));

SELECT nomci from circuit where (nuci in (select nuci from course where anneeco=2009)) and (nuci not in (select nuci from course where anneeco<2009));

SELECT nompilote, effectuer.nuco from
pilote,effectuer, effectuerqualification 
where pilote.nupilote=effectuer.nupilote
and pilote.nupilote=effectuerqualification.nupilote
and effectuer.nuco=effectuerqualification.nuco
and effectuer.classement < effectuerqualification.classement;

select DISTINCT  pilote.nompilote, course.nuco 
from pilote, course, effectuer,effectuerqualification
where pilote.nupilote=effectuer.nupilote
and pilote.nupilote=effectuerqualification.nupilote
and effectuer.nupilote=effectuerqualification.nupilote
and course.nuco=effectuer.nuco
and course.nuco=effectuerqualification.nuco
and effectuer.classement=effectuerqualification.classement order by course.nuco;

select eff.nuco, pilote.nompilote
from effectuerqualification eff, pilote
where pilote.nupilote=eff.nupilote
and eff.nupilote not in (select nupilote from effectuer where effectuer.nuco=eff.nuco);

select nomecurie, annee, count(nupilote)
from ecurie,appartenir
where ecurie.nuecurie=appartenir.nuecurie
group by nomecurie,annee;

select pilote.nompilote, pilote.prenompilote
from pilote, effectuer 
where pilote.nupilote=effectuer.nupilote
and effectuer.temps= (select min(temps) from effectuer where nuco=5);

select nomci from circuit 
where nuci in (
select nuci from course 
group by nuci 
having count(nuco)= (select max(count(nuco)) from course group by nuci));

select nompilote, prenompilote from pilote where
nupilote in (
select nupilote from effectuer
where classement=1);

ALTER TABLE pilote 
ADD NbVictoires number(4);

UPDATE pilote 
set NbVictoires= (select count(nupilote) from effectuer where classement=1 and effectuer.nupilote=pilote.nupilote);

SELECT * from pilote where ROWNUM<4;

select * from
(select nupilote from effectuer where nuco=1 order by classement ) where rownum<=3;

select * from
(select nupilote from effectuer where nuco=1 order by classement asc) where rownum<=3
minus
select * from
(select nupilote from effectuer where nuco=1 order by classement asc) where rownum<=2;




select * from
(select nupilote from effectuer where nuco=1 order by classement asc) where rownum=3;

SELECT effectuer.nuco,pilote.nupilote,effectuer.classement from pilote,effectuer where ROWNUM<4 
and effectuer.nuco=pilote.nupilote 
and effectuer.nuco=1;

SELECT effectuer.nuco,pilote.nupilote,effectuer.classement,effectuer.temps from pilote,effectuer where 
effectuer.nuco=1 and effectuer.classement=3 and effectuer.nuco=pilote.nupilote ;

