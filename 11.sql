create view empvu80 as
    select employee_id, last_name, department_id
    from employees
    where department_id = 80;

desc empvu80

select * from empvu80;
-- 뷰에 데이터가 저장되어있지 않다. 창문안에 산이 있다고 표현하는 것과 같다.

select * from (
    select employee_id, last_name, department_id
    from employees
    where department_id = 80);
    
create or replace view empvu80 as
    select employee_id, job_id
    from employees
    where department_id = 80;
    
desc empvu80

-- 과제: 50번 부서원들의 사번, 이름, 부서번호로 구성된 DEPT50 view를 만들어라.
--       view 구조는 EMPNO, EMPLOYEE, DEPTNO이다.
create view deptvu50 as
    select employee_id EMPNO, last_name EMPLOYEE, department_id DEPTNO
    from employees
    where department_id = 50;

desc deptvu50

create or replace view dept50 as
    select employee_id EMPNO, last_name EMPLOYEE, department_id DEPTNO
    from employees
    where department_id = 50;

desc dept50
    
create or replace view dept50(empno, employee, deptno) as
select employee_id, last_name, department_id
from employees
where department_id = 50;

select * from dept50;

create or replace view dept50(empno, employee, deptno) as
    select employee_id, last_name, department_id
    from employees
    where department_id = 50
    with check option constraint dept50_ck;
    
create table teams as
    select department_id team_id, department_name team_name
    from hr.departments;
    
create view team50 as
    select *
    from teams
    where team_id = 50;
    
select * from team50;

-- view를 통해 insert한다.
select count(*) from teams;
insert into team50
values(300, 'Marketing');

select count(*) from teams; -- 27 -> 28

create or replace view team50 as
    select *
    from teams
    where team_id = 50
    with check option;
    
insert into team50 values(50, 'IT Support');
select count(*) from teams;
insert into team50 values(301, 'IT Support');
-- with check option에서 검사한다.
--73번째 줄에 where절에 체크가 이루어진다. 50번부서로 한정했기 때문에 301은 실패로 나온다.

create or replace view empvu10(employee_num, employee_name, job_title) as
    select employee_id, last_name, job_id
    from employees
    where department_id = 10
    with read only; --insert update는 거절하고 select는 허용한다.
    
insert into empvu10 values(501, 'abel', 'Sales'); -- insert 거절
select * from empvu10;
----------시퀀스 만들기 중요!-----------------
drop sequence team_teamid_seq;

create sequence team_teamid_seq;

select team_teamid_seq.nextval from dual;   -- 새로운 값
select team_teamid_seq.nextval from dual;
select team_teamid_seq.currval from dual;    --현재 값

insert into teams
values(team_teamid_seq.nextval, 'Marketing');

select * from teams
where team_id < 5;

create sequence x_xid_seq
    start with 10
    increment by 5
    maxvalue 20
    nocache -- 미리 준비 안하겠다. 캐시하고 싶으면 그냥 cache라고 적으면 된다.
    nocycle; -- 에러 처리 하고 싶을 때 사용한다. 리턴하고 싶으면 그냥 cycle 넣어주면 된다.
    
select x_xid_seq.nextval from dual;

-- 과제: DEPT 테이블의 DEPARTMENT_ID 칼럼의 field value로 쓸 sequence를 만들어라.
--       sequence는 400이상, 1000이하로 생성한다. 10씩 증가한다.

drop sequence dept_departmentid_seq;

create sequence dept_departmentid_seq
    start with 400
    increment by 10
    maxvalue 1000
    nocache
    nocycle;

select dept_departmentid_seq.nextval from dual;

-- 과제: 위 sequence를 이용해서, dept 테이블에서 Education 부서를 insert하라.
    
insert into dept
values(dept_departmentid_seq.nextval, 'Education', null, null);

-- 선생님답

insert into dept(department_id, department_name)
values(dept_departmentid_seq.nextval, 'Education');

commit;

drop index emp_lastname_idx;

create index emp_lastname_idx
on employees(last_name);

select last_name, rowid  -- row id로 특정 로우를 찾아 낼 수 있다.
from employees;

select last_name
from employees
where rowid = 'AAAEAbAAEAAAADNABe';

select index_name, index_type, table_owner, table_name
from user_indexes;

-- 과제: dept 테이블의 department_name 에 대해 index를 만들어라.
create index dept_departmentname_idx
on dept(department_name);

select index_name, index_type, table_owner, table_name
from user_indexes;

drop synonym team;

create synonym team
for departments;

select * from team;

-- 과제: EMPLOYEES 테이블에 EMPS sysnonym을 만들어라.

drop synonym emps;

create synonym emps
for employees;

select * from emps;