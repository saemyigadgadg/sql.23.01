--single function
desc dual
select * from dual; --가짜 테이블

select lower('SQL Course') --소문자로 나온다.
from dual;  

select upper('SQL Course') --대문자로 나온다.
from dual;

select initcap('SQL Course') -- 첫 글자만 대문자로 나온다.
from dual;

select last_name
from employees
where last_name = 'higgins'; -- 조회가 안된다.

select last_name
from employees
where last_name = 'Higgins'; -- 조회가 된다.

select last_name
from employees
where lower(last_name) = 'higgins'; -- 소문자로 바꿔서 찾아준다.
--lower function의 리턴값과 상수 'higgins'를 비교한다.

select concat('Hello', 'World') --필드 2개가 모여서 하나의 로우를 만든다.
from dual;

select substr('HelloWorld', 2, 5) --로우 1개, 필드 3개 'elloW'를 리턴한다.
from dual;

select substr('Hello', -1, 1) -- '-'를 붙이면 뒤에서 부터 리턴한다.
from dual;

select length('Hello')
from dual;

select instr('Hello', 'l') /*hello에 l이라는 숫자가 있느냐고 묻는다. 왼쪽부터 검색하기 때문에 3에서 검색을 끝내고 3인덱스를 리턴한다.*/
from dual; --자바에서 활용할 땐 리턴값이 0보다 큰지를 비교한다.

select instr('Hello', 'w')
from dual;

select lpad(salary, 5, '*') --왼쪽을 비운다.
from employees;

select rpad(salary, 5, '*') --오른쪽을 비운다.
from employees;

select replace('JACK and JUE', 'J', 'BL')    --j라는 글자를 bl로 바꾼다.
from dual;

select trim('H' from 'Hello') -- 머리꼬리 H라는 문자를 뜯어낼 것이다.
from dual;

select trim('l' from 'Hello')
from dual;

select trim(' ' from ' Hello ')
from dual;

select concat ('|', trim(' ' from ' Hello '), '|')
from dual;

select '|' || trim(' ' from ' Hello ') || '|'
from dual;

select trim(' Hello World ')
from dual;

select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where substr(job_id, 4) = 'PROG';

--4번 인덱스에서 마지막 글자 까지.

select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where job_id like '%PROG';

--과제 : 이름이 J나 A나 M으로 시작하는 사원들의 이름, 이름의 글자수를 조회하라
--       이름의 첫 글자는 대문자, 나머지는 소문자로 출력한다.
select initcap(last_name) ,length(last_name)
from employees
where last_name like 'J%' 
        or last_name like 'A%' 
        or last_name like 'M%';
        
select round(45.926, 2)   -- 반올림 작업, 앞에있는 소수를 뒤에 있는 자리수 만큼 조정한다.
from dual;

select trunc(45.926, 2)   -- 내림 작업
from dual;

select round(45.923, 0), round(45.923)
from dual;

select trunc(45.923, 0), trunc(45.923)
from dual;

--과제 : 사원들의 이름, 월급, 15.5% 인상된 월급(New Salary, 정수), 
--       인상액(Increase)을 조회하라.
select last_name, salary, 
       round(salary * (1 + (15.5/100))) "New Salary", 
       round(salary * (1 + (15.5/100))) - salary "Increase"
from employees;

--아래는 선생님 답이다.
select last_name, salary, 
       round(salary * 1.155) "New Salary", 
       round(salary * 1.155) - salary "Increase"
from employees;

select sysdate         --호출되는 시점의 날짜를 리턴한다.
from dual;

select sysdate + 1
from dual;

select sysdate - 1
from dual;


select sysdate - sysdate
from dual;

select last_name, sysdate - hire_date
from employees
where department_id = 90;

select months_between('2023/12/31', '2022/12/31') -- 사이의 개월 수
from dual;

select add_months('2024/01/18', 3)
from dual;

select next_day('2023/01/18', 5)  -- 일(1)월(2)화(3)수(4)목(5)금(6)토(7)
from dual;

select next_day('2023/01/18', 4)
from dual;

select next_day('2023/01/18', 'thursday') -- 문자로 쓸 수 도 있다.
from dual;

select next_day('2023/01/18', 'thu') -- 문자의 약자로 쓸 수 도 있다.
from dual;

select last_day('2023/01/18') -- 말일을 구할 때
from dual;

-- 과제: 20년 이상 재직한 사원들의 이름, 첫 월급일을 조회하라.
        
select last_name, last_day(hire_date)
from employees
where months_between(sysdate, hire_date) >= 12 * 20;

-- 과제: 사원들의 function을 이용하면 된다, 사원들의 이름, 월급 그래프를 조회하라.
--       그래프는 $1000 당 * 하나를 표시한다.
select last_name, rpad(' ', salary/1000 + 1, '*')
from employees
order by salary desc;
