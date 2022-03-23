CREATE DATABASE TWO;
USE TWO;
create table unit(unit_no int not null,seater int not null,primary key(unit_no,seater),no_of_rooms int not null,total_fees int not null);

create table warden(unit_no int not null,foreign key(unit_no) references unit(unit_no),wname varchar(30) not null,wphone bigint not null,wemail varchar(30) not null,primary key(wphone));

CREATE TABLE STUDENT(SRN VARCHAR(20) NOT NULL,PRIMARY KEY(SRN),SFNAME VARCHAR(20) NOT NULL,SLNAME VARCHAR(20) NOT NULL,DEPT VARCHAR(20) NOT NULL,YEAR INT NOT NULL,S_EMAIL VARCHAR(20) NOT NULL ,S_PHONE BIGINT NOT NULL,DOB DATE,FEES_PAID INT NOT NULL);
CREATE TABLE LIVES_IN(SRN VARCHAR(20) NOT NULL,PRIMARY KEY (SRN),FOREIGN KEY (SRN) REFERENCES STUDENT(SRN) ON UPDATE CASCADE ON DELETE CASCADE,UNIT_NO INT NOT NULL,SEATER INT NOT NULL,FOREIGN KEY (UNIT_NO,SEATER) REFERENCES UNIT (UNIT_NO,SEATER) ON UPDATE CASCADE ON DELETE CASCADE,ROOM_NO INT NOT NULL);

CREATE TABLE TOOK_LEAVE(SRN VARCHAR(20) NOT NULL,FOREIGN KEY(SRN) REFERENCES STUDENT(SRN) ON UPDATE CASCADE ON DELETE CASCADE,LEAVE_TYPE VARCHAR(30) NOT NULL,PRIMARY KEY(SRN,LEAVE_TYPE),DAY_IN DATE,DAY_OUT DATE);

CREATE TABLE LG_ADDRESS(LPHONE BIGINT NOT NULL,PRIMARY KEY(LPHONE),LG_FNAME VARCHAR(30) NOT NULL,LG_LNAME VARCHAR(30) NOT NULL,LGADDRESS VARCHAR(50) NOT NULL,LG_EMAIL VARCHAR(25) NOT NULL,LG_REL VARCHAR(20) NOT NULL);
CREATE TABLE LG_PHONE(SRN VARCHAR(20) NOT NULL,FOREIGN KEY(SRN) REFERENCES STUDENT(SRN)  ON UPDATE CASCADE ON DELETE CASCADE,LPHONE BIGINT NOT NULL,FOREIGN KEY(LPHONE) REFERENCES LG_ADDRESS(LPHONE)  ON UPDATE CASCADE ON DELETE CASCADE,PRIMARY KEY(SRN));
CREATE TABLE PARENT_ADDRESS(P_PHONE BIGINT NOT NULL,PRIMARY KEY(P_PHONE),PFNAME VARCHAR(30) NOT NULL,PLNAME VARCHAR(30) NOT NULL,P_ADDRESS VARCHAR(50) NOT NULL,P_EMAIL VARCHAR(25) NOT NULL);

CREATE TABLE PARENT_PHONE(SRN VARCHAR(20) NOT NULL,FOREIGN KEY(SRN) REFERENCES STUDENT(SRN)  ON UPDATE CASCADE ON DELETE CASCADE,P_PHONE BIGINT NOT NULL,FOREIGN KEY(P_PHONE) REFERENCES PARENT_ADDRESS(P_PHONE)  ON UPDATE CASCADE ON DELETE CASCADE,PRIMARY KEY(SRN,P_PHONE));

ALTER TABLE warden
ADD CONSTRAINT CHK_Phone_valid
CHECK (wphone >= 6000000 AND wphone <= 9999999999);

alter table STUDENT
add constraint ck_dept
check (DEPT in ('COMPUTER SCIENCE', 'ECE','MECH'));

alter table STUDENT
add constraint ck_year
check (year>=1 AND year<=5);

alter table lg_address
add constraint ck_add
check (LGADDRESS like '%BANGALORE%');

alter table TOOK_LEAVE
add constraint check_date
check (DAY_in >= DAY_out);

ALTER TABLE STUDENT
ADD CONSTRAINT CHK_SPhone_valid
CHECK (s_phone >= 6000000 AND s_phone <= 9999999999);

