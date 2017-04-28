DROP DATABASE IF EXISTS libraru;
CREATE DATABASE IF NOT EXISTS libraru;
USE libraru;
CREATE TABLE Author
(
	AUTHOR_ID SERIAL,
    AUTHOR_NAME VARCHAR(56) NOT NULL DEFAULT "Unknown",
    PRIMARY KEY(AUTHOR_ID)
);

INSERT INTO Author(AUTHOR_NAME) VALUES
("Тарас Шевченко"),
("Иван Франко"),
("Леся Украинка"),
("Всеволод Нестайко"),
("Павло Тычина");

CREATE TABLE BOOK
(
	BOOK_ID SERIAL,
    AUTHOR_ID BIGINT UNSIGNED,
    BOOK_NAME VARCHAR(126) NOT NULL DEFAULT "Unknown",
    TYPE VARCHAR(126) NOT NULL DEFAULT "Unknown",
    PRIMARY KEY(BOOK_ID),
    FOREIGN KEY (AUTHOR_ID) REFERENCES Author(AUTHOR_ID)
);

INSERT INTO BOOK(AUTHOR_ID,BOOK_NAME,TYPE) VALUES
(4,"Незвичайні пригоди в лісовій школі", "Роман"),
(3,"Лісова пісня", "Поема"),
(1,"Кобзар", "Вірш"),
(2,"Украдене щастя", "Повість"),
(4,"В країні Місячних Зайчиків", "Роман"),
(4,"Незнайомка з країні Сонячних Зайчиків", "Роман"),
(2,"Лис Микита", "Поема"),
(3,"Бояриня", "Поема"),
(4,"Тореадори з Васюкывки", "Роман");

#SELECT BOOK_NAME,AUTHOR_NAME FROM BOOK,Author WHERE (BOOK.TYPE = "Поема" and BOOK.AUTHOR_ID = Author.AUTHOR_ID);
#SELECT TYPE, AUTHOR_ID FROM BOOK;
SELECT TYPE,COUNT(DISTINCT AUTHOR_ID) FROM BOOK WHERE (TYPE='Поема')
UNION
SELECT TYPE,COUNT(DISTINCT AUTHOR_ID) FROM BOOK WHERE (TYPE='Роман')
UNION
SELECT TYPE,COUNT(DISTINCT AUTHOR_ID) FROM BOOK WHERE (TYPE='Вірш')
UNION
SELECT TYPE,COUNT(DISTINCT AUTHOR_ID) FROM BOOK WHERE (TYPE='Повість');