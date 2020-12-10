--users테이블 생성
create table users(
no number(30),
user_id varchar2(30),
password varchar2(30),
name varchar2(20),
nickname varchar2(30),
country varchar2(30),
emailfirst varchar2(100),
emailsecond varchar2(100),
phone varchar2(30),
gender varchar2(10),
user_image_file varchar2(500),
member_type varchar2(20) default 'normal',
regdate date default sysdate,
primary key(no)
);
insert into users values(users_seq.nextval, 'hong', 'hong', 'hong', 'hooong', 'korea', 'hong', 'naver.com', '111-112', 'male', 'image1' , 'normal', sysdate);
insert into users values(users_seq.nextval, 'conan', 'conan', 'conan', 'conan','usa', 'conan', 'naver.com', '111-113', 'male','image2' ,'normal', sysdate);
insert into users values(users_seq.nextval, 'rose', 'rose', 'rose', 'rose','japan', 'rose', 'naver.com', '111-114', 'male','image3' ,'normal', sysdate);
insert into users values(users_seq.nextval, 'ran', 'ran', 'ran', 'ran','japan', 'ran', 'naver.com', '111-115', 'male','image4' ,'normal', sysdate);

--users_seq 생성
CREATE SEQUENCE users_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOCYCLE
NOCACHE
;

--users 테이블 제약조건 추가
alter table users modify account not null;
alter table users modify password not null;
alter table users modify name not null;
alter table users modify emailFirst not null;
alter table users modify emailSecond not null;
alter table users modify nickname not null;
alter table users modify email not null;
alter table users modify phone not null;
alter table users modify gender not null;
alter table users modify birth not null;
alter table users modify member_type not null;

alter table users add unique(user_id);
alter table users add unique(phone);
alter table users add unique(nickname);
alter table users add unique(email);
alter table users add unique(profile_url);

--albums 테이블 생성
create table albums(
no number(30),
title varchar2(30),
user_id varchar2(30),
genre varchar2(30),
realese_date date default sysdate,
album_image_file varchar2(2000),
likes number(20),
commercial varchar2(10) default 'free',
price number(10) default '0',
introduction varchar2(500),
primary key(no),
foreign key(user_id) references users(user_id)
);

insert into albums values(albums_seq.nextval, '앨범1', 'hong', 'hiphop', sysdate, 'image_file', 5, 'free');
insert into albums values(albums_seq.nextval, '앨범23', 'ran', 'hiphop', sysdate, 'age_file', 6, 'free');
insert into albums values(albums_seq.nextval, '앨범32', 'rose', 'hiphop', sysdate, 'imfile', 7, 'free');
insert into albums values(albums_seq.nextval, '앨범43', 'ran', 'hiphop', sysdate, 'imge_file', 8, 'free');
insert into albums values(albums_seq.nextval, '앨범55', 'conan', 'hiphop', sysdate, 'age_file', 9, 'free');
insert into albums values(albums_seq.nextval, '앨범67', 'conan', 'hiphop', sysdate, 'image_le', 10, 'free');

--albums 시퀀스 생성
CREATE SEQUENCE albums_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOCYCLE
NOCACHE
;
--musics 테이블 생성
create table musics(
no number(30),
title varchar2(30),
album_title varchar2(30),
user_id varchar2(30),
genre varchar2(30),
realese_date date default sysdate,
music_song_file varchar2(2000),
music_image_file varchar2(2000),
likes number(20),
commercial varchar2(10) default 'free',
price number(10) default '0',
introduction varchar2(500),
primary key(no),
foreign key(user_id) references users(user_id)
);

