CREATE DATABASE IF NOT EXISTS `framework`;
USE `framework`;

CREATE TABLE 'user_identifiers' (
    `steamname` VARCHAR(60) NOT NULL,
    `steamid` VARCHAR(60) NOT NULL,
    `license` VARCHAR(60) NOT NULL,
    `discord` VARCHAR(60) NOT NULL,
    `fivem` VARCHAR(60) NOT NULL,
    `ip` VARCHAR(60) NOT NULL,
    PRIMARY KEY(`steamid`)
);

CREATE TABLE `user_information` (
    `steamname` VARCHAR(60) NOT NULL,
    `steamid` VARCHAR(60) NOT NULL,
    `position` VARCHAR(60) NOT DEFAULT '{269.4, -955.3, 31.2}',
    PRIMARY KEY('steamid'),
    CONSTRAINT `FK_user_information_user_identifiers`
    FOREIGN KEY ('steamid')
    REFERENCES `user_identifers` (`steamid`)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);