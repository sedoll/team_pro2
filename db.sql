CREATE DATABASE shop;

USE shop;

DROP TABLE custom;

-- 손님 테이블
CREATE TABLE custom (
    id varchar(20) PRIMARY KEY,
    pw varchar(300) NOT NULL,
    name varchar(100) NOT NULL,
    point integer DEFAULT 0,
    grade varchar(4) DEFAULT 'F',
    tel VARCHAR(20) NOT NULL,
    email varchar(100) NOT NULL,
    birth date NOT NULL,
    regdate timestamp DEFAULT CURRENT_TIMESTAMP,
    address varchar(200) NOT NULL
);

INSERT INTO custom(id, pw, NAME, tel, email, birth, address) 
VALUES('admin', 'PoFwcUNmztMSrVIZNnSjPgluwbPVYHUiSzicdxofwckMOUmrtQZNWNOIv1kyht5PvqAAUg==', '관리자', '01011112222', 'admin@shop.com', '1995-07-31', '서울시 구로구 01111');
	
INSERT INTO custom(id, pw, NAME, tel, email, birth, address) 
VALUES('hong', 'PoFwcUNmztMSrVIZNnSjPgluwbPVYHUiSzicdxofwckMOUmrtQZNWNOIv1kyht5PvqAAUg==', '홍길동', '01011222233', 'hong@shop.com', '2000-06-23', '서울시 금천구 01123');

INSERT INTO custom(id, pw, NAME, tel, email, birth, address) 
VALUES('kim', 'PoFwcUNmztMSrVIZNnSjPgluwbPVYHUiSzicdxofwckMOUmrtQZNWNOIv1kyht5PvqAAUg==', '김철수', '01011332222', 'kim@shop.com', '2001-03-25', '서울시 양천구 02111');

-- 123456a* 암호화  PoFwcUNmztMSrVIZNnSjPgluwbPVYHUiSzicdxofwckMOUmrtQZNWNOIv1kyht5PvqAAUg==
UPDATE custom SET pw='PoFwcUNmztMSrVIZNnSjPgluwbPVYHUiSzicdxofwckMOUmrtQZNWNOIv1kyht5PvqAAUg==';

UPDATE custom SET address='경기 성남시 분당구 대왕판교로 477<br>102호<br>13480'

-- 공지사항 테이블
CREATE TABLE notice (
    no INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    title varchar(200) NOT NULL,
    content varchar(1000) NOT null,
    resdate timestamp DEFAULT CURRENT_TIMESTAMP(),
    visited int DEFAULT 0
);



-- 파일 업로드 관련 테이블

-- 하나의 파일 업로드 테이블
CREATE TABLE FILE(
	uname VARCHAR(200),
	SUBJECT VARCHAR(300),
	content VARCHAR(1000),
	fname VARCHAR(500)
);

-- 다중 파일 업로드 테이블
CREATE TABLE FILE2(
	uname VARCHAR(200),
	SUBJECT VARCHAR(300),
	content VARCHAR(1000),
	fname1 VARCHAR(500),
	fname2 VARCHAR(500),
	fname3 VARCHAR(500)
);

DROP TABLE product;

-- 상품
CREATE TABLE product(
	no INT AUTO_INCREMENT PRIMARY key,
	cate VARCHAR(50) NOT null,
	cateno VARCHAR(20) NOT null,
	pname VARCHAR(100) NOT null,
	pcomment VARCHAR(2000) NOT null,
	plist VARCHAR(2000),
	price INT DEFAULT 1000,
	imgsrc1 VARCHAR(300),
	imgsrc2 VARCHAR(300),
	imgsrc3 VARCHAR(300),
	resdate timestamp DEFAULT CURRENT_TIMESTAMP()
);

INSERT INTO product VALUES(DEFAULT, '국어', '', '고등국어1', '설명', '목차',
	100, 20000, 'main_bottom_1.png', NULL, NULL, DEFAULT);
	
INSERT INTO product VALUES(DEFAULT, '수학', '', '고등수학1', '수학 설명', ' 수학 목차',
	50, 25000, 'test2.jpg', 'test2.mp4', NULL, DEFAULT);
	
-- 후기 테이블
DROP TABLE review;

CREATE TABLE review(
	NO INT AUTO_INCREMENT PRIMARY KEY,
	cid VARCHAR(20) NOT NULL,
	content VARCHAR(300) NOT NULL,
	resdate timestamp DEFAULT CURRENT_TIMESTAMP(),
	par INT,
	FOREIGN KEY(cid) REFERENCES custom(id) ON DELETE
		CASCADE
);