alter table TOOK_LEAVE
add constraint LEAVETYPES
check (LEAVE_TYPE in ('HOME', 'INTERVIEW','LG','COLLEGE'));
ALTER TABLE WARDEN
ADD UNIQUE (WPHONE,WEMAIL);
ALTER TABLE STUDENT
ADD UNIQUE (S_PHONE,S_EMAIL);

ALTER TABLE PARENT_ADDRESS
ADD UNIQUE (P_PHONE,P_EMAIL);

ALTER TABLE LG_ADDRESS
ADD UNIQUE (LPHONE,LG_EMAIL);

INSERT INTO UNIT(UNIT_NO,SEATER,NO_OF_ROOMS,TOTAL_FEES)
VALUES
("1","1","10","150000"),
("1","2","3","100000"),
("2","3","20","120000"),
("2","4","10","90000"),
("3","1","10","160000");
INSERT INTO WARDEN
VALUES
("1","CHARLOTTE","9812345611","charlotte@gmail.com"),
("2","VERA","9127308711","VERQ@GMAIL.COM"),
("3","JOANNE","9127228711","JK@GMAIL.COM"),
("2","MIA","9199934523","MIAAA@GMAIL.COM");


INSERT INTO STUDENT(SRN,SFNAME,SLNAME,DEPT,YEAR,S_EMAIL,S_PHONE,DOB,FEES_PAID) VALUES
("A1","LARRY","PAGE","COMPUTER SCIENCE","2","LARRYPAGE@GMAIL.COM",'9567312233','1999-05-06',"10000"),
("A2","STACY","M","ECE","4","STACYM@GMAIL.COM",'9564546233','1999-07-16',"10000"),
("A3","JIYA","S","COMPUTER SCIENCE","2","JIYA6@GMAIL.COM",'956331234','1999-08-12',"10000"),
("A4","JENNY","MIA","MECH","4","JENNYY@GMAIL.COM",'9344546233','1997-02-16',"10000"),
("A5","SIA","Z","ECE","2","SIAA@GMAIL.COM",'9341256233','1999-02-16',"10000"),
("A6","ZOYA","A","COMPUTER SCIENCE","2","ZOYAAA@GMAIL.COM",'9244546987','1999-02-16',"10000"),
("A9","ZENITH","Q","MECH","2","ZEN@GMAIL.COM",'9614782290','1999-02-16',"10000"),
("A10","RIYA","SS","ECE","3","RIYAA@GMAIL.COM",'9418782570','1998-08-17',"10000"),
("A7","MINA","KK","COMPUTER SCIENCE","3","MINAK@GMAIL.COM",'9418982570','1998-09-17',"10000"),
("A8","ASHA","CC","ECE","3","ASHAA@GMAIL.COM",'9488782978','1998-08-17',"10000");

INSERT INTO LIVES_IN
VALUES
("A1","1","2","101"),
("A3","1","2","102"),
("A4","1","2","103"),
("A5","3","1","301"),
("A6","1","2","101"),
("A7","1","2","102"),
("A8","1","1","001"),
("A9","1","1","002"),
("A10","1","1","003"),
("A2","2","3","001");
INSERT INTO PARENT_ADDRESS VALUES
(9824996375,"Priya","Menon","NO 6,SUP APARTMENTS,DELHI","priya@gmail.com"),
(9824936376,"Al","Menon","NO 6,SUP APARTMENTS,DELHI","akmenon@gmail.com"),
(9145385068,"Deanne","Queen","NO 6,GREEN HOMES,BHOPAL,MP","Deanneq@gmail.com"),
(9279517193,"Sasha","Z","NO 5,ETHEREAL HOMES,JAIPUR,RAJASTHAN","Sashaz@gmail.com"),
(9617309476,"Alicia","Q","NO 10,ISLA TOWERS,WHITEFIELD,BANGALORE","ally@gmail.com"),
(9186287076,"Flora","A","NO 2,HERMES TOWERS,KORAMANGALA,BANGALORE","flora@gmail.com"),
(9685280218,"Sahana","Z","NO 12,HESTIA TOWERS,WHITEFIELD,BANGALORE","sahaa@gmail.com"),
(9685480219,"Dan","Z","NO 12,HESTIA TOWERS,WHITEFIELD,BANGALORE","Hz@gmail.com"),
(9547480706,"Ajita","P","NO 210,ISLA TOWERS,WHITEFIELD,BANGALORE","aji34@gmail.com"),
(9522429050,"Sia","R","NO 220,ZENITH TOWERS,MUMBAI","siar4@gmail.com"),
(9396654017,"Gianne ","A","NO 16,HESTIA TOWERS,WHITEFIELD,BANGALORE","gianna@gmail.com");
INSERT INTO PARENT_PHONE VALUES
("A1",9824996375),
("A1",9824936376),
("A2",9145385068),
("A3",9279517193),
("A4",9617309476),
("A5",9186287076),
("A6",9685280218),
("A6",9685480219),
("A7",9547480706),
("A8",9522429050),
("A9",9396654017),
("A10",9186287076);

