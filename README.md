create database v3;

use v3;

-- 사용자 등록 (회원가입)
create table usejoin ( 
useid varchar(20) primary key, -- 아이디
usepassword varchar(30) not null, -- 패스워드
usename varchar(10) not null, -- 이름
usenum varchar(30) not null, -- 나이
usetel varchar(30) not null -- 전화번호
);

-- 발주 등록 테이블
create table balju (
bno binary(18) primary key, -- 주문 번호
bnumber varchar(50) not null, -- 사업자 번호
bname varchar(50) not null, -- 거래처 이름
baljuday DATE DEFAULT (current_date), -- 발주일
bproduct varchar(50) not null, -- 제품 이름
bcount int not null, -- 제품 갯수
bsum int -- 합 계
);
select * from balju;

-- 수주 테이블
create table suju (
bno binary(18), -- 주문번호 //
bnumber varchar(50) not null, -- 사업자 번호 //
bname varchar(50) not null, -- 거래처 이름 //
baljuday DATE not null, -- 발주일 //
bproduct varchar(50) not null, -- 제품 이름//
bcount int not null, -- 제품 갯수//
pprice int not null, -- 단 가//
bsum int, -- 합 계 //
sujuday  DATE DEFAULT (current_date), -- 수주일
spayment varchar(10) default "미결제" not null, -- 결제 상태 (미결제 or 결제)
sdelivery varchar(10)  default "-" null -- 배송 상태 (- or 배송 중 or 배송 준비) 
);
drop table suju;
select * from suju;

-- 제품 관리 DB
create table product(
pcode varchar(10) not null, -- 제품 코드
pname varchar(40) not null, -- 제품 이름
pprice int not null,        -- 제품 단가
pmc varchar(40) not null,   -- 제조사
pstock int,                 -- 재고 수
pmi varchar(500)   -- 제품 설명
);

-- 거래처
create table company(
cname varchar(50) not null, -- 거래처 이름
cnumber varchar(50) not null, -- 사업자번호
caddress varchar(100)not null, -- 주 소
ctel varchar(15)not null, -- 전화번호
cfax varchar(15) -- 팩스
 );

-- 거래처 등록
insert into company(cname, cnumber, caddress, ctel) value('속편한내과','120-86-10499','울산광역시 삼산로 281','052-256-6336');
insert into company(cname, cnumber, caddress, ctel, cfax) value('마마파파&베이비','520-16-52491','울산광역시 남구 삼산로 247 마마파파앤베이비 빌딩','052-258-6006','052-258-6026');
insert into company(cname, cnumber, caddress, ctel) value('프라우메디병원','235-11-670219','울산광역시 삼산중로 94','052-226-7114');
insert into company(cname, cnumber, caddress, ctel) value('마더스병원','510-21-23541','울산광역시 화합로 107','052-270-7000');
insert into company(cname, cnumber, caddress, ctel) value('울산엘리야병원','111-23-34562','울산광역시 호계로 285','052-290-2100');
insert into company(cname, cnumber, caddress, ctel) value('울산대학교병원','123-24-13451','울산광역시  방어진순환도로 877','052-250-7000');
insert into company(cname, cnumber, caddress, ctel) value('대한의원','433-21-12347','울산광역시 월봉6길','052-232-7582');
insert into company(cname, cnumber, caddress, ctel) value('시티병원','122-23-45607','울산광역시 연암동 1261-6','052-280-9000');
insert into company(cname, cnumber, caddress, ctel) value('동강병원','886-22-12345','울산광역시 태화로 239','052-241-1114');
insert into company(cname, cnumber, caddress, ctel) value('보람병원','610-82-05735','울산광역시 돋질로336번길 10','052-278-0114');
insert into company(cname, cnumber, caddress, ctel) value('황만근내과','987-28-11234','울산광역시 울주군 범서읍 천상리 317-2','052-248-7760');
insert into company(cname, cnumber, caddress, ctel) value('엔젤리내과','555-11-19997','경상남도 양산시 물금읍 범어로 62','055-388-1475');

select a.bno, a.baljuday, a.bnumber, a.bname, a.bproduct, a.bcount, a.bsum, b.sdelivery, b.spayment from balju a left join suju b on a.bno = b.bno;

