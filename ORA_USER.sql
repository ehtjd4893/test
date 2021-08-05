SELECT USER_ID, COUNT(BUY_NO)
  FROM BUYS
 GROUP BY USER_ID;
 
 SELECT U.USER_NAME AS ����, B.PROD_NAME AS ������ǰ
   FROM USERS U, BUYS B
  WHERE U.USER_ID = B.USER_ID;
  
  SELECT U.USER_NAME AS ����, SUM(B.PROD_PRICE * B.BUY_AMOUNT) AS �����Ѿ�
    FROM USERS U, BUYS B
   WHERE U.USER_ID = B.USER_ID
   GROUP BY U.USER_NAME, U.USER_ID;
   
  SELECT U.USER_NAME AS ����, NVL(SUM(B.PROD_PRICE * B.BUY_AMOUNT), 0) AS �����Ѿ�
    FROM USERS U LEFT OUTER JOIN BUYS B
      ON U.USER_ID = B.USER_ID
   GROUP BY U.USER_NAME, U.USER_ID;
   
   -- �� �۾��� �����ϴ� update_procedure�� �ۼ��Ͻÿ�
   -- USER_NO = 5 �� ȸ���� �� ȸ���� ���ų����� ��� �����Ͻÿ�
   -- ����� �� : 9

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE update_procedure(result1 OUT NUMBER) 
AS
BEGIN
    DELETE 
      FROM BUYS
     WHERE USER_ID = ( SELECT USER_ID           
                         FROM USERS
                        WHERE USER_NO = 5 );
    DELETE 
      FROM USERS
     WHERE USER_NO = 5;

    COMMIT;
    
    SELECT COUNT(*) INTO result1 FROM USERS;
END;


DECLARE
    result1 NUMBER;
BEGIN
    update_procedure(result1);
    DBMS_OUTPUT.PUT_LINE('����� ��: ' || result1);
END;

CREATE OR REPLACE FUNCTION fn_total(id VARCHAR2) RETURN NUMBER
AS total NUMBER;
BEGIN
    SELECT SUM(PROD_PRICE * BUY_AMOUNT) INTO total
      FROM BUYS
     WHERE USER_ID = id;
     RETURN total;
END;

-- 'KHD'�� ���űݾ� �հ�
SELECT fn_total('KHD') FROM DUAL;   -- �Լ� ȣ���� ���� ���� ���̺� DUAL


