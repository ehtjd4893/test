DROP TABLE BUYS;
DROP TABLE USERS;

-- ����� ���̺�
-- Į�� : ����ڹ�ȣ, ���̵�, �̸�, �¾�⵵, �ּ�, ����ó1, ����ó2, ������
-- �⺻Ű : ����ڹ�ȣ
CREATE TABLE USERS (
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20) NOT NULL UNIQUE,
    USER_NAME VARCHAR2(20),
    USER_YEAR NUMBER(4),
    USER_ADDR VARCHAR2(100),
    USER_MOBILE1 VARCHAR2(3),  -- 010, 011 ��
    USER_MOBILE2 VARCHAR2(8),  -- 12345678, 11111111 ��
    USER_REGDATE DATE
);


-- ���� ���̺�
-- Į�� : ���Ź�ȣ, ���̵�, ��ǰ��, ��ǰī�װ�, ��ǰ����, ���Ű���
-- �⺻Ű : ���Ź�ȣ
-- �ܷ�Ű : ���̵� (����� ���̺��� ���̵� Į���� �����ϴ� Ű)
CREATE TABLE BUYS (
    BUY_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20) REFERENCES USERS(USER_ID),
    PROD_NAME VARCHAR2(20),
    PROD_CATEGORY VARCHAR2(20),
    PROD_PRICE NUMBER,
    BUY_AMOUNT NUMBER
);


-- USERS ���̺� ���ڵ�(��, ROW) �����ϱ�
INSERT INTO USERS VALUES (1, 'YJS', '���缮', 1972, '����', '010', '11111111', '08/08/08');
INSERT INTO USERS VALUES (2, 'KHD', '��ȣ��', 1970, '���', '011', '22222222', '07/07/07');
INSERT INTO USERS VALUES (3, 'KKJ', '�豹��', 1965, '����', '019', '33333333', '09/09/09');
INSERT INTO USERS VALUES (4, 'KYM', '��븸', 1967, '����', '010', '44444444', '15/05/05');
INSERT INTO USERS VALUES (5, 'KJD', '������', 1974, '�泲', NULL, NULL, '13/03/03');
INSERT INTO USERS VALUES (6, 'NHS', '����', 1971, '�泲', '016', '55555555', '14/04/04');
INSERT INTO USERS VALUES (7, 'SDY', '�ŵ���', 1971, '���', NULL, NULL, '08/10/10');
INSERT INTO USERS VALUES (8, 'LHJ', '������', 1972, '���', '011', '66666666', '06/04/04');
INSERT INTO USERS VALUES (9, 'LKK', '�̰��', 1960, '�泲', '018', '77777777', '04/12/12');
INSERT INTO USERS VALUES (10, 'PSH', '�ڼ�ȫ', 1970, '����', '010', '88888888', '12/05/05');

-- BUYS ���̺� ���ڵ�(��, ROW) �����ϱ�
INSERT INTO BUYS VALUES (1001, 'KHD', '�ȭ', NULL, 30, 2);
INSERT INTO BUYS VALUES (1002, 'KHD', '��Ʈ��', '����', 1000, 1);
INSERT INTO BUYS VALUES (1003, 'KYM', '�����', '����', 200, 1);
INSERT INTO BUYS VALUES (1004, 'PSH', '�����', '����', 200, 5);
INSERT INTO BUYS VALUES (1005, 'KHD', 'û����', '�Ƿ�', 50, 3);
INSERT INTO BUYS VALUES (1006, 'PSH', '�޸�', '����', 80, 10);
INSERT INTO BUYS VALUES (1007, 'KJD', 'å', '����', 15, 5);
INSERT INTO BUYS VALUES (1008, 'LHJ', 'å', '����', 15, 2);
INSERT INTO BUYS VALUES (1009, 'LHJ', 'û����', '�Ƿ�', 50, 1);
INSERT INTO BUYS VALUES (1010, 'PSH', '�ȭ', NULL, 30, 2);

COMMIT;