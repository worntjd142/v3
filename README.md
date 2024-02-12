create table orderr (
ono int primary key auto_increment, -- 글번호
uuid varchar(20), -- 수주번호
oday date DEFAULT (current_date) not null, -- 수주일자
cno varchar(20),
ceo varchar(20),
cname varchar(50) not null, -- 거래처명
pcount int,
osuju varchar(10) default "수주 대기" not null, -- 수주상태 (출고요청완료) or (출고요청보류)
omanager varchar(10) not null, -- 수주담당자
otext text, -- 비고
sdate date, -- 출고날짜
sdel varchar(20) default '-',
tcount int, -- 총 수주량
tscount int default 0,  -- 총 출하량 
tamount int default 0 -- 총 요청잔량
);

-- 장바구니 역할
CREATE TABLE cart (
pproduct VARCHAR(40) NOT NULL, -- 제품이름
pprice INT NOT NULL, -- 제품단가
ocount INT NOT NULL, -- 수주수량
osum INT NOT NULL, -- 수주금액
ono int,
amount int default 0, -- 요청잔량
scount int -- 출고수량
);


-- 제품관리
create table product(
pcode varchar(10) not null, -- 제품코드
housed DATE DEFAULT (current_date), -- 입고날짜
pname varchar(40) not null, -- 제품이름
pprice int not null,        -- 제품단가
pmc varchar(40) not null,   -- 제조사
pstock int,                 -- 재고 수
pmi varchar(500) not null,   -- 제품 설명
exd varchar (50) not null,   -- 유통기한
pimage varchar(500) not null, -- 제품 이미지 파일명
houseld varchar(50) default '해당 없음' -- 최종 입고일
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

CREATE TABLE login (
useid VARCHAR(20) PRIMARY KEY, -- 사용자 아이디
usepassword VARCHAR(20) NOT NULL, -- 사용자 비밀번호
usename VARCHAR(20) NOT NULL, -- 사용자 회사이름
usenumber VARCHAR(12) NOT NULL, -- 사용자 사업자번호
usetel VARCHAR(20) NOT NULL -- 사용자 회사 연락처
);

create table shipment(
ono int,
snumber varchar(50), -- 출하번호
sname varchar(50), -- 거래처
sday date,  --  발행일
dday date DEFAULT (current_date + 2),	 -- 납품일자
product varchar(20), -- 제품명
pcode varchar(20), -- 제품코드
tcount int, -- 납품수량
price int, -- 단가
osum int
);
