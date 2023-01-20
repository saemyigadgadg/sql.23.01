--set(중복된 값이 들어가지 않는다) set에는 키가 없고 list는 키가 있다.
--우리가 쓰는 테이블은 set이다. tk 필드값은 유일하다.
--합집합

select employee_id, job_id
from employees
union    -- 테이블의 구조가 같아야 한다. 1.칼럼의 개수가 같다. 2. 칼럼의 데이터타입이 같아야 한다.
select employee_id, job_id
from job_history;     -- 두개의 set이 합쳐져서 하나의 set이 되었다.

select employee_id, job_id
from employees
union all     -- 중복을 제거하지 않았다.
select employee_id, job_id
from job_history
order by employee_id;

-- 과제: 과거 직업을 현재 갖고 있는 사원들의 사번, 이름, 직업을 조회하라.
--나의 답
select employee_id, last_name, job_id
from employees
where employee_id =any (select employee_id
                from job_history)
    and job_id =any (select job_id
                    from job_history); --나의 답
                    
select employee_id, last_name, job_id
from employees e
where exists (select *
                from job_history j
                where e.employee_id = j.employee_id
                and e.job_id = j.job_id);
                
select employee_id, last_name, job_id
from employees e
where e.job_id in (select job_id
                    from job_history j
                    where e.employee_id = j.employee_id);
                    
select e.employee_id, e.last_name, e.job_id
from employees e, job_history j
where e.employee_id = j.employee_id
and e.job_id = j.job_id;