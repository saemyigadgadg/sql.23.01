drop table dept; -- 테이블 삭제하는 법

create table dept(
department_id number(4),
department_name varchar2(30),
manager_id number(6),
location_id number(4)
);

create table emp (
employee_id number(6),
first_name varchar2(20),
last_name varchar2(25),
email varchar2(25),
phone_number varchar2(20),
hire_date date,
job_id varchar2(10),
salary number(8, 2),
commission_pct number(2, 2),
manager_id number(6),
department_id number(4));
-- DDL(data definition language): 자료 정의 언어

insert into dept(department_id, department_name, manager_id, location_id)
values (100, 'Public Relation', 100, 1700);  -- department_id : Primary key

insert into dept(department_id, department_name)
values (310, 'Purchasing');

select *
from dept;

commit; -- 끝을 내 주어야 한다.

--Read Consistency

insert into emp(employee_id, first_name, last_name,
                email, phone_number, hire_date,
                job_id, salary, commission_pct,
                manager_id, department_id) -- department_id : Foreign key
values(300, 'Louis', 'Pop',
        'Pop@gmail.com', '010-378-1278', sysdate,
        'AC_ACCOUNT', 6900, null,
        205, 110);
        
insert into emp
values(320, 'Terry', 'Benard',    
        'Benerd@gmail.com', '010-637-0972', '2022/07/20',
        'AD_PRES', 5000, .2,
        100, 300); -- 여기 300을 310으로 바꾸어야 한다.
        
commit;

select * from emp;

drop table emp;

create table sa_reps (
rep_id number(6),
rep_name varchar2(25),
salary number(8, 2),
commission_pct number(2, 2)
);

insert all  --n개의 insert를 하기 위해 사용한다.
    into sa_reps values(1, '최한석', 20000, .1)
    into sa_reps values(2, '한아름', 30000, .12)
select * from dual; -- 문법을 위해서 적어준다.

commit;

select * from sa_reps;

declare
    base number(6) := 400;
begin
    for i in 1..10 loop
        insert into sa_reps(rep_id, rep_name, salary, commission_pct)
        values (base + i, 'n' || (base + i), base * i, i * 0.01);
    end loop;
end;
/

-- 작성된 한 조각은 프로시져 라고 부른다. procedure 
--프로시져는 1회용이며 function은 이름이 있기에 재사용이 가능하다.

select *
from sa_reps
where rep_id > 400;

commit;

insert into sa_reps(rep_id, rep_name, salary, commission_pct)
    select employee_id, last_name, salary, commission_pct
    from employees
    where job_id like '%REP%';
    
commit;


update emp
set job_id = 'IT_PROG',
    salary = 30000
where employee_id = 300;

select job_id, salary
from emp
where employee_id = 300;

update emp
set salary = null   --돈을 안받고 일한다.
where employee_id = 300;

select job_id, salary
from emp
where employee_id = 300;

rollback; -- 마지막 커밋한 값을 불러온다.

select job_id, salary
from emp
where employee_id = 300;

update emp
set job_id = (select job_id
                from employees
                where employee_id = 205), 
    salary = (select salary
                from employees
                where employee_id = 205)
where employee_id = 300;

select job_id, salary
from emp
where employee_id = 300;

rollback;

select job_id, salary
from emp
where employee_id = 300;

update emp
set (job_id, salary) = (
    select job_id, salary
    from employees
    where employee_id = 205)
where employee_id = 300;

select job_id, salary
from emp
where employee_id = 300;

commit;

delete dept   -- 삭제
where department_id = 310;

select * from dept;

rollback;

select * from dept;

delete emp
where department_id = (
    select department_id
    from departments
    where department_name = 'Purchasing');  -- 복습할 때에는 1개행이 삭제되었습니다 나올 것이다.
    
select * from emp;

commit;