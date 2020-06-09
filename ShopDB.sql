create table product(
	pno bigint(10) unsigned not null primary key auto_increment,
    name varchar(100),
    price bigint(10),
    category varchar(50),
    title varchar(200),
    descript varchar(1000),
    regdate datetime default now(),
    uptodate datetime default now()
);
select * from product;
insert into product(name, price) values('상품이름', 10000);
delete from product;
drop table product;

create table cart(
	cno bigint(10) unsigned not null primary key auto_increment,
	userid varchar(50),
    pno bigint(10) unsigned,
    amount int unsigned,
    CONSTRAINT fk_cart_pno FOREIGN KEY(pno) REFERENCES product(pno),
    constraint fk_cart_userid foreign key(userid) references members(userid) on delete cascade
    );
drop table cart;
select * from cart; 
select * from product
where pno in(select pno from cart where userid = 'unknown');
delete from cart;

create table product_attach(
	uuid varchar(100) not null,
    uploadPath varchar(200) not null,
    filename varchar(100) not null,
    filetype char(1) default('I'),
	pno bigint(10) unsigned not null
);
drop table product_attach;
select * from product_attach;
 
alter table product_attach add constraint pk_attach primary key(uuid);
alter table product_attach add constraint fk_product_attach foreign key(pno) references product(pno);

select * from product;

create table members(
	userid varchar(50) not null primary key,
    userpw varchar(100) not null,
    username varchar(100) not null,
    regdate datetime default now(),
    uptodate datetime default now(),
    enabled char(1) default '1'
);
create table authorities(
	userid varchar(50) not null,
    authority varchar(50) not null,
    constraint fk_authorities_users foreign key(userid) references members(userid) on delete cascade
);

select * from members;
select * from authorities;
delete from members;
delete from members where userid in("a","b","admin0");
update members set username = "Tester2", uptodate = now() where userid = "test";
select count(userid) from members where userid = "test";
create unique index ix_auth_username on authorities (userid, authority);

create table if not exists persistent_logins ( 
  username varchar(100) not null, 
  series varchar(64) primary key, 
  token varchar(64) not null, 
  last_used timestamp not null
);

select * from persistent_logins;

create table order_table(
    ordernumber varchar(50) not null primary key,
    userid varchar(50),
    orderer varchar(100),
    orderercontact varchar(100),
    receiver varchar(100),
    receiveraddress varchar(1000),
    orderdate datetime default now(),
	constraint fk_order_userid foreign key(userid) references members(userid) on delete cascade
    );
rename table order_pdt to pdt_on_order;
alter table order_table rename column order_date to orderdate;
delete from order_table where ordernumber = "202005256301" ;
insert into order_table(order_number, userid, orderer, orderer_contact, receiver, receiver_address)
values(concat(DATE_FORMAT(now(), "%Y%m%d"), lpad(floor(rand()*10000), 4, '0')), "member1", "TESTER",
"TEST", "TEST", "TEST"); 
select ordernumber, pno, amount, name, price, category, title from product natural join pdt_on_order; 
select pno, ordernumber, amount, name, price, title from pdt_on_order
		natural
		join product where
		ordernumber like CONCAT('%',"", '%');
select concat(DATE_FORMAT(now(), "%Y%m%d"), lpad(floor(rand()*10000), 4, '0'));


create table pdt_on_order(
	 ordernumber varchar(50),
     pno bigint(10) unsigned not null,
     amount int unsigned,
     constraint fk_order_pdt_ordernumber foreign key(ordernumber) references order_table(ordernumber) on delete cascade,
     constraint fk_order_pdt_pno foreign key(pno) references product(pno)
);
 alter table pdt_on_order rename column order_number to ordernumber;
drop table pdt_on_order cascade;
select * from cart;
select * from order_table;
select * from pdt_on_order;
delete from order_table;
insert into pdt_on_order values("202005247326", 27, 1);
        
select pno, ordernumber, amount from pdt_on_order natural join product where ordernumber = "202005247326";