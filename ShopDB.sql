create table product(
	pno bigint(10) unsigned not null auto_increment primary key,
    name varchar(100),
    price bigint(10),
    category varchar(50),
    title varchar(200),
    descript varchar(1000),
    regdate datetime default now(),
    uptodate datetime default now()
);

create index idx_pdt on product(pno, uptodate, regdate);
ALTER TABLE product AUTO_INCREMENT=1;
select last_insert_id();

insert into product(name, price) values('상품이름', 10000);
delete from product;

select  (@ROWNUM:=@ROWNUM+1) rownum, product.* 
from product use index(idx_pdt), (select @ROWNUM:=0) rownum 
order by pno desc limit 0, 8;

SELECT (@ROWNUM:=@ROWNUM+1) rownum, name, price
FROM product AS pdt left OUTER JOIN product_attach AS atch ON pdt.pno = atch.pno, (select @ROWNUM:=0) rownum
where (atch.sequence = 0
		or atch.uuid is null) and (category like concat('%', "%", '%'))
		order by price desc limit 0, 12;


SELECT AUTO_INCREMENT
FROM information_schema.tables
WHERE table_name = 'product';

select pno, name, format(price, 0) as price, category, descript, regdate, uptodate from product;
SELECT (@ROWNUM:=@ROWNUM+1) rownum, pdt.* 
		FROM product AS pdt, (select @ROWNUM:=0) rownum;
select * from product;


create table cart(
	userid varchar(100),
    pno bigint(10) unsigned 
    );
alter table cart add CONSTRAINT fk_cart FOREIGN KEY(pno) REFERENCES product(pno);
alter table cart add column amount int default 1;
select p.pno, c.userid, c.amount, p.name, p.title, p.price from cart c join product p on c.pno = p.pno; 
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
alter table product_attach modify sequence int(2) unsigned;
update product_attach set sequence = 0 where pno = 13 and filename like '%1%';
delete from product where pno = 14;

SELECT * 
FROM product AS pdt left OUTER JOIN product_attach AS atch ON pdt.pno = atch.pno 
where pdt.category = "c2" and (atch.sequence = 0 or atch.uuid is null);
select * from product;
update product set category = 'Category 3' where category like 'c3';

SELECT * FROM product AS A left
		OUTER JOIN product_attach AS B ON A.pno = B.pno where B.sequence = 0
		or B.uuid is null
		order by uptodate desc;
        
select filename, uploadpath from product_attach where uploadpath = subdate(curdate(), 1);    
select filename, uploadpath from product_attach;
select subdate(curdate(), 1) from dual;

create table diary(
	dno bigint(10) unsigned not null auto_increment primary key,
    title varchar(100),
    content varchar(1000),
    regdate datetime default now(),
    uptodate datetime default now()
);
insert into diary(title, content) values("다이어리 테스트 제목", "다이어리 테스트 내용");
select * from diary;

