Table STRUCTURE

brach - brachno, branchname, location
dept - deptno, dname, branchno
emp - empno, ename, job, mgr, 
    hiredate, sal, comm, deptno, branchno

-- Q1  Display all the information of the EMP table?
SELECT 
    empno, ename, job, mgr, 
    hiredate, sal, comm, deptno, branchno
FROM 
    emp

-- Q2  Display unique Jobs from EMP table?
SELECT 
    DISTINCT(job)
FROM 
    emp
ORDER BY 
    job;

-- Q3  List the emps in the asc order of their Salaries?
SELECT 
    empno, ename, job, sal
FROM 
    emp
ORDER BY 
    sal DESC, empno;

-- Q4 List the details of the emps in asc order of the Dptnos and desc of Jobs?
SELECT 
    empno, ename, job, deptno, sal
FROM    
    emp
ORDER BY 
    deptno, job DESC, empno;

--Q5 Display all the unique job groups in the descending order?
SELECT 
    DISTINCT(job)
FROM 
    emp
ORDER BY 
    job DESC;

--Q6 Display all the details of all ‘Mgrs’
SELECT 
    empno, ename, job,sal
FROM 
    emp
WHERE 
    mgr IS NULL;

--Q7 List the emps who joined before 1981
SELECT 
    empno, ename, job, hiredate
FROM   
    emp
WHERE 
    TO_CHAR(HIREDATE,'YY') < 81;

--Q8 List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal
SELECT 
    empno, ename, sal, sal/20 as "Daily Salary"
FROM 
    emp
ORDER BY 
    sal/20, sal, empno;

--Q9 Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
SELECT 
    empno, ename, job, hiredate, 
    trunc(months_between(sysdate,hiredate)/12) as "Years of Experience"
FROM 
    emp   
WHERE 
    job = 'Mgr';

--Q10 List the Empno, Ename, Sal, Exp of all emps working for Mgr 7839
SELECT 
    empno, ename, sal,
    trunc(months_between(sysdate,hiredate)/12) as "Years of Experience"
FROM 
    emp
WHERE 
    mgr ='7839';

--Q11 Display all the details of the emps whose Comm  Is more than their Sal
SELECT 
    empno, ename, job, sal, comm
FROM 
    emp
WHERE 
    comm > sal;

--Q12 List the emps along with their Exp and Daily Sal is more than Rs 100
SELECT empno, ename, job, sal, 
    trunc(months_between(sysdate,hiredate)/12) as "Years of Experience",sal/20 as "Daily Salary"
FROM 
    emp
WHERE 
    sal/20 > 100
ORDER BY
    sal DESC;

--Q-13 List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order
SELECT 
    empno, ename, job, sal, 
FROM 
    emp
WHERE
    job = 'CLERK' OR job = 'ANALYST'
ORDER BY    
    job DESC, empno;

--Q14 List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority
SELECT 
    empno, ename, job, sal,hiredate 
FROM 
    emp 
WHERE
    hiredate IN ('1-MAY-81','3-DEC-81','17-DEC-81','19-JAN-80')
ORDER BY
    hiredate DESC, empno;


--Q15 List the emp who are working for the Deptno 10 or 20
SELECT 
    empno, ename, job, sal, deptno
FROM
    emp
WHERE
    deptno IN (10,20)
ORDER BY
    empno;

-- Q16 List the emps who are joined in the year 81
SELECT 
    empno, ename, job, sal, hiredate
FROM    
    emp
WHERE 
    TO_CHAR(HIREDATE,'YY') = 81;

-- Q17 List the emps Who Annual sal ranging from 22000 and 45000
SELECT
    empno, ename, job, sal,
    sal as "Annual Salary"
FROM
    emp
WHERE
    sal BETWEEN 22000 AND 45000;

-- Q18 List the Enames those are having five characters in their Names
SELECT
    empno, ename, job, sal
FROM
    emp
WHERE
    LENGTH(ename) = 5; 

--Q19 List the Enames those are starting with ‘S’ and with five characters
SELECT
    empno, ename, job, sal
FROM    
    emp
WHERE
    ename LIKE 'S%' AND LENGTH(ename) = 5;

--Q20 List the emps those are having four chars and third character must be ‘r’
SELECT
    empno, ename, job, sal
FROM
    emp
WHERE
    LENGTH(ename) = 4 AND ename like '__r%';


-- Q-21 List the Five character names starting with ‘S’ and ending with ‘H’
SELECT
    empno, ename, job, sal
FROM    
    emp
WHERE
    ename LIKE 'S%H' AND LENGTH(ename) = 5;

--Q- 22 List the emps who joined in January
SELECT
    empno, ename, job, sal, hiredate
FROM    
    emp
WHERE
    TO_CHAR(HIREDATE,'MM') = 01;

--Q23 List the emps whose names having a character set ‘ll’ together
SELECT
    empno, ename, job, sal
FROM
    emp
WHERE
    ename LIKE '%ll%';

--Q24 List the emps who does not belong to Deptno 20
SELECT
    empno, ename, job, sal, deptno  
FROM
    emp
WHERE
    deptno != 20
ORDER BY
    deptno, empno;

--Q25 List all the emps except ‘PRESIDENT’ & ‘MGR�? in asc order of Salaries
SELECT
    empno, ename, job, sal  
FROM
    emp
WHERE
    job NOT IN ('PRESIDENT','MGR')
ORDER BY    
    sal, job, empno;

--Q26 List the emps whose Empno not starting with digit78
SELECT
    empno, ename, job, sal  
FROM
    emp
WHERE
    empno NOT LIKE '78%'
ORDER BY
    empno;

--Q27 List the emps who are working under ‘MGR’
SELECT
    empno, ename, job, sal, mgr
FROM
    emp
WHERE
    job = 'MGR' AND mgr IS NOT NULL
ORDER BY
    empno;

--Q28 List the emps who joined in any year but not belongs to the month of March
SELECT
    empno, ename, job, sal, hiredate
FROM
    emp
WHERE
    hiredate NOT LIKE '%MAR%'  
ORDER BY    
    empno;

--Q29 List all the Clerks of Deptno 20
SELECT
    empno, ename, job, sal, deptno  
FROM
    emp
WHERE
    job = 'CLERK' AND deptno = 20
ORDER BY    
    empno;

--Q30 List the emps of Deptno 30 or 10 joined in the year 1981
SELECT
    empno, ename, job, sal, hiredate
FROM
    emp
WHERE
    deptno IN (30,10) AND TO_CHAR(hiredate,'YY') = '81'
ORDER BY    
    deptno,hiredate,empno;

--Q31 Display the details of SMITH
SELECT
    empno, ename, job, sal, mgr 
FROM
    emp
WHERE
    ename = 'SMITH';    

--Q32 Display the location of SMITH
SELECT
    location
FROM
    branch
WHERE 
    branchno IN (SELECT 
                    branchno 
                FROM 
                    emp 
                WHERE 
                    ename = 'SMITH');
