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

create table pdtOrder(
	ono datetime default now(),
    userid varchar(50),
	constraint fk_authorities_users foreign key(userid) references members(userid)
    );
drop table pdtOrder;
insert into pdtOrder(userid) values("aaa"); 
select ono from pdtOrder;

select rand() * 100;
SELECT DATE_FORMAT("2017-06-15", "%Y%m%d");