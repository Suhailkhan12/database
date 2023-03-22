create database library;

use library;


--publisher
--name,address,phone

create table publisher(
publisher_name varchar(100) primary key not null,
publisher_address varchar(100) not null,
publisher_phone varchar(100) not null
);

--book
--id,title,publisher name pn update cascade on delete cascade

create table book(
book_id int primary key auto_increment,
book_title varchar(255) not null,
book_publisher_name varchar(100) not null,
foreign key(book_publisher_name) references publisher(publisher_name) on update cascade on delete cascade
);

--library_branch
--id,name,address

create table library_branch(
library_branch_id int primary key auto_increment,
library_branch_name varchar(100) not null,
library_branch_address varchar(255) not null
);

--borrower
--cardno(100,1),name,address,phone

create table borrower(
card_no int primary key auto_increment(100,1),
borrower_name varchar(100) not null,
borrower_address varchar(100) not null,
borrower_phone varchar(100) not null
);


--bookloan
--loanid,bookid,branchid,cardno,dateout,datedue

create table book_loan(
loan_id int primary key auto_increment,
loan_book_id int not null,
loan_branch_id int not null,
loan_card_no int not null,
book_loan_dateout varchar(100) not null,
book_loan_duedate varchar(100) not null,
foreign key(loan_book_id) references book(book_id) on update cascade on delete cascade,
foreign key(loan_branch_id) references library_branch(library_branch_id) on update cascade on delete cascade,
foreign key(loan_card_no) references borrower(card_no) on update cascade on delete cascade
);


--copies
--copiesid,bookid,branchid,no.of copies


create table copies(
copies_id int primary key auto_increment,
copies_book_id int not null,
copies_branch_id int not null,
no_of_copies int not null,
foreign key(copies_book_id) references book(book_id) on update cascade on delete cascade,
foreign key(copies_branch_id) references library_branch(library_branch_id) on update cascade on delete cascade
);


--author
--authorid,bookid,authorname


create table author(
book_author_id int primary key not null auto_increment,
author_book_id int not null,
book_author_name varchar(100) not null,
foriegn key(author_book_id) references book(book_id) on update cascade on delete cascade
);




