CREATE DATABASE library;
SHOW DATABASES;
USE library;

DROP TABLE readers;
CREATE TABLE readers (
  reader_id VARCHAR(10) PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  city VARCHAR(30) NOT NULL,
  mobile_no VARCHAR(11) NOT NULL,
  occupation VARCHAR(30) NOT NULL,
  date_of_birth DATE NOT NULL
);

INSERT INTO readers VALUES('A0001','Chanchol','Kumar','Rangpur','017XXXXXXXX','Student','2000-05-21');
INSERT INTO readers VALUES('A0002','Khalid','Jim','Rangpur','017XXXXXXXX','Engineer','1999-06-01');
INSERT INTO readers VALUES('A0003','Pankaj','Bhowmik','Rangpur','017XXXXXXXX','Teacher','1980-01-22');
INSERT INTO readers VALUES('A0004','Omer','Sany','Rangpur','017XXXXXXXX','Student','2000-09-25');
INSERT INTO readers VALUES('A0005','Rahim','Khan','Rangpur','017XXXXXXXX','Student','2000-07-27');
INSERT INTO readers VALUES('A0006','Abdur','Mannan','Rangpur','017XXXXXXXX','Student','2000-05-29');
INSERT INTO readers VALUES('A0007','Rashid','Khan','Rangpur','017XXXXXXXX','Teacher','1992-04-12');
INSERT INTO readers VALUES('A0008','Digonto','Sen','Rangpur','017XXXXXXXX','Student','2000-05-13');
INSERT INTO readers VALUES('A0009','Rohit','Deb','Rangpur','017XXXXXXXX','Student','2001-07-16');
INSERT INTO readers VALUES('A0010','Rifat','Islam','Rangpur','017XXXXXXXX','Student','2001-05-17');
INSERT INTO readers VALUES('A0011','Ali','Uddin','Rangpur','017XXXXXXXX','Student','1997-04-21');
INSERT INTO readers VALUES('A0012','Asish','Kumar','Rangpur','017XXXXXXXX','Doctor','1998-06-25');
INSERT INTO readers VALUES('A0013','Noyaj','Sorif','Rangpur','017XXXXXXXX','Student','2000-03-16');
INSERT INTO readers VALUES('A0014','Pobitro','Kumar','Rangpur','017XXXXXXXX','Student','1999-05-19');
INSERT INTO readers VALUES('A0015','Mamun','Islam','Rangpur','017XXXXXXXX','Engineer','1997-08-21');
INSERT INTO readers VALUES('A0016','Sabrina','Khan','Rangpur','017XXXXXXXX','Doctor','1996-01-11');
INSERT INTO readers VALUES('A0017','Mijan','Islam','Rangpur','017XXXXXXXX','Doctor','1998-06-19');
INSERT INTO readers VALUES('A0018','Nokul','Biswas','Rangpur','017XXXXXXXX','Student','1997-05-27');
INSERT INTO readers VALUES('A0019','Dipto','Pramanik','Rangpur','017XXXXXXXX','Engineer','1985-05-15');
INSERT INTO readers VALUES('A0020','Nobel','Khan','Rangpur','017XXXXXXXX','Student','2000-05-25');

SELECT * FROM readers;

DROP TABLE book;
CREATE TABLE book (
  book_id VARCHAR(10) PRIMARY KEY,
  book_name VARCHAR(30) NOT NULL,
  book_domain VARCHAR(30) NOT NULL
);

INSERT INTO book VALUES('B001','The Alchemist','Novel');
INSERT INTO book VALUES('B002','Never Give Up','Motivitional');
INSERT INTO book VALUES('B003','The Miracle Morning','Self Help');
INSERT INTO book VALUES('B004','Computer Fundamental','Engineering');
INSERT INTO book VALUES('B005','C programming','Engineering');
INSERT INTO book VALUES('B006','Recharge Your Down Battery','Self Help');
INSERT INTO book VALUES('B007','How to Talk Anyone','Self Help');
INSERT INTO book VALUES('B008','Electronics Funamental','Engineering');
INSERT INTO book VALUES('B009','How to Grow Up','Motivitional');
INSERT INTO book VALUES('B010','Robotics','Engineering');
INSERT INTO book VALUES('B011','The Ultimate Goal','Self Help');

SELECT * FROM book;

