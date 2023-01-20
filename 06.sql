--join : 2개이상의 테이블로 하나의 테이블을 만든다.
select department_id, department_name, location_id
from departments;

select location_id, city
from locations;

-- equi join : 조인을 할때 equal 연산자를 쓴다. 로케이션 아이디가 같은 것끼리 조인 시킨다.
select department_id, department_name, location_id, city
from departments natural join locations; -- 로케이션 아이디가 같은 것 끼리 조인을 시킨다.

select department_id, department_name, location_id, city
from departments natural join locations
where department_id in (20, 50);

-- 선택한 공통 칼럼을 코드상에 드러내게 되는 조인을 배워보자.
select employee_id, last_name, department_id, location_id
from employees join departments
using (department_id);
-- department table은 pk이므로 null이 조회되지 않는다.

-- 과제: 위에서 누락된 1인의 이름, 부서번호를 조회하라.
select last_name, department_id
from employees
where department_id is null;

select employee_id, last_name, department_id, location_id
from employees natural join departments; --모든 공통칼럼을 다 써버린다.

select locations.city, departments.department_name -- 로케이션 테이블의 시티, 디파트먼트 테이블의 네임을 불러와서
from locations join departments -- 조인시킨다.
using (location_id)
where location_id = 1400;

-- 별명을 써서 코드를 간략하게 만들 수 있다.
select l.city, d.department_name
from locations l join departments d
using (location_id)
where location_id = 1400;

select l.city, d.department_name   --에러발생
from locations l join departments d
using (location_id)
where d.location_id = 1400;

select l.city, d.department_name, d.location_id   --에러 발생
from locations l join departments d
using (location_id)
where location_id = 1400;     -- using의 접두사에는 별명 붙이지 않는다.

select e.last_name, d.departmenet_name
from employees e join departments d
using (department_id)
where d.manager_id = 100;

select e.employee_id, e.last_name, e.department_id,
    d.department_id, d.location_id
from employees e join departments d
on (e.department_id = d.department_id); --양쪽 테이블에 department_id가 같은 로우끼리 조인 할 것이다.

select employee_id, city, department_name
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;

-- 과제: 위 query를 using으로 refactoring 하라.
select employee_id, city, department_name
from employees e join departments d
using (department_id) -- using을 쓰면 equal 연산자 명시를 안한다.
join locations l
using (location_id);

select e.employee_id, e.last_name, e.department_id,
    d.department_id, d.location_id
from employees e join departments d
on e.department_id = d.department_id
where e.manager_id = 149;

-- 과제: Toronto에 위치한 부서에서 일하는 사원들의
--       이름, 직업, 부서번호, 부서명, 도시를 조회하라
select e.last_name, e.job_id , e.department_id, 
    d.department_name, l.city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where l.city = 'Toronto';

--아래처럼 써도 된다.
select e.last_name, e.job_id , e.department_id, 
    d.department_name, l.city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
and l.city = 'Toronto';   --and

-- non-equi join
select e.last_name, e.salary, e.job_id
from employees e join jobs j
on e.salary between j.min_salary and j.max_salary
and j.job_id = 'IT_PROG'; --프로그래머 만큼 돈 받는 사람들을 찾았다.

-- self join 조인의 대상이 하나의 테이블이다.
select worker.last_name emp, manager.last_name mgr
from employees worker join employees manager
on worker.manager_id = manager.employee_id;

select worker.last_name emp, manager.last_name mgr
from employees worker join employees manager
on manager_id = employee_id;  --접두사를 빼면 오류이다.

select last_name emp, last_name mgr  --접두사를 빼면 오류이다.
from employees worker join employees manager
on worker.manager_id = manager.employee_id;

-- 과제: 같은 부서에서 일하는 사원들의 부서번호, 이름, 동료명을 조회하라.
select e.department_id, e.last_name worker, c.last_name collegue
from employees e join employees c
on e.department_id = c.department_id 
and e.employee_id <> c.employee_id  --<> 이것도 다르다 연산자이다.
order by 1, 2, 3;

-- 과제: Davies 보다 후에 입사한 사원들의 이름, 입사일을 조회하라.
select d.last_name Davies, d.hire_date "Davies hire_date", 
       e.last_name, e.hire_date
from employees d join employees e
on d.last_name = 'Davies' 
and d.hire_date < e.hire_date
order by 4;

--선생님답
select e.last_name, e.hire_date
from employees e join employees d
on d.last_name = 'Davies'
and e.hire_date > d.hire_date
order by 2;

-- 과제: 메니저보다 먼저 입사한 사원들의 이름, 입사일, 매니저명, 매니저 입사일을 조회하라.
select e.last_name employee , e.hire_date emp_hire_date , 
       m.last_name manager , m.hire_date mg_hire_date
from employees e join employees m
on e.manager_id = m.employee_id 
    and e.hire_date < m.hire_date
order by 2,4;

--inner join
select e.last_name, e.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id;

--outer join
select e.last_name, e.department_id, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id;   --조인되지 않는 grant가 포함된다.

select e.last_name, e.department_id, d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id;

select e.last_name, e.department_id, d.department_name
from employees e full outer join departments d
on e.department_id = d.department_id;

-- 과제: 사원들의 이름, 사번, 매니저명, 매니저의 사번을 조회하라.
--       King 회장도 테이블에 포함하라.
select e.last_name, e.employee_id, m.last_name, m.employee_id
from employees e left outer join employees m
on e.manager_id = m.employee_id
order by 2;

--과거의 join 문법을 배워보자.
select d.department_id, d.department_name, d.location_id, l.city
from departments d, locations l
where d.location_id = l.location_id; --equi 조인, inner 조인의 결과물이다.

select d.department_id, d.department_name, d.location_id, l.city
from departments d, locations l
where d.location_id = l.location_id
    and d.department_id in (20, 50);
    
select e.last_name, d.department_name, l.city
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id;

select e.last_name, e.salary, e.job_id
from employees e, jobs j
where e.salary between j.min_salary and j.max_salary
and j.job_id = 'IT_PROG';

select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id;  -- right outer join

select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+);  -- left outer join

select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id(+); --full outer join은 없다.

select worker.last_name || ' works for ' || manager.last_name
from employees worker, employees manager
where worker.manager_id = manager.employee_id; -- self join