insert into musics values(MUSICS_SEQ.nextval,'음악1','music','hong','pop',sysdate,'Kalimba.mp3','Lighthouse.jpg', 3,'free', 'hi1');
insert into musics values(MUSICS_SEQ.nextval,'음악2','music','conan','pop',sysdate,'Sleep Away.mp3','사막.jpg', 6,'free', 'h2i');
insert into musics values(MUSICS_SEQ.nextval,'음악3','music','ran','pop',sysdate,'Kalimba.mp3','펭귄.jpg', 8,'free', 'hi3');
insert into musics values(MUSICS_SEQ.nextval,'음악4','music','ran','pop',sysdate,'Maid with the Flaxen Hair.mp3','튤립.jpg', 9,'free', 'h4i');
insert into musics values(MUSICS_SEQ.nextval,'음악5','music','rose','pop',sysdate,'Sleep Away.mp3','수국.jpg', 7,'free', 'h5i');
insert into musics values(MUSICS_SEQ.nextval,'음악6','music','conan','pop',sysdate,'Maid with the Flaxen Hair.mp3','튤립.jpg', 4,'free', 'hi6');

--musics_seq 생성
CREATE SEQUENCE musics_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOCYCLE
NOCACHE
;

--musics 테이블 제약조건 추가
ALTER TABLE musics modify title not null;
ALTER TABLE musics modify users_id not null;
ALTER TABLE musics modify genre not null;
ALTER TABLE musics modify realese_date not null;
ALTER TABLE musics modify country not null;
ALTER TABLE musics modify music_file_url not null;
ALTER TABLE musics modify commercial not null;

--product_musics 테이블 생성
create table product_musics(
no number(30),
product_music_no number(30),
primary key(no),
foreign key(product_music_no) REFERENCES musics(no)
);

CREATE SEQUENCE product_musics_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOCYCLE
NOCACHE
;

--product_albums 테이블 생성
CREATE TABLE product_albums(
no number(30),
product_album_no number(30),
primary key(no),
foreign key(product_album_no) REFERENCES albums(no)
);

CREATE SEQUENCE product_albums_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOCYCLE
NOCACHE
;

--playlists 테이블 생성
CREATE TABLE playlists(
no number(30),
user_id varchar2(30),
primary key(no),
foreign key(user_id) REFERENCES users(user_id)
);

--playlists_seq 생성
CREATE SEQUENCE playlists_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOCYCLE
NOCACHE
;

--playlists_musics 테이블 생성
CREATE TABLE playlists_musics(
no number(30),
playlists_no number(30),
musics_no number(30),
primary key(no),
foreign key(playlists_no) REFERENCES playlists(no),
foreign key(musics_no) REFERENCES musics(no)
);

--playlists_musics_seq 생성
CREATE SEQUENCE playlists_musics_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOCYCLE
NOCACHE
;

--Seller 테이블 생성
CREATE TABLE sellers(
no number(20),
user_id varchar2(30),
emailfirst varchar2(50),
emailsecond varchar2(50),
phone varchar2(50),
nickname varchar2(50),
introduction varchar2(2000),
bank varchar2(30),
account_number varchar2(30),
primary key(no),
foreign key(user_id) REFERENCES users(user_id)
);

--Seller_SEQ 생성
CREATE SEQUENCE sellers_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOCYCLE
NOCACHE
;
--delete from sellers;

--Seller 테이블 제약조건 추가
ALTER TABLE sellers ADD unique(user_id);
ALTER TABLE sellers ADD unique(email);
ALTER TABLE sellers ADD unique(phone);
ALTER TABLE sellers ADD unique(nickname);
ALTER TABLE sellers ADD unique(account_number);
ALTER TABLE sellers modify account_number not null;
ALTER TABLE sellers modify bank not null;

--테이블 삭제 명령어
--drop table users cascade constraints;
--drop table musics cascade constraints;
--drop table playlists cascade constraints;
--drop table playlists_musics cascade constraints;
--drop table sellers cascade constraints;
--drop table albums cascade constraints;

--기본 저장 테이블 삭제 명령어
--drop table s_customer cascade constraints;
--drop table s_dept cascade constraints;
--drop table s_emp cascade constraints;
--drop table s_image cascade constraints;
--drop table s_inventory cascade constraints;
--drop table s_item cascade constraints;
--drop table s_longtext cascade constraints;
--drop table s_ord cascade constraints;
--drop table s_product cascade constraints;
--drop table s_region cascade constraints;
--drop table s_title cascade constraints;
--drop table s_warehouse cascade constraints;