INSERT INTO LG_ADDRESS VALUES
(9827996375,"holly", "G","NO 2,ISLA TOWERS,WHITEFIELD,BANGALORE","holly@gmail.com","aunt"),
(9143385068,"Sophie", " T","NO 6,HERMES TOWERS,KORAMANGALA,BANGALORE","sophiee@gmail.com","aunt"),
(9271517193,"Darrell", " J","NO 5,HESTIA TOWERS,WHITEFIELD,BANGALORE","darell@gmail.com","aunt"),
(9617309476,"Alicia", " Q","NO 10,ISLA TOWERS,WHITEFIELD,BANGALORE","ally@gmail.com","mother"),
(9186287076,"Flora ", "A","NO 2,HERMES TOWERS,KORAMANGALA,BANGALORE","flora@gmail.com","mother"),
(9685280218,"Sahana", " Z","NO 12,HESTIA TOWERS,WHITEFIELD,BANGALORE","sahaa@gmail.com","mother"),
(9547480706,"Ajita ", "P","NO 210,ISLA TOWERS,WHITEFIELD,BANGALORE","aji34@gmail.com","mother"),
(9396654017,"Gianne", " A","NO 16,HESTIA TOWERS,WHITEFIELD,BANGALORE","gianna@gmail.com","cousin"),
(9522429050,"Molly", " W","NO 3,ISLA TOWERS,WHITEFIELD,BANGALORE","molly@gmail.com","aunt");

INSERT INTO LG_PHONE VALUES
("A1",9827996375),
("A2",9143385068),
("A3",9271517193),
("A4",9617309476),
("A5",9186287076),
("A6",9685280218),
("A7",9547480706),
("A8",9522429050),
("A9",9396654017),
("A10",9186287076);
INSERT INTO TOOK_LEAVE() VALUES
("A1","HOME",'2020-02-15','2020-02-15');



delimiter //

CREATE TRIGGER ROOM_CHECK BEFORE INSERT ON LIVES_IN
       FOR EACH ROW
       
       BEGIN
           
           IF NEW.UNIT_NO="1" AND NEW.SEATER="1" AND NEW.ROOM_NO<"1" THEN
           SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "wrong room";
           END IF;

           IF NEW.UNIT_NO="1" AND NEW.SEATER="1" AND NEW.ROOM_NO>"10" THEN
           SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "wrong room";
           END IF;


           IF NEW.UNIT_NO="1" AND NEW.SEATER="2" AND NEW.ROOM_NO<"101" THEN
           SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "wrong room";
           END IF;

           IF NEW.UNIT_NO="1" AND NEW.SEATER="2" AND NEW.ROOM_NO>"103" THEN
           SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "wrong room";
           END IF;


           IF NEW.UNIT_NO="2" AND NEW.SEATER="3" AND NEW.ROOM_NO<"201" THEN
           SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "wrong room";
           END IF;

           IF NEW.UNIT_NO="2" AND NEW.SEATER="3" AND NEW.ROOM_NO>"220" THEN
           SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "wrong room";
           END IF;

           IF NEW.UNIT_NO="2" AND NEW.SEATER="4" AND NEW.ROOM_NO<"1" THEN
           SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "wrong room";
           END IF;

           IF NEW.UNIT_NO="2" AND NEW.SEATER="4" AND NEW.ROOM_NO>"10" THEN
           SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "wrong room";
           END IF;

           IF NEW.UNIT_NO="3" AND NEW.SEATER="1" AND NEW.ROOM_NO<"1" THEN
           SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "wrong room";
           END IF;

           IF NEW.UNIT_NO="3" AND NEW.SEATER="1" AND NEW.ROOM_NO>"10" THEN
           SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "wrong room";
           END IF;
       END;//
