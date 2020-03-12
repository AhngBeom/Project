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
	userid varchar(100),
    pno bigint(10) unsigned 
    );
alter table cart add CONSTRAINT fk_cart FOREIGN KEY(pno) REFERENCES product(pno);
select * from cart; 
drop table cart;
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