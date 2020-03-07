create table product(
	pno bigint(10) unsigned not null primary key auto_increment,
    name varchar(100),
    price bigint(10),
    subtitle varchar(200),
    descript varchar(1000),
    regdate datetime default now(),
    uptodate datetime default now()
);

select * from product;
insert into product(name, price) values('상품이름', 10000);
delete from product where pno = 1;
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

