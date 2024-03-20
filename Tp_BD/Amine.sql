DROP TABLE Fournir CASCADE CONSTRAINTS;
DROP TABLE Produit CASCADE CONSTRAINTS;
DROP TABLE Fournisseur CASCADE CONSTRAINTS;
DROP TABLE Travailler CASCADE CONSTRAINTS;
DROP TABLE Buvette CASCADE CONSTRAINTS;
DROP TABLE Matche CASCADE CONSTRAINTS;
DROP TABLE Stade CASCADE CONSTRAINTS;
DROP TABLE Employer CASCADE CONSTRAINTS;



CREATE TABLE Employer (
    NumE NUMBER(5),
    Nom VARCHAR2(50),
    Prenom VARCHAR2(50),
    DateNaissance VARCHAR2(50),
    CONSTRAINT pk_Employer PRIMARY KEY(NumE)
);
  
CREATE TABLE Stade (
    VilleS VARCHAR2(50),
    NomS VARCHAR2(50),
    NumS NUMBER(5),
    CONSTRAINT pk_Stade PRIMARY KEY(NumS),
    CONSTRAINT ck_stade1 CHECK(NomS IS NOT NULL),
    CONSTRAINT ck_stade2 CHECK(VilleS IS NOT NULL) 
);

CREATE TABLE Matche (
    NumM NUMBER(5),
    Equipe1 VARCHAR2(50),
    Equipe2 VARCHAR2(50),
    DateM VARCHAR2(50),
    HeureM VARCHAR2(50),
    NumS NUMBER(5),
    CONSTRAINT pk_Matche PRIMARY KEY(NumM),
    CONSTRAINT fk_Match FOREIGN KEY (NumS)
    REFERENCES Stade (NumS)
);

CREATE TABLE Buvette (
    Num_B NUMBER(5),
    Emplacement VARCHAR2(50),
    NumS NUMBER(5),
    CONSTRAINT pk_Buvette PRIMARY KEY(Num_B),
    CONSTRAINT fk_Buvette FOREIGN KEY (NumS)
    REFERENCES Stade (NumS)
);

CREATE TABLE Travailler (
    NumM NUMBER(5),
    NumE NUMBER(5),
    Num_B NUMBER(5),
    HeureDebut VARCHAR2(50),
    HeureFin VARCHAR2(50),
    CONSTRAINT pk_Travailler PRIMARY KEY(NumM, NumE, Num_B),
    CONSTRAINT fk_Travailler_Employer  FOREIGN KEY (NumE) REFERENCES Employer (NumE),
    CONSTRAINT fk_Travailler_Matche  FOREIGN KEY (NumM) REFERENCES Matche (NumM),
    CONSTRAINT fk_Travailler_Buvette  FOREIGN KEY (Num_B) REFERENCES Buvette (Num_B)
);


      
CREATE TABLE Fournisseur (
    NomF VARCHAR2(50),
    Num_F NUMBER(5),
    LigneAdresse VARCHAR2(50),
    CodePostal NUMBER(5),
    VilleF VARCHAR2(50),
    CONSTRAINT pk_Fournisseur PRIMARY KEY(Num_F)
);

CREATE TABLE Produit (
    Descriptions VARCHAR2(50),
    NumP NUMBER(5),
    Type_ VARCHAR2(50),
    Categorie VARCHAR(50),
    CONSTRAINT pk_Produit PRIMARY KEY(NumP)
);

CREATE TABLE Fournir (
    NumP NUMBER(5),
    Num_F NUMBER(5),
    NumS NUMBER(5),
    DateL VARCHAR(50),
    Quantité NUMBER(5),
    PrixUnitaire NUMBER(5),
    CONSTRAINT pk_Fournir PRIMARY KEY(NumP, Num_F, NumS),
    CONSTRAINT fk_Fournir_Produit  FOREIGN KEY (NumP) REFERENCES Produit (NumP),
    CONSTRAINT fk_Fournir_Fournisseur  FOREIGN KEY (Num_F) REFERENCES Fournisseur (Num_F),
    CONSTRAINT fk_Fournir_Stade  FOREIGN KEY (NumS) REFERENCES Stade (NumS)
);

INSERT INTO Employer VALUES (01,'HIMICHE','Amine','27/04/2002');

SELECT * FROM GILLES_HUBERT.tp4_buvettes;

