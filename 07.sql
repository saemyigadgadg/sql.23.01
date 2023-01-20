-- subquery
select last_name, salary
from employees               --main query
where salary > (select salary
                from employees
                where last_name = 'Abel');  --아벨보다 월급이 높은 아이들을 리턴한다.
                
select last_name, job_id, salary
from employees
where job_id = (select job_id
                from employees
                where last_name = 'Ernst')
and salary > (select salary
                from employees
                where last_name = 'Ernst');
--Ernst와 직업은 같지만 월급은 더 많다.

-- 과제: Kochhar 에게 보고하는 사원들의 월급을 조회하라.
select last_name, salary
from employees
where manager_id = (select employee_id
                    from employees
                    where last_name = 'Kochhar');
                    
--과제: IT부서에서 일하는 사원들의 부서번호, 이름, 직업을 조회하라.
select department_id, last_name, job_id
from employees
where dipartment_id = (select department_id
                            from departments
                            where department_name = 'IT');
                            
--과제: Abel과 같은 부서에서 일하는 동료들의 이름, 입사일을 조회하라.
--      이름 순으로 오름차순 정렬한다.
select last_name, hire_date
from employees
where department_id = (select department_id
                        from employees
                        where last_name = 'Abel')
and last_name <> 'Abel'
order by 1;            

select last_name, salary
from employees
where salary > (select salary
                from employees
                where last_name = 'King'); -- 서브쿼리에 리턴값이 2개이기 때문에 오류가 난다.
                --동명이인이 있다.
                
select last_name, job_id, salary
from employees
where salary = (select min(salary)
                from employees);
                
select department_id, min(salary)
from employees
group by department_id
having min(salary) > (select min(salary)
                        from employees
                        where department_id = 50);
                        
-- 과제: 회사 평균 월급 이상 버는 사원들의 사번, 이름, 월급을 조회하라.
--       월급 내림차순 정렬한다.
select employee_id, last_name, salary
from employees
where salary >= (select avg(salary)
                from employees)
order by 3 desc;

select employee_id, last_name
from employees
where salary = (select min(salary)
                from employees
                group by department_id);
                
                
select employee_id, last_name
from employees
where salary in (select min(salary)
                from employees
                group by department_id);
                
-- 과제: 이름에 u가 포함된 사원이 있는 부서에서 일하는 사원들의 사번, 이름을 조회하라.
select employee_id, last_name
from employees
where department_id in (select department_id
                        from employees
                        where last_name like '%u%')
order by 1;

--과제: 1700번 지역에 위치한 부서에서 일하는 사원들의 이름, 직업, 부서번호를 조회하라.
select last_name, job_id, department_id
from employees
where department_id in (select department_id
                        from departments
                        where location_id = 1700)
order by 3;

select employee_id, last_name
from employees
where salary =any (select min(salary)
                    from departments
                    where location_id = 1700);
-- =any = in 하고 뜻이 같다. any는 다른 연산자하고 결합해서 쓸 수 있다.
-- any는 ~~이거나

select employee_id, last_name, job_id, salary
from employees
where salary <any (select salary
                    from employees
                    where job_id = 'IT_PROG')
and job_id <> 'IT_PROG';

select employee_id, last_name, job_id, salary
from employees
where salary <any (select salary
                    from employees
                    where job_id = 'IT_PROG')  --9000미만
and job_id <> 'IT_PROG';

select employee_id, last_name, job_id, salary
from employees
where salary <all (select salary
                    from employees
                    where job_id = 'IT_PROG') --4200 미만
and job_id <> 'IT_PROG';
--all 모든것을 의미한다. ~이고 ~이고

--과제: 60번 부서의 일부 사원보다 월급이 많은 사원들의 이름을 조회하라.
select last_name
from employees
where salary >any (select salary
                    from employees
                    where department_id = 60)
and department_id <> 60;

                    
--과제: 회사 평균 월급보다, 그리고 모든 프로그래머보다 월급을 더 받는
--      사원들의 이름, 직업, 월급을 조회하라.
select last_name, job_id, salary
from employees
where salary > (select avg(salary)
                    from employees)
and salary >all (select salary
                from employees
                where job_id = 'IT_PROG');
                
select last_name
from employees
where salary = (select salary
                from employees
                where employee_id = 1);
                
select last_name
from employees
where salary in (select salary
                    from employees
                    where job_id = 'IT');
                    
select last_name
from employees
where employee_id in (select manager_id
                    from employees);
                    
select last_name
from employees
where employee_id not in (select manager_id
                    from employees);
                    
-- 과제: 위 문장을 all 연산자로 refactoring 하라.                      
select last_name
from employees
where employee_id <>all (select manager_id
                    from employees);
                    
select count(*)
from departments;

select count(*)
from departments d
where exists (select *    -- 존재한다
                from employees e
                where e.department_id = d.departmemt_id);
                
-- 과제: 직업을 바꾼 적이 있는 사원들의 사번, 이름, 직업을 조회하라.
select employee_id, last_name, job_id
from employees e
where exists (select *
                from job_history j
                where j.employee_id = e.employee_id);                