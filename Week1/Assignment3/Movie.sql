create user c##dhwani identified by root;
/*For ORACLE DATABASE.
Will need some modification to execute in MySQL and other Database software.
*/

create table cust
(
Cust_id varchar(3) primary key,
lname varchar(15),
fname varchar(15),
area varchar(2),
phone_no number(8)
);

create table movie
(
mv_no varchar(2) primary key,
title varchar(25),
type varchar(10),
star varchar(25)
);

create table invoice
(
Inv_no varchar(3) primary key,
Mv_no varchar(2),
Cust_id varchar(3),
Issue_date date,
Return_date date
);

alter table invoice
add constraint c1
foreign key(cust_id)
references cust(cust_id);

alter table invoice
add constraint c2
foreign key(mv_no)
references movie(mv_no);

alter table cust
modify (lname not null, fname not null);

alter table movie
modify (title not null, type not null);

alter table movie
add price number(8,2);
insert into cust values ('a01','Bayross','Ivan','sa',6125467);
insert into cust values ('a02','Saitwal','Vandana','mu',5560379);
insert into cust values ('a03','Jaguste','Pramada','da',4563891);
insert into cust values ('a04','Navindgi','Basu','ba',6125401);
insert into cust (cust_id,lname,fname,area) values ('a05','Sreedharan','Ravi','va');
insert into cust values ('a06',' ','Rukmini','gh',5125274);

insert into movie values ('1','bloody vengeance','action','jackie chan',180.95);
insert into movie values ('2','the firm','thriller','tom cruise',200.00);
insert into movie values ('3','pretty woman','romance','richard gere',200.00);
insert into movie values ('4','home alone','comedy','macaulay culkin',150);
insert into movie values ('5','the fugitive','thriller','harisson ford',200.00);
insert into movie values ('6','coma','suspense','michael douglas',100.00);
insert into movie values ('7','dracula','horror','gary oldman',150.25);
insert into movie values ('8','quick change','comedy','bill muray',100.00);
insert into movie values ('9','gone with the wind','drama','clarke gable',200.00);
insert into movie values ('10','carry on doctor','comedy','leslie phillips',100.00);

insert into invoice values ('i01','4','a01','23-jul-93','25-jul-93');
insert into invoice values ('i02','3','a02','12-aug-93','15-aug-93');
insert into invoice values ('i03','1','a02','15-aug-93','18-aug-93');
insert into invoice values ('i04','6','a03','10-sep-93','12-sep-93');
insert into invoice values ('i05','7','a04','05-aug-93','08-aug-93');
insert into invoice values ('i06','2','a06','18-sep-93','21-sep-93');
insert into invoice values ('i07','9','a05','07-jul-93','10-jul-93');
insert into invoice values ('i08','9','a01','11-aug-93','14-aug-93');
insert into invoice values ('i09','5','a03','06-jul-93','07-jul-93');
insert into invoice values ('i10','8','a06','03-sep-93','06-sep-93');

--Find out the first names of all the customers.
select fname from cust;

--Print the entire customer table.
select * from cust;

--Retrieve the list of fname and the area of all the customers.
select fname,area from cust;

--List the various movie types available from the movie table.
select type from movie;
