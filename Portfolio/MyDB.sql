create table inquire(
  ino number(10, 0),
  title varchar2(100),
  writer varchar2(50),
  content varchar2(1000),
  regdate date DEFAULT sysdate,
  updatedate date DEFAULT sysdate
);

alter table inquire ADD CONSTRAINT pk_iq PRIMARY KEY(ino);
create SEQUENCE seq_iq;

select seq_iq.nextval from dual;

insert into inquire(ino, title, writer, content) values(seq_iq.nextval, '테스트 제목', 'user', '테스트 내용');
select * from inquire;

create table feed(
    fno number(10, 0),
    userid varchar2(50) not null,
    message varchar2(1000),
    link varchar2(1000),
    replycnt number default 0,
    regdate date DEFAULT sysdate,
    updatedate date DEFAULT sysdate
);
alter table feed ADD CONSTRAINT pk_feed PRIMARY KEY(fno);

create SEQUENCE seq_feed;
insert into feed(fno, userid, message) values(seq_feed.nextval, 'USER_ID', 'Feed Test');
select * from feed;
update feed set replycnt = (select count(rno) from feed_reply where feed_reply.fno = feed.fno);

create table feed_attach(
    uuid varchar2(100) not null,
    uploadpath varchar2(200) not null,
    filename varchar2(100) not null,
    filetype char(1) default 'I',
    fno number(10, 0)
);

alter table feed_attach add CONSTRAINT pk_attach PRIMARY KEY(uuid);
alter table feed_attach add CONSTRAINT fk_feed_attach FOREIGN KEY(fno) REFERENCES feed(fno);
select * from feed_attach;

create table feed_reply(
    rno number(10, 0),
    fno number(10, 0),
    reply varchar2(1000) not null,
    replyer varchar2(50) not null,
    replydate date default sysdate,
    updatedate date default sysdate
);

create sequence seq_reply;
alter table feed_reply add constraint pk_reply primary key(rno);
alter table feed_reply add CONSTRAINT fk_reply_feed FOREIGN key(fno) REFERENCES feed(fno);
create index idx_reply on feed_reply(fno desc, rno asc);

select * from feed_reply where replydate = (select max(replydate) from feed_reply);
select * from feed_reply;