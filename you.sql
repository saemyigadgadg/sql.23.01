select tname
from tab;

create table depts(
department_id number(3) constraint depts_deptid_pk primary key, -- 유일해야 하는 키여야 한다.
department_name varchar2(20));
--(●'?'●)★★★★★★★★★★★★★ 엄청 중요 ★★★★★★★★★★★★★★(●'?'●)
--constraint 조건의 정보를 갖고 있는 객체를 정의한다. depts 는 constrain 과 종속적이다.
-- DB의 무결성을 확보하기 위해 constraint을 사용한다.
--constraint의 이름은 테이블명, 칼럼명, pk(primary key) 라고 약속한다.
--DDL 데이터 타입 정의

desc user_constraints -- 제약조건을 확인할 수 있습니다.

select constraint_name, constraint_type, table_name
from user_constraints;

create table emps(
employee_id number(3) primary key,  
--★★★★★★★ primary key = unique + not null ★★★★★★★★
--위에 있던 constraint depts_deptid_pk 를 오라클에서 자동으로 구현한다.
emp_name varchar2(10) constraint emps_empname_nn not null, -- emp 값에는 null은 못 들어간다.
email varchar(20),
salary number(6) constraint emps_sal_ck check(salary > 1000), --로지컬한 값을 체크한다.
-- salary는 1000을 초과해야 한다. insert, update   -- 업무적인 관점에서 무결성을 확보하는 것은 check이다.
department_id number(3),
constraint emps_email_uk unique(email), -->칼럼 네임바로 옆에 쓴게 아니기때문에 명시해주어야 한다.
constraint emps_deptid_fk foreign key(department_id)
    references depts(department_id));   --emps의 department_id 와 depts department_id

select constraint_name, constraint_type, table_name
from user_constraints;

insert into depts values(100, 'Development');
insert into emps values(500, 'musk', 'musk@gmail.com', 5000, 100);
insert into emps values(501, 'a', 'musk@gmail.net', 2000, 100);
-- 만약 501번 사원이 없다면 로지컬하게 거짓된 데이터가 된다.
-- 거짓된 데이터를 없애기 위해서는 머신러닝이 필요하다.

drop table emps cascade constraints;

select constraint_name, constraint_type, table_name
from user_constraints;

select * from depts;
--팀장은 기억하라!!!!! 
--grant 명령문을 사용하려면 시스템 유저로 바꿔야한다.

grant all on hr.departments to you;
-- you가 hr.deparmtents의 데이터를 read write할 수 있는 권한을 얻었다.

drop table employees cascade constraints;

create table employees(
employee_id number(6) constraint emp_empid_pk primary key,
first_name varchar2(20),
last_name varchar2(25) constraint emp_lastname_nn not null,
email varchar2(25) constraint emp_email_nn not null
                    constraint emp_email_uk unique,
phone_number varchar2(20),
hire_date date constraint emp_hiredate_nn not null,
job_id varchar2(10) constraint emp_jobid_nn not null,
salary number(8) constraint emp_salary_ck check(salary > 0),
commission_pct number(2, 2),
manager_id number(6)constraint emp_managerid_fk references employees(employee_id),
deparmtent_id number(4) constraint emp_dept_fk references hr.departments(department_id));

create table gu (
gu_id number(3) primary key,
gu_name char(9) not null);    -- 부모테이블

create table dong (
dong_id number(4) primary key,
dong_name varchar2(12) not null,
gu_id number(3) references gu(gu_id) on delete cascade); --자식테이블

create table dong2 (
dong_id number(4) primary key,
dong_name varchar2(12) not null,
gu_id number(3) references gu(gu_id) on delete set null);

insert into gu values(100, '강남구');
insert into gu values(200, '노원구');

insert into dong values(5000, '압구정동', null);
insert into dong values(5001, '삼성동', 100);
insert into dong values(5002, '역삼동', 100);
insert into dong values(6001, '상계동', 200);
insert into dong values(6002, '중계동', 200);

insert into dong2
select * from dong;

delete gu
where gu_id = 100;

select * from dong; -- on delete cascade
select * from dong2; -- on delete set null

commit;

create table a (
aid number(1) constraint a_aid_pk primary key);

create table b (
bid number(2),
aid number(1),
constraint b_aid_fik foreign key(aid) references a(aid));

insert into a values(1);
insert into b values(31, 1);
insert into b values(32, 9); -- 복사된 값이 아니기 때문에 부모키가 발견되지 않아 오류가 발생한다.

--foreign key를 재우는 방법
alter table b disable constraint b_aid_fik; -- 이름 fk인데 잘못 씀
-- 해당 명령문 후 111행을 실행해보면 잘 작동한다.

alter table b enable constraint b_aid_fik; 
-- 이미 111테이블에 9 라는 키가 적용되었기 때문에 검사시 부모테이블이 보이지 않아 오류가 발생한다.
alter table b enable novalidate constraint b_aid_fik;

insert into b values(33, 8);

create table sub_departments as   -- 테이블을 복사해온다.
    select department_id dept_id, department_name dept_name
    from hr.departments;
    
select * from sub_departments;

create table users(
user_id number(3));
desc users

alter table users add(user_name varchar2(10));
desc users

alter table users modify(user_name number(7));
desc users

alter table users drop column user_name;
desc users

--테이블을 읽기전용으로 바꿔보자.
insert into  users values(1);

alter table users read only;
insert into users values(2);

alter table users read write;
insert into users values(2);

commit;