CREATE TABLE IF NOT EXISTS USERS (
    ID    BIGINT UNSIGNED PRIMARY KEY COMMENT 'REF Owner(ID)',
    EMAIL VARCHAR(128) NOT NULL UNIQUE,
    NAME  VARCHAR(128) NOT NULL UNIQUE,
    INDEX (EMAIL),
    INDEX (NAME)
);

CREATE TABLE IF NOT EXISTS GROUPS (
    ID    BIGINT UNSIGNED PRIMARY KEY COMMENT 'REF Owner(ID)',
    NAME  VARCHAR(128) NOT NULL UNIQUE,
    OWNER BIGINT UNSIGNED NOT NULL COMMENT 'REF USERS(ID)',
    INDEX (NAME),
    INDEX (OWNER)
);

CREATE TABLE IF NOT EXISTS OWNERS (
    ID   BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(128) NOT NULL UNIQUE,
    TYPE TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0 for user, 1 for group',
    INDEX (NAME)
);

CREATE TABLE IF NOT EXISTS CATEGORIES (
    ID    INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    NAME  VARCHAR(64)   NOT NULL DEFAULT 'default',
    OWNER BIGINT UNSIGNED NOT NULL COMMENT 'REF Owner(ID)',
    UNIQUE (NAME, OWNER),
    INDEX (OWNER),
    INDEX (NAME, OWNER)
);

CREATE TABLE IF NOT EXISTS TODOS (
    ID    BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TITLE VARCHAR(1024) NOT NULL DEFAULT '',
    OWNER BIGINT UNSIGNED  NOT NULL COMMENT 'REF Owner(ID)',
    CREATOR BIGINT UNSIGNED NOT NULL COMMENT 'REF USERS(ID)',
    PRIORITY TINYINT(1)  NOT NULL DEFAULT 1 COMMENT '0 for low, 1 for medium, 2 for high',
    CATEGORY INT UNSIGNED NOT NULL,
    CREATE_AT DATETIME NOT NULL DEFAULT '1986-01-01 00:00:00',
    TO_COMPLETE_AT DATETIME,
    COMPLETE_AT    DATETIME,
    COMPLETED      BOOLEAN                 DEFAULT FALSE,
    TEXT           TEXT,
    INDEX (TITLE),
    INDEX (CATEGORY),
    INDEX (COMPLETED),
    INDEX (CREATE_AT),
    INDEX (TO_COMPLETE_AT),
    INDEX (COMPLETE_AT)
);




