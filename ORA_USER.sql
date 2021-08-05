SELECT USER_ID, COUNT(BUY_NO)
  FROM BUYS
 GROUP BY USER_ID;
 
 SELECT U.USER_NAME AS 고객명, B.PROD_NAME AS 구매제품
   FROM USERS U, BUYS B
  WHERE U.USER_ID = B.USER_ID;
  
  SELECT U.USER_NAME AS 고객명, SUM(B.PROD_PRICE * B.BUY_AMOUNT) AS 구매총액
    FROM USERS U, BUYS B
   WHERE U.USER_ID = B.USER_ID
   GROUP BY U.USER_NAME, U.USER_ID;
   
  SELECT U.USER_NAME AS 고객명, NVL(SUM(B.PROD_PRICE * B.BUY_AMOUNT), 0) AS 구매총액
    FROM USERS U LEFT OUTER JOIN BUYS B
      ON U.USER_ID = B.USER_ID
   GROUP BY U.USER_NAME, U.USER_ID;
   
   -- 이 작업을 수행하는 update_procedure를 작성하시오
   -- USER_NO = 5 인 회원과 그 회원으 구매내역을 모두 제거하시오
   -- 사용자 수 : 9

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
    DBMS_OUTPUT.PUT_LINE('사용자 수: ' || result1);
END;

CREATE OR REPLACE FUNCTION fn_total(id VARCHAR2) RETURN NUMBER
AS total NUMBER;
BEGIN
    SELECT SUM(PROD_PRICE * BUY_AMOUNT) INTO total
      FROM BUYS
     WHERE USER_ID = id;
     RETURN total;
END;

-- 'KHD'의 구매금액 합계
SELECT fn_total('KHD') FROM DUAL;   -- 함수 호출을 위한 더미 테이블 DUAL