DROP TABLE active_readers;
CREATE TABLE active_readers (
  account_id VARCHAR(10) PRIMARY KEY,
  reader_id VARCHAR(10) NOT NULL,
  book_id VARCHAR(10) NOT NULL,
  active_type VARCHAR(10) NOT NULL,
  active_status VARCHAR(10) NOT NULL,
  FOREIGN KEY (reader_id) REFERENCES readers(reader_id),
  FOREIGN KEY (book_id) REFERENCES book(book_id)
);

INSERT INTO active_readers VALUES('C0001','A0001','B001','Premium','Active');
INSERT INTO active_readers VALUES('C0002','A0002','B002','Premium','Suspended');
INSERT INTO active_readers VALUES('C0003','A0003','B003','Regular','Active');
INSERT INTO active_readers VALUES('C0004','A0004','B004','Premium','Active');
INSERT INTO active_readers VALUES('C0005','A0005','B005','Premium','Suspended');
INSERT INTO active_readers VALUES('C0006','A0006','B006','Premium','Active');
INSERT INTO active_readers VALUES('C0007','A0007','B007','Regular','Active');
INSERT INTO active_readers VALUES('C0008','A0008','B008','Regular','Suspended');
INSERT INTO active_readers VALUES('C0009','A0009','B009','Premium','Active');
INSERT INTO active_readers VALUES('C0010','A0010','B010','Premium','Active');
INSERT INTO active_readers VALUES('C0012','A0011','B006','Premium','Active');
INSERT INTO active_readers VALUES('C0013','A0012','B006','Premium','Suspended');
INSERT INTO active_readers VALUES('C0014','A0013','B010','Premium','Active');
INSERT INTO active_readers VALUES('C0015','A0014','B011','Premium','Active');
INSERT INTO active_readers VALUES('C0016','A0015','B010','Premium','Suspended');
INSERT INTO active_readers VALUES('C0017','A0016','B011','Premium','Active');
INSERT INTO active_readers VALUES('C0018','A0017','B011','Premium','Active');
INSERT INTO active_readers VALUES('C0019','A0018','B010','Premium','Suspended');
INSERT INTO active_readers VALUES('C0011','A0019','B009','Premium','Suspended');
INSERT INTO active_readers VALUES('C0020','A0020','B011','Premium','Active');

SELECT * FROM acive_readers;

DROP TABLE book_issue_details;
CREATE TABLE book_issue_details (
  issue_number VARCHAR(10) PRIMARY KEY,
  reader_account_id VARCHAR(10) NOT NULL,
  book_id VARCHAR(10) NOT NULL,
  date_issued DATE NOT NULL,
  return_date DATE,
  FOREIGN KEY (reader_account_id) REFERENCES readers(reader_id),  
  FOREIGN KEY (book_id) REFERENCES book(book_id)
);

INSERT INTO book_issue_details VALUES('T001', 'A0001', 'B001', '2024-02-15', '2024-02-22');
INSERT INTO book_issue_details VALUES('T002', 'A0001', 'B002', '2024-02-16', '2024-02-23');
INSERT INTO book_issue_details VALUES('T003', 'A0002', 'B008', '2024-02-17', '2024-02-24');
INSERT INTO book_issue_details VALUES('T004', 'A0003', 'B003', '2024-02-17', '2024-02-24');
INSERT INTO book_issue_details VALUES('T005', 'A0004', 'B004', '2024-02-19', '2024-02-26');
INSERT INTO book_issue_details VALUES('T006', 'A0004', 'B005', '2024-02-21', '2024-02-28');
INSERT INTO book_issue_details VALUES('T007', 'A0004', 'B011', '2024-02-23', '2024-03-02');
INSERT INTO book_issue_details VALUES('T008', 'A0006', 'B002', '2024-02-23', '2024-03-02');
INSERT INTO book_issue_details VALUES('T009', 'A0007', 'B001', '2024-02-23', '2024-03-02');
INSERT INTO book_issue_details VALUES('T0010', 'A0015', 'B011', '2024-02-24', '2024-03-03');
INSERT INTO book_issue_details VALUES('T0011', 'A0016', 'B010', '2024-02-25', '2024-03-04');
INSERT INTO book_issue_details VALUES('T0012', 'A0017', 'B009', '2024-02-25', '2024-03-04');

SELECT * FROM book_issue_details;
