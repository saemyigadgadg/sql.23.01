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