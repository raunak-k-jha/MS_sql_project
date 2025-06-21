create database banking_system;
use banking_system;
/*creation of tables*/
create table branch (
branch_name varchar(255) unique not null,
branch_id int primary key,
branch_address_statename varchar(255) unique not null,
branch_address_pincode varchar(255) unique not null,
branch_asset bigint not null,
branch_liability bigint not null
);
/*##alter:add/modify/rename*/
alter table branch add branch_address_cityname varchar(255) not null;
select * from branch;


CREATE TABLE per_rel_to_bank (
    fname VARCHAR(255) NOT NULL,
    mname VARCHAR(255),
    lname VARCHAR(255),
    address VARCHAR(500) NOT NULL,
    dob DATE NOT NULL,
    age int not null
);

select * from per_rel_to_bank;

create table employee(
e_id int primary key,
e_post varchar(255) not null,
e_department varchar(255) not null
);
select * from employee;

create table customer(
c_id int primary key);
select * from customer;

create table bank_accounts(
account_number int primary key,
account_balance int not null
);

create table savings_account(
interest_rate int default 6.25,
daily_withdrawl_limit int not null
);

create table current_account(
per_transaction_ch int default 10,
overdraft_amt int
);

create table loan (
loan_id int primary key,
loan_amount int 
);

create table payment (
payment_number int primary key IDENTITY(1,1),
pay_amount int not null
);

/*#STEP 02 : CREATION OF RELATIONSHIP AMONG THEM*/
/* A) all person_rel_to_bank is connected to a specific branch*/

alter table per_rel_to_bank add bank_id int not null;
alter table per_rel_to_bank  add foreign key(bank_id) references branch(branch_id) on delete cascade;
select * from per_rel_to_bank;

/*##B)person related to bank relate*/

alter table per_rel_to_bank add person_id int primary key IDENTITY(1,1);
select * from per_rel_to_bank;
alter table employee  add  p_id int;
alter table customer add  p_id int;
alter table  employee  add  foreign key(p_id) references per_rel_to_bank(person_id) on delete cascade;
alter table customer  add  foreign key(p_id) references per_rel_to_bank(person_id) on delete cascade;
select * from employee;
select * from customer;

/*##c)account generalization handle*/

alter table savings_account  add  abtacc int;
alter table current_account add  abtacc int;
alter table savings_account add  foreign key(abtacc) references bank_accounts(account_number) on delete cascade;
alter table current_account add  foreign key(abtacc) references bank_accounts(account_number) on delete cascade;
select * from savings_account;
select * from current_account;

/*##d))loan has payment*/

alter table payment add  l_id int;
alter table payment add  foreign key(l_id) references loan(loan_id) on delete cascade;
select * from payment;

/*#e) customer takes loan*/
alter table loan add  infocust_id int;
alter table loan add  foreign key(infocust_id) references customer(c_id) on delete cascade;
select * from loan;

/*#f) customer has accounts*/

alter table bank_accounts add abtcust int;
alter table bank_accounts add  foreign key(abtcust) references customer(c_id) on delete cascade;
select * from bank_accounts;


/*#g)employee manages employee*/

alter table employee add manager_id int not null;
select * from employee;

