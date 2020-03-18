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
alter table cart add column amount int default 1;
select p.pno, c.userid, c.amount, p.name, p.title, p.price from cart c join product p on c.pno = p.pno; 
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
alter table product_attach modify sequence int(2) unsigned;
update product_attach set sequence = 0 where pno = 13 and filename like '%1%';
delete from product where pno = 14;
SELECT * FROM product AS A left OUTER JOIN product_attach AS B ON A.pno = B.pno where B.sequence = 1 or B.uuid is null;
