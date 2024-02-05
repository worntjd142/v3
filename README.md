create database v3;

use v3;


-- 프로그램 사용자 회원가입
CREATE TABLE LOGIN (
USEID VARCHAR(20) PRIMARY KEY, -- 사용자 아이디
USEPASSWORD VARCHAR(20) NOT NULL, -- 사용자 비밀번호
USENAME VARCHAR(20) NOT NULL, -- 사용자 회사이름
USENUMBER VARCHAR(12) NOT NULL, -- 사용자 사업자번호
USETEL VARCHAR(20) NOT NULL -- 사용자 회사 연락처
);

-- 제품관리
create table product(
pcode varchar(10) not null, -- 제품 코드
pname varchar(40) not null, -- 제품 이름
pprice int not null,        -- 제품 단가
pmc varchar(40) not null,   -- 제조사
pstock int,                 -- 재고 수
pmi varchar(500)   -- 제품 설명
);

-- 거래처관리
create table connection(
cname varchar(50) not null, -- 거래처 이름
cno varchar(50) not null, -- 사업자번호
ceo varchar(20) not null, -- 대표자 이름
caddress varchar(100) not null, -- 거래처 주소
cnumber varchar(20) not null, -- 거래처 번호
cemail varchar (100) not null, -- 거래처 이메일
cmi varchar(100), -- 비고
y varchar(100),
x varchar(100) 
);

-- 수주관리
create table orderr (
ono int primary key auto_increment, -- 글번호
uuid binary(18), -- 수주번호
oday date DEFAULT (current_date) not null, -- 수주일자
cname varchar(50) not null, -- 거래처명
pproduct varchar(50) not null, -- 제품이름
pprice int not null, -- 제품단가
ocount int not null, -- 수주수량
osum int not null, -- 수주금액
osuju varchar(10) default "-" not null, -- 수주상태 (출고요청완료) or (출고요청보류)
omanager varchar(10) not null, -- 수주담당자
otext text -- 비고
);

-- 출고관리
create table store(
sdate date not null, -- 출고날짜
uuid binary(18) not null, -- 수주번호
cname varchar(50) not null, -- 거래처명
pname varchar(50) not null, -- 제품명
recount int not null, -- 요청수량
pstock int, -- 재고수량
scount int not null, -- 출고수량
submit varchar(10) default '-' -- 마감상태
)


