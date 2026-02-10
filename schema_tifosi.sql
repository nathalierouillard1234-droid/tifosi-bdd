# tifosi-bdd
CREATE DATABASE tifosi
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
CREATE USER 'tifosi'@'localhost' IDENTIFIED BY 'MotDePasseFort123!';

GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';

FLUSH PRIVILEGES;
CREATE TABLE ingredient (
    id_ingredient INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL UNIQUE,
    vegetarien BOOLEAN NOT NULL DEFAULT FALSE
);
CREATE TABLE focaccia (
    id_focaccia INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL CHECK (prix >= 0)
);

);
CREATE TABLE marque (
    id_marque INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL UNIQUE
);