select *
from departments; /*쿼리의 필수 코드*/

select department_id, location_id
from departments;

select location_id, department_id
from departments;

desc departments /*테이블의 구조를 알고 싶을 때 사용하는 sql+라는 도구의 command이다. 
language가 아니기 때문의 위의 코드와 비교해보면 ;이 없으며 줄여서 써도 된다.*/

select last_name, salary, salary + 300 /*salary + 300 나만의 데이터를 만들어 낼 수 있다*/
from employees;

--과제: 사원들의 월급, 연봉을 조회하라.

select salary, salary * 12
from employees;

select last_name, salary, 12 * salary + 100
from employees;

select last_name, salary, 12 * (salary + 100)
from employees;

--필드 벨류가 null인 경우이다.

select last_name, job_id, commission_pct
from employees;

select last_name, job_id, 12 * salary + (12 * salary * commission_pct)
from employees;

--칼럼 네임을 조절하는 방법이다.
select last_name as name, commission_pct comm  --as는 생략 가능하다.
from employees;

--대소문자 구별방법
select last_name "Name", salary * 12 "Annual Salary"
from employees;

-- 과제: 사원들의 사번, 이름, 직업, 입사일(STARTDATE)을 조회하라.
select employee_id, first_name, job_id, hire_date startdate
from employees;

-- 과제2: 사원들의 사번(Emp #), 이름(Name), 직업(Job), 입사일(Hire Date)을 조회하라.
select employee_id "Emp #", first_name "Name", job_id "Job", hire_date "Hire Date"
from employees;

select last_name || job_id --붙이기 연산자로 칼럼을 하나로 만들 수 있다.
from employees;

-- select 절에는 얼라이언스(""), 칼럼네임, 익스프레션

select last_name || ' is ' || job_id     --job_id 변수명
from employees;

select last_name || ' is ' || job_id employee
from employees;

select last_name || null
from employees;

select last_name || commission_pct
from employees; 
--익스프레션에서는 피 연산자와 데이터타입이 같아야 한다.

select last_name || salary
from employees;

select last_name || hire_date
from employees;  --date가 char로 변환이 된다.

select last_name || (salary * 12)
from employees;

-- 과제: 사원들의 '이름, 직업'(Emp and Title)을 조회하라
select last_name || ',' || job_id "Emp and Title"
from employees;