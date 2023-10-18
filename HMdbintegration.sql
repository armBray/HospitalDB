use HospitalManagement;

insert into Patient
values	('primo@gmail.com', 'pswprimo', 'primo', 'via piazza', 'femminile','65435');

insert into Patient
values 	('secondo@gmail.com', 'pswsecondo', 'secondo', 'via', 'maschile','65435'),
		('terzo@gmail.com', 'pswterzo', 'terzo', 'via piazza', 'femminile','65435'),
        ('quarto@gmail.com', 'pswquarto', 'quarto', 'via', 'maschile','65435');

insert into Patient (email, password)
values 	('quinto@gmail.com', 'pswquinto');

select * from Patient;
select * from Patient where address = 'maschile';
select * from Patient where address is null;

update Patient 
set name = 'nameupdated', gender = 'maschile'
where email = 'quinto@gmail.com';

DELETE FROM `HospitalManagement`.`Patient` WHERE (`email` = 'primo@gmail.com');
DELETE FROM Patient WHERE (`email` = 'primo@gmail.com');

set autocommit = off; /*disable autocommit*/
delete from Patient; /*Unwanted delete*/
rollback; /*restore previous values*/
delete from Patient; /*wanted delete*/
commit; /*commit delete*/

insert into Appointment
values	(4, current_date(), current_time(), current_timestamp() + 2, 'buono'); 
select * from Appointment;

ALTER TABLE Patient
add constraint ciao check (gender = 'maschile' or gender = 'femminile' or gender = null);

/*
ALTER TABLE Patient
drop constraint ciao;
*/

SET FOREIGN_KEY_CHECKS = 0;
alter table Appointment
modify column id INT AUTO_INCREMENT;
SET FOREIGN_KEY_CHECKS = 1;
show keys from Appointment;

alter table Appointment
auto_increment = 100;

insert into Appointment 
values	(default,current_date(), current_time(), current_time() + 2, 'buono'); 
select * from Appointment;


/*JOINS*/
insert into MedicalHistory
values 	(1,current_date(),'prova', 'operazione1','medicazione1'),
		(2,current_date(),'prova', 'operazione2','medicazione2'),
        (3,current_date(),'prova', 'operazione3','medicazione3'),
        (4,current_date(),'prova', 'operazione4','medicazione4');
select * from MedicalHistory;

select * from Patient;

insert into PatientFillHistory
values 	('quarto@gmail.com',1),
		('quinto@gmail.com',2);
select * from PatientFillHistory;

select *
from PatientFillHistory inner join MedicalHistory
on PatientFillHistory.history = MedicalHistory.id;

select *
from PatientFillHistory left join MedicalHistory
on PatientFillHistory.history = MedicalHistory.id;

select *
from PatientFillHistory right join MedicalHistory
on PatientFillHistory.history = MedicalHistory.id;