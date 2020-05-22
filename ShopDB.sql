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
    constraint fk_cart_userid foreign key(userid) references members(userid)
    );
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
    constraint fk_authorities_users foreign key(userid) references members(userid)
);
select * from members;
delete from members where userid = 'test';
create unique index ix_auth_username on authorities (userid, authority);

create table if not exists persistent_logins ( 
  username varchar(100) not null, 
  series varchar(64) primary key, 
  token varchar(64) not null, 
  last_used timestamp not null
);

select * from persistent_logins;

create table pdt_order(
    order_number varchar(50) not null primary key,
    userid varchar(50),
    orderer varchar(100),
    orderer_contact varchar(100),
    receiver varchar(100),
    receiver_address varchar(1000),
    order_date datetime default now(),
	constraint fk_order_userid foreign key(userid) references members(userid)
    );
drop table pdt_order;
delete from pdt_order;
insert into pdt_order(order_number, userid, orderer, orderer_contact, receiver, receiver_address)
values(concat(DATE_FORMAT(now(), "%Y%m%d"), lpad(floor(rand()*10000), 4, '0')), "member1", "TESTER",
"TEST", "TEST", "TEST"); 
select * from pdt_order;

select lpad(floor(rand()*10000), 4, '0');
SELECT concat(DATE_FORMAT(now(), "%Y%m%d"), lpad(floor(rand()*10000), 4, '0'));

create table order_pdt(
	 order_number varchar(50),
     pno bigint(10) unsigned not null,
     amount int unsigned,
     constraint fk_order_pdt_ordernumber foreign key(order_number) references pdt_order(order_number),
     constraint fk_order_pdt_pno foreign key(pno) references product(pno)
);
drop table order_pdt cascade;
select * from order_pdt;
insert into order_pdt values("202005232920", 29, 1);