-- Demo de transaccion
-- =========================================================

SELECT *
FROM EMP

INSERT INTO EMP VALUES(8000,'ANDRES','TEACHER',7839,'1990-01-02',1500,NULL,20)


START TRANSACTION
INSERT INTO EMP VALUES(8001,'ANGEL','TEACHER',8000,'1990-01-15',1000,NULL,20)

ROLLBACK
COMMIT

SELECT *
FROM EMP


DELETE FROM EMP 
WHERE EMPNO IN( 8000, 8001)


-- Demos de bloqueos TX
-- ============================================================

START TRANSACTION

UPDATE EMP SET SAL=2000
WHERE  EMPNO=8000

-- En otra sesion hacer:

UPDATE EMP SET SAL=4000
WHERE  EMPNO=8000

COMMIT

SELECT * FROM EMP

-- Demo integridda referencial


INSERT INTO EMP VALUES(8002, 'PEDRO','TEACHER',8000,'1990-01-26',1500,0,80)


-- JOINS
-- ===================================================

SELECT *
FROM DEPT

SELECT *
FROM EMP

SELECT ename, 
		dname
FROM   DEPT d LEFT JOIN EMP e ON d.deptno = e.deptno 

SELECT ename AS Nombre, 
	   empno,
	   dname AS Departamento,
	   d.deptno
FROM   EMP e  INNER JOIN DEPT d ON e.deptno = d.deptno 
ORDER BY 3

SELECT  a.ename "EMPLEADO",
		a.job "JOB EMPLEADO",
		b.ename "JEFE",
		b.JOB "JOB JEFE"
FROM    EMP a INNER JOIN EMP b ON a.mgr = b.empno
ORDER BY 3


SELECT  a.ename "EMPLEADO",
		a.job "JOB EMPLEADO",
		a.hiredate,
		b.ename "JEFE",
		b.JOB "JOB JEFE",
		b.hiredate
FROM    EMP a INNER JOIN EMP b ON a.mgr = b.empno
ORDER BY 4


SELECT  b.ename "JEFE",
		COUNT(a.ename)
FROM    EMP a INNER JOIN EMP b ON a.mgr = b.empno
GROUP BY b.ename
ORDER BY 2 DESC

SELECT dname,
	   loc,
	   ename
FROM  DEPT d LEFT JOIN EMP e ON d.deptno = e.deptno
ORDER BY 1

SELECT dname,
	   COUNT(ename)
FROM  DEPT d LEFT JOIN EMP e ON d.deptno = e.deptno
GROUP BY dname
ORDER BY 2 DESC 

SELECT dname,
	   loc,
	   ename
FROM  DEPT d LEFT JOIN EMP e ON d.deptno = e.deptno
WHERE sal < 1500
ORDER BY 1


SELECT dname,
	   COUNT(ename)
FROM  DEPT d LEFT JOIN EMP e ON d.deptno = e.deptno
WHERE sal < 1500
GROUP BY dname
HAVING COUNT(ename) > 2
ORDER BY 2 DESC 





















