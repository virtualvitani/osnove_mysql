-- Terminal komanda za database
USE poduzece;

-- Stvara bazu Djelatnika u phpmyadminu
CREATE TABLE IF NOT EXISTS Djelatnik (
    id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Ime_djelatnika VARCHAR(30) NOT NULL,
    Prezime_djelatnika VARCHAR(30) NOT NULL,
    Adresa_djelatnika VARCHAR(30) NOT NULL,
    Broj_djelatnika VARCHAR(30) NOT NULL,
    Mail_djelatnika VARCHAR(30) NOT NULL,
    Placa_djelatnika DECIMAL (10, 2) NOT NULL
)ENGINE=InnoDB;

-- Stvara bazu Podruznice u phpmyadminu
CREATE TABLE IF NOT EXISTS Podruznice (
    id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Ime_podruznice VARCHAR(30) NOT NULL,
    Voditelj_podruznice INT UNSIGNED NOT NULL,
    CONSTRAINT fk_Voditelj_podruznice FOREIGN KEY (Voditelj_podruznice) REFERENCES Djelatnik(id)
)ENGINE=InnoDB;

-- Stvara bazu Djelatnika podruznice u phpmyadminu
CREATE TABLE IF NOT EXISTS Djelatnici_podruznica (
    ID_djelatnika INT UNSIGNED NOT NULL,
    ID_podruznice INT UNSIGNED NOT NULL,
    FOREIGN KEY (ID_djelatnika) REFERENCES Djelatnik(id),
    FOREIGN KEY (ID_podruznice) REFERENCES Podruznice(id)
)ENGINE=InnoDB;

-- Stavlja podatke o djelatnicima u tablici Djelatnik
INSERT INTO Djelatnik (Ime_djelatnika, Prezime_djelatnika, Mail_djelatnika, Broj_djelatnika, Adresa_djelatnika, Placa_djelatnika) VALUES
    ('Luka', 'Premuzic', 'luka.premuzic@gmail.com', '091347384', 'Vodnikova 1', 1400.00),
    ('Martina', 'Diklic', 'martina.diklic@gmail.com', '098239239', 'Vodnikova 2 10000 Zagreb', 1500.00),
    ('Matea', 'Zanki', 'matea.zanki@gmail.com', '0991328323', 'Vodnikova 3 10000 Zagreb', 1300.00),
    ('Stella', 'Rudic', 'stella.rudic@gmail.com', '0974924824', 'Vodnikova 4 10000 Zagreb', 1350.00),
    ('Tina', 'Matanovic', 'tina.matanovic@gmail.com', '0993483844', 'Vodnikova 5 10000 Zagreb', 1600.00),
    ('Kresimir', 'Crnic', 'kresimir.crnic@gmail.com', '0913283238', 'Vodnikova 6 10000 Zagreb', 1200.00),
    ('Albert', 'Qaydi', 'albert.qaydi@gmail.com', '098448384', 'Vodnikova 7 10000 Zagreb', 1200.00),
    ('Lara', 'Rudic', 'lara.rudic@gmail.com', '0914834834', 'Vodnikova 8 10000 Zagreb', 1200.00),
    ('Irena', 'Tonkic', 'irena.tonkic@gmail.com', '0994384834', 'Vodnikova 9 10000 Zagreb', 1100.00),
    ('Kristina', 'Senic', 'kristina.senic@gmail.com', '0913982434', 'Vodnikova 10 10000 Zagreb', 1100.00),
    ('Samantha', 'Hukagala', 'samantha.hukagala@gmail.com', '097434349', 'Vodnikova 11 10000 Zagreb', 1100.00),
    ('Tomislav', 'Natic', 'tomislav.natic@gmail.com', '0994349493', 'Vodnikova 12 10000 Zagreb', 1100.00),
    ('Stipe', 'Peric', 'stipe.peric@gmail.com', '0982383834', 'Vodnikova 13 10000 Zagreb', 1100.00),
    ('Roko', 'Rokic', 'roko.rokic@gmail.com', '0913823843', 'Vodnikova 14 10000 Zagreb', 1100.00);

-- Stavlja podatke o nazivima podruznica i voditeljima podruznica
INSERT INTO Podruznice (Ime_podruznice, Voditelj_podruznice) VALUES
    ('Recepcija', 1),
    ('Rezervacijski centar', 2),
    ('Marketing', 3),
    ('Razvojni centar', 4),
    ('Informacijski centar', 5),
    ('Apartmani', 6),
    ('Kamp', 7),
    ('Sektor za odrzavanje cistoce', 8);

-- Stavlja podatke o djelatnicima koji spadaju u odredene podruznice
INSERT INTO Djelatnici_podruznica (ID_djelatnika, ID_podruznice) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 2),
    (10, 6),
    (11, 3),
    (12, 1),
    (13, 7),
    (14, 8);

-- Prikuplja podatke o svim djelatnicima i njihovim placama
SELECT CONCAT (Ime_djelatnika, Prezime_djelatnika) AS 'Ime i Prezime', Placa_djelatnika AS 'Placa'
FROM Djelatnici_podruznica;

-- Prikuplja podatke o voditeljima podruznica i izracunava njihovu prosjecnu placu
SELECT AVG(p.placa) AS 'Prosjecna placa voditelja'
FROM djelatnik d
JOIN podruznica p ON v.voditelj = i.ID_djelatnika;

-- Delimiter funkcija koja sluzi za izracun prosjecne place svih djelatnika.
DELIMITER $$

CREATE PROCEDURE IF NOT EXISTS izracunaj_prosjecnu_placu() 
BEGIN

SELECT ROUND(AVG(placa), 2) AS 'Prosjecna placa djelatnika'
FROM Djelatnici_podruznica;

END $$
DELIMITER ;

-- Funkcija koja sluzi za sortiranje djelatnika po podruznicama
SELECT CONCAT (i.Ime_djelatnika, ' ', p.Prezime_djelatnika) AS d.Djelatnici_podruznica, p.Ime_podruznice AS 'Djelatnik u podruznici'
FROM Djelatnik d
JOIN Djelatnici_podruznica dp ON i.ID_podruznice = id.ID_djelatnika
JOIN Podruznica p ON id.ID_djelatnika = i.ID_podruznice
GROUP BY Djelatnici_podruznica, ip.Ime_podruznice;

-- Funkcija koja sluzi za sortiranje voditelja po podruznicama
SELECT ip.Ime_podruzniceAS 'Podruznica', CONCAT (i.Ime_djelatnika, ' ', p.Prezime_djelatnika) AS 'Voditelj podruznice'
FROM Podruznica p
JOIN Djelatnik d ON i.ID_podruznice = v.Voditelj_podruznice;