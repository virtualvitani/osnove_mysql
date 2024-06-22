CREATE TABLE IF NOT EXISTS Members (
    id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Martina VARCHAR(20) NOT NULL,
    Member_ID_31 VARCHAR(30) NOT NULL,
    Matea VARCHAR(20) NOT NULL,
    Member_ID_32 VARCHAR(30) NOT NULL,
    Luka VARCHAR(20) NOT NULL,
    Member_ID_33 VARCHAR(30) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Books (
    id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Witcher VARCHAR(40) NOT NULL,
    Harry_Potter VARCHAR(40) NOT NULL,
    Lord_Of_The_Rings VARCHAR(40) NOT NULL,
    Song_Of_Ice_And_Fire VARCHAR(40) NOT NULL,
    Percy_Jackson VARCHAR(40) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Genre (
    id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Witcher__Fantasy VARCHAR(40) NOT NULL,
    Harry_Potter__Children_Fantasy VARCHAR(40) NOT NULL,
    Lord_Of_The_Rings__Fantasy VARCHAR(40) NOT NULL,
    Song_Of_Ice_And_Fire__Fantasy VARCHAR(40) NOT NULL,
    Percy_Jackson__Fantasy VARCHAR(40) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Book_Copies (
    id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Witcher__20 VARCHAR(40) NOT NULL,
    Harry_Potter__50 VARCHAR(40) NOT NULL,
    Lord_Of_The_Rings__30 VARCHAR(40) NOT NULL,
    Song_Of_Ice_And_Fire__60 VARCHAR(40) NOT NULL,
    Percy_Jackson__25 VARCHAR(40) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Borrow (
    id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Luka__Witcher VARCHAR(50) NOT NULL,
    Matea__Harry_Potter VARCHAR(50) NOT NULL,
    Martina__Percy_Jackson VARCHAR(50) NOT NULL
)ENGINE=InnoDB;