delimiter ;


DROP TABLE IF EXISTS INCR;

DROP PROCEDURE IF EXISTS DOWHILE;
 CREATE TABLE `incr` (
  `Id` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`Id`)
);

DELIMITER ;;
CREATE PROCEDURE dowhile()
BEGIN
  DECLARE v1 INT DEFAULT 10;
  WHILE v1 > 0 DO
    INSERT incr VALUES (NULL);
    SET v1 = v1 - 1;
  END WHILE;
END;;
DELIMITER ;

delimiter //
CREATE TRIGGER upd_check BEFORE INSERT ON LIVES_IN
       FOR EACH ROW
       FOLLOWS ROOM_CHECK
       BEGIN
           declare current_quantity int;

           SELECT COUNT(SRN) FROM LIVES_IN WHERE LIVES_IN.ROOM_NO=NEW.ROOM_NO into current_quantity;
           IF current_quantity = NEW.SEATER THEN
               SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'UNAVAILABLE';
           END IF;
       END;//
delimiter ;

delimiter //

CREATE TRIGGER tr_two BEFORE INSERT ON LIVES_IN
       FOR EACH ROW
       FOLLOWS UPD_CHECK
       BEGIN
           declare parentphone bigint;
           
           SELECT P_PHONE FROM PARENT_PHONE WHERE PARENT_PHONE.SRN=NEW.SRN into parentphone;
           
           IF parentphone IS NULL THEN
               SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ENTER PARENT DETAILS';
           END IF;
       END;//
delimiter ;

delimiter //
CREATE TRIGGER tr_one BEFORE INSERT ON LIVES_IN
       FOR EACH ROW
       FOLLOWS tr_two
       BEGIN
           declare current_quantity int;
           declare final_quantity int;
           SELECT COUNT(DISTINCT ROOM_NO) FROM LIVES_IN WHERE LIVES_IN.UNIT_NO=NEW.UNIT_NO AND  LIVES_IN.SEATER=NEW.SEATER into current_quantity;
           SELECT NO_OF_ROOMS FROM UNIT WHERE UNIT.UNIT_NO=NEW.UNIT_NO AND UNIT.SEATER=NEW.SEATER INTO FINAL_QUANTITY;
           IF current_quantity < FINAL_QUANTITY THEN
               SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'EMPTY ROOMS';
           END IF;
       END;//
delimiter ;
DROP trigger tr_one;
delimiter //

CREATE TRIGGER tr_three BEFORE INSERT ON LIVES_IN
       FOR EACH ROW
       FOLLOWS tr_two
       BEGIN
           declare lgphone bigint;
           
           SELECT LPHONE FROM LG_PHONE WHERE LG_PHONE.SRN=NEW.SRN into lgphone;
           
           IF lgphone IS NULL THEN
               SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ENTER lg DETAILS';
           END IF;
       END;//
delimiter ;

DROP TRIGGER IF EXISTS TR_FOUR;
delimiter //

CREATE TRIGGER tr_four BEFORE DELETE ON STUDENT
       FOR EACH ROW
       BEGIN
           declare phone1 bigint;
           declare phone2 bigint;
           declare stud int;
           declare no_of_s int;
           SELECT COUNT(SRN) FROM PARENT_PHONE WHERE PARENT_PHONE.SRN=OLD.SRN INTO STUD;
           SELECT COUNT(S.SRN) FROM PARENT_PHONE S INNER JOIN
           PARENT_PHONE T ON T.P_PHONE=S.P_PHONE
           WHERE T.SRN<>S.SRN AND T.SRN=OLD.SRN INTO no_of_s;

           SELECT S.P_PHONE,T.P_PHONE FROM PARENT_PHONE S
           INNER JOIN PARENT_PHONE T 
           WHERE S.P_PHONE < T.P_PHONE AND S.SRN=OLD.SRN AND T.SRN=OLD.SRN into phone1,phone2;
           
           IF no_of_s=0 THEN

           DELETE FROM PARENT_ADDRESS WHERE P_PHONE=phone1;
           DELETE FROM PARENT_ADDRESS WHERE P_PHONE=phone2;
           END IF;
           IF stud>1 THEN
           DELETE FROM PARENT_PHONE WHERE SRN=OLD.SRN;
           END IF;


       END;//
delimiter ;

delimiter //
CREATE TRIGGER tr_five BEFORE DELETE ON STUDENT
       FOR EACH ROW
       FOLLOWS tr_four
       BEGIN
           declare phone bigint;
           declare stud int;

           SELECT LPHONE FROM LG_PHONE WHERE LG_PHONE.SRN=OLD.SRN into phone;
           SELECT COUNT(SRN) FROM LG_PHONE WHERE LG_PHONE.LPHONE=phone into stud;
           IF stud=1 THEN
           DELETE FROM LG_ADDRESS WHERE LPHONE=phone;
           END IF;
       END;//
delimiter ;

DROP procedure if exists display_student;
delimiter //
create procedure display_student() 
begin 
select * from student; 
end //
delimiter ;

DROP procedure if exists display_unit;
delimiter //
create procedure display_unit() 
begin 
select * from unit; 
end //
delimiter ;


DROP procedure if exists display_lives_in;
delimiter //
create procedure display_lives_in() 
begin 
select * from lives_in; 
end //
delimiter ;

DROP procedure if exists display_warden;
delimiter //
create procedure display_warden() 
begin 
select * from warden; 
end //
delimiter ;

DROP procedure if exists display_lg_phone;
delimiter //
create procedure display_lg_phone() 
begin 
select * from lg_phone; 
end //
delimiter ;

DROP procedure if exists display_lg_address;
delimiter //
create procedure display_lg_address() 
begin 
select * from LG_ADDRESS; 
end //
delimiter ;


DROP procedure if exists display_parent_address;
delimiter //
create procedure display_parent_address() 
begin 
select * from parent_ADDRESS; 
end //
delimiter ;


DROP procedure if exists display_parent_phone;
delimiter //
create procedure display_parent_phone() 
begin 
select * from lg_phone; 
end //
delimiter ;



DROP procedure if exists display_TOOK_leave;
delimiter //
create procedure display_took_leave() 
begin 
select * from took_leave; 
end //
delimiter ;
/*
call display_student() \G; 
call display_unit() \G;
call display_warden() \G;
call display_parent_phone() \G;
call display_lg_phone() \G;
call display_parent_address() \G;
call display_lg_address() \G;
call display_took_leave() \G;
call display_lives_in() \G;
*/
/*

call dowhile();
SELECT * FROM INCR;
INSERT INTO LIVES_IN VALUES ("A7","1","1","005");
SELECT ROOM_NO FROM LIVES_IN WHERE LIVES_IN.SEATER="1" AND LIVES_IN.UNIT_NO="1";
SELECT * FROM INCR WHERE INCR.ID NOT IN 
(SELECT ROOM_NO FROM LIVES_IN JOIN INCR WHERE LIVES_IN.ROOM_NO=INCR.ID AND LIVES_IN.UNIT_NO="1" AND LIVES_IN.SEATER="1");
*/




DROP TRIGGER IF EXISTS TR_FOUR;
delimiter //

CREATE TRIGGER tr_four BEFORE DELETE ON STUDENT
       FOR EACH ROW
       BEGIN
           declare phone bigint;
           declare stud int;
           declare no_of_s int;
           SELECT COUNT(SRN) FROM PARENT_PHONE WHERE PARENT_PHONE.SRN=OLD.SRN INTO STUD;
           SELECT COUNT(S.SRN) FROM PARENT_PHONE S INNER JOIN
           PARENT_PHONE T ON T.P_PHONE=S.P_PHONE
           WHERE T.SRN<>S.SRN AND T.SRN=OLD.SRN INTO no_of_s;

           SELECT S.P_PHONE FROM PARENT_PHONE S
           INNER JOIN PARENT_PHONE T 
           WHERE S.P_PHONE < T.P_PHONE AND S.SRN=OLD.SRN AND T.SRN=OLD.SRN into phone;
           
           IF no_of_s=0 THEN

           DELETE FROM PARENT_PHONE WHERE P_PHONE=phone;
           END IF;
           IF stud>1 THEN
           DELETE FROM PARENT_PHONE WHERE SRN=OLD.SRN;
           END IF;


       END;//
delimiter ;
