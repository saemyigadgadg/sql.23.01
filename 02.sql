-- where
select employee_id, last_name, department_id
from employees
where department_id = 50;
--where에는 boolean 타입의 익스프레션을 사용한다.

--과제 : 176번 사원의 사번, 이름, 부서번호를 조회하라.
select employee_id, last_name, department_id
from employees
where employee_id = 176;

select employee_id, last_name, department_id
from employees
where last_name = 'Whalen'; 
/*스테이트먼트에서는 대소문자를 구분하지 않는다. 
그러나 데이터 'Whalen'의 경우 대소문자를 구분한다*/

select employee_id, last_name, hire_date
from employees
where hire_date = '2008/02/06';

select last_name, salary
from employees
where salary <= 3000;

-- 과제: 월 $12,000 이상 버는 사원들의 이름, 월급을 조회하라.
select last_name, salary
from employees
where salary >= 12000;

select last_name, job_id
from employees
where job_id != 'IT_PROG';

select last_name, salary
from employees
where salary between 2500 and 3500; --2500 이상 3500이하의 값을 찾는다.

select last_name
from employees
where last_name between 'King' and 'Smith'; --K~ S까지의 값을 찾는다.

--과제 : 'king' 사원의 first_name, last_name, 직업, 월급을 조회하라.
select first_name, last_name, job_id, salary 
from employees
where last_name = 'King';

select last_name, hire_date
from employees
where hire_date between '2002/01/01' and '2002/12/31';

select employee_id, last_name, manager_id
from employees
where manager_id in (100, 101, 201);   
/* between은 점선의 데이터 in은 실선의 데이터를 찾는다.
in은 n개의 데이터만 꼽아 가져가고 싶을 때 사용한다.*/

select employee_id, last_name, manager_id
from employees
where manager_id = 100 or 
    manager_id = 101 or
    manager_id = 201;  
/*조건들 중에서 어느 하나만 true가 나오면 찾아낸다.
n과 결과값은 같다.*/
    
select employee_id, last_name
from employees
where last_name in ('Hartstein', 'Vargars');

select last_name, hire_date
from employees
where hire_date in ('2003/06/17', '2005/09/21');

select last_name
from employees
where last_name like 'S%'; 
--like는 char타입만 사용한다. %는 와일드카드를 의미한다. 해당 연산자는 검색기능을 할때 활용할 것이다.

select last_name
from employees
where last_name like 'r';

--과제 : 이름에 s가 포함된 사원들의 이름을 조회하라.
select last_name
from employees
where last_name like '%s%';

--과제 : 2005년에 입사한 사원들의 이름, 입사일을 조회하라.
select last_name, hire_date
from employees
where hire_date like '2005%';
