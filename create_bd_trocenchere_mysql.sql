DROP TABLE IF EXISTS ENCHERES;
DROP TABLE IF EXISTS RETRAITS;
DROP TABLE IF EXISTS VENTES;
DROP TABLE IF EXISTS UTILISATEURS;
DROP TABLE IF EXISTS CATEGORIES;

CREATE TABLE CATEGORIES (
   no_categorie   INTEGER NOT NULL,
    libelle        VARCHAR(50) NOT NULL) 
ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE ENCHERES (
    date_enchere                  datetime NOT NULL,
    no_utilisateur   INTEGER NOT NULL,
    no_vente             INTEGER NOT NULL
)
ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE RETRAITS (
	no_vente         INTEGER NOT NULL,
    rue              VARCHAR(100) NOT NULL,
    code_postal      VARCHAR(15) NOT NULL,
    ville            VARCHAR(50) NOT NULL
)
ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE UTILISATEURS (
    no_utilisateur   INTEGER NOT NULL,
    pseudo           VARCHAR(50) NOT NULL,
    nom              VARCHAR(50) NOT NULL,
    prenom           VARCHAR(50) NOT NULL,
    email            VARCHAR(100) NOT NULL,
    telephone        VARCHAR(15),
    rue              VARCHAR(150) NOT NULL,
    code_postal      VARCHAR(10) NOT NULL,
    ville            VARCHAR(100) NOT NULL,
    mot_de_passe     VARCHAR(50) NOT NULL,
    credit           INTEGER NOT NULL,
    administrateur   bit NOT NULL
)
ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE VENTES (
    no_vente                      INTEGER NOT NULL,
    nomarticle                    VARCHAR(100) NOT NULL,
    description                   VARCHAR(300) NOT NULL,
    date_fin_encheres             DATE NOT NULL,
    prix_initial                  FLOAT,
    prix_vente                    FLOAT,
    no_utilisateur                INTEGER NOT NULL,
    no_categorie                  INTEGER NOT NULL
)
ENGINE=InnoDB CHARACTER SET utf8;


ALTER TABLE `UTILISATEURS` ADD PRIMARY KEY( `no_utilisateur`);
ALTER TABLE `UTILISATEURS` CHANGE `no_utilisateur` `no_utilisateur` INT(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `RETRAITS` ADD PRIMARY KEY( `no_vente`);
ALTER TABLE `ENCHERES` ADD PRIMARY KEY( `no_utilisateur`, `no_vente`);
ALTER TABLE `CATEGORIES` ADD PRIMARY KEY( `no_categorie`);

ALTER TABLE `VENTES` ADD PRIMARY KEY( `no_vente`);
ALTER TABLE `VENTES` CHANGE `no_vente` `no_vente` INT(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `UTILISATEURS` ADD UNIQUE(`pseudo`, `telephone`, `email`);

ALTER TABLE `ENCHERES` 
ADD CONSTRAINT `encheres_utilisateur_fk` 
FOREIGN KEY (`no_utilisateur`) REFERENCES `UTILISATEURS`(`no_utilisateur`) 
ON DELETE NO ACTION 
ON UPDATE NO ACTION;

ALTER TABLE `ENCHERES` 
ADD CONSTRAINT `encheres_ventes_fk` 
FOREIGN KEY (`no_vente`) REFERENCES `VENTES`(`no_vente`) 
ON DELETE NO ACTION 
ON UPDATE NO ACTION;

ALTER TABLE `RETRAITS` 
ADD CONSTRAINT `retraits_ventes_fk` 
FOREIGN KEY (`no_vente`) REFERENCES `VENTES`(`no_vente`) 
ON DELETE NO ACTION 
ON UPDATE NO ACTION;

ALTER TABLE `VENTES` 
ADD CONSTRAINT `ventes_categories_fk` 
FOREIGN KEY (`no_categorie`) REFERENCES `CATEGORIES`(`no_categorie`) 
ON DELETE NO ACTION 
ON UPDATE NO ACTION;

ALTER TABLE `VENTES` 
ADD CONSTRAINT `ventes_utilisateur_fk` 
FOREIGN KEY (`no_utilisateur`) REFERENCES `UTILISATEURS`(`no_utilisateur`) 
ON DELETE NO ACTION 
ON UPDATE NO ACTION;



