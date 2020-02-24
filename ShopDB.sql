create table product(
	pno bigint(10) unsigned not null primary key,
    name varchar(100),
    price bigint(10),
    regdate datetime default now(),
    uptodate datetime default now()
);

select * from product;
insert into product(pno, name, price) values(1, '상품이름', 10000);
drop table product;