-- qna
CREATE TABLE qna(
	qno INT PRIMARY KEY AUTO_INCREMENT, -- qna 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(1000), -- 내용
	cid VARCHAR(20), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	lev INT DEFAULT 0, -- 게시글 0, 답글 1 이상
	par INT, -- 부모 게시글 번호
	FOREIGN KEY(cid) REFERENCES custom(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

-- 상품 부가정보 테이블 생성
create table addinfo(ano serial primary key,
pno integer not null, title varchar(200) not null,
movie varchar(256) default 'sample1.mp4',
resdate timestamp default current_timestamp,
FOREIGN KEY(pno) REFERENCES product(no) ON DELETE
		CASCADE);

-- 입고 테이블 생성
create table receive(rno serial primary key,
pno integer not null, amount integer default 1,
rprice integer default 1000,
resdate timestamp default current_timestamp,
FOREIGN KEY(pno) REFERENCES product(no) ON DELETE
		CASCADE);

-- 출고 테이블 생성
create table serve(sno serial primary key,
pno integer not null, amount integer default 1,
sprice integer default 1000,
resdate timestamp default current_timestamp,
FOREIGN KEY(pno) REFERENCES product(no) ON DELETE
	CASCADE);


-- 배송 테이블 생성
create table delivery(
dno serial primary key,
sno integer not null, 
cid varchar(20) not null,
daddr varchar(300) not null, 
custel varchar(13) not null,
pcom varchar(100),
ptel varchar(13),
pstate integer default 0,	
sdate timestamp default current_timestamp,
rdate varchar(13),
bcode varchar(30),
FOREIGN KEY(cid) REFERENCES custom(id) ON DELETE 
		CASCADE
);

-- 결제 테이블 생성
create table payment(
sno serial primary key,
cid varchar(20) not null,
pno integer not null,
amount integer default 1,
pmethod varchar(100),
pcom varchar(100),
cnum varchar(100),
payprice integer default 1000,
dno varchar(100),
FOREIGN KEY(cid) REFERENCES custom(id) ON DELETE 
	CASCADE
);

-- 카테고리 테이블
create table category(
	cno varchar(4) primary key,
	cname varchar(100) not null
);

SELECT p.*, c.cname FROM product p JOIN category c ON p.cate = c.cno where cate='B' ORDER BY NO;

UPDATE product SET cate='A' WHERE cate='초등';
UPDATE product SET cate='E' WHERE cate='중등';

-- 카트 테이블 생성
create table cart(
	cartno serial primary key,
	cid varchar(20) not null,
	pno integer not null,
	amount integer not null,
	FOREIGN KEY(cid) REFERENCES custom(id) ON DELETE 
		CASCADE
);

-- 재고 처리 뷰 생성
DROP VIEW inventory;

CREATE VIEW inventory AS
SELECT r.pno AS pno, (r.total_receive - COALESCE(s.total_serve, 0)) AS amount
FROM (
    SELECT pno, SUM(amount) AS total_receive
    FROM receive
    GROUP BY pno
) r
LEFT JOIN (
    SELECT pno, SUM(amount) AS total_serve
    FROM serve
    GROUP BY pno
) s ON r.pno = s.pno;


-- 판매량 뷰
DROP VIEW sales;

CREATE VIEW sales AS
SELECT
    s.pno,
    p.pname,
    SUM(s.amount) AS total_amount,
    SUM(s.amount * s.sprice) AS total_cost
FROM serve s
JOIN product p ON s.pno = p.no
GROUP BY s.pno, p.pname;

-- cateno 업데이트
UPDATE product SET cateno = CONCAT(cate, NO) WHERE NO=?;

-- 입고처리
INSERT INTO receive VALUES(DEFAULT, ?, ?, ?, DEFAULT);

-- 출고처리 패턴
-- 구매 처리
INSERT INTO payment VALUES(DEFAULT, ?, ?, ?, ?, ?, ?, ?, ''); -- 결제
-- 출고 처리
INSERT INTO serve VALUES(DEFAULT, ?, ?, ?, DEFAULT); -- 내역 갱신
-- 배송처리
INSERT INTO delivery VALUES(DEFAULT, ?, ?, ?, ?, '', '', DEFAULT, DEFAULT, '', ); 
-- 장바구니 삭제
DELETE FROM cart WHERE NO=?;

-- 반품처리 패턴
DELETE FROM payment WHERE sno=?; -- 구매처리 삭제
-- 상품 다시 추가
INSERT INTO receive VALUES(DEFAULT, ?, ?, ?, DEFAULT);
-- 
DELETE FROM serve WHERE sno=?; -- 출고처리 삭제
INSERT INTO cart VALUES(DEFAULT, ?, ?, ?);
-- 배송내역삭제
DELETE FROM delivery WHERE sno=?;


-- 상품정보 변경
-- UPDATE product SET pname=?, cate=?, pcomment=?, plist=?, price=?, imgsrc=? WHERE ''

-- 상품목록
SELECT * FROM product ORDER BY NO;

-- 신상품목록
SELECT * FROM product ORDER BY NO DESC LIMIT 5;

-- 베스트셀러 목록
SELECT * from product where pno IN (SELECT pno FROM payment GROUP BY pno ORDER BY SUM(amount) DESC LIMIT 5); -- 구매 개수를 통해 베스트셀러 선출

-- 카테고리별 베스트 셀러 상품 목록
SELECT * from product where pno IN (SELECT pno FROM payment GROUP BY pno ORDER BY SUM(amount) DESC LIMIT 5); -- 구매 개수를 통해 베스트셀러 선출



-- 배송처리
-- 출발
UPDATE delivery SET pcom=?, ptel=?, pstate=1, 
sdate=CURRENT_TIMESTAMP, rdate=?, bcode=? WHERE dno=?;

-- 도착
UPDATE delivery SET pcom=?, ptel=?, pstate=2, 
sdate=CURRENT_TIMESTAMP, rdate=?, bcode=? WHERE dno=?;