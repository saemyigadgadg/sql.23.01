select tname
from tab;

create table depts(
department_id number(3) constraint depts_deptid_pk primary key, -- �����ؾ� �ϴ� Ű���� �Ѵ�.
department_name varchar2(20));
--(��'?'��)�ڡڡڡڡڡڡڡڡڡڡڡڡ� ��û �߿� �ڡڡڡڡڡڡڡڡڡڡڡڡڡ�(��'?'��)
--constraint ������ ������ ���� �ִ� ��ü�� �����Ѵ�. depts �� constrain �� �������̴�.
-- DB�� ���Ἲ�� Ȯ���ϱ� ���� constraint�� ����Ѵ�.
--constraint�� �̸��� ���̺��, Į����, pk(primary key) ��� ����Ѵ�.
--DDL ������ Ÿ�� ����

desc user_constraints -- ���������� Ȯ���� �� �ֽ��ϴ�.

select constraint_name, constraint_type, table_name
from user_constraints;

create table emps(
employee_id number(3) primary key,  
--�ڡڡڡڡڡڡ� primary key = unique + not null �ڡڡڡڡڡڡڡ�
--���� �ִ� constraint depts_deptid_pk �� ����Ŭ���� �ڵ����� �����Ѵ�.
emp_name varchar2(10) constraint emps_empname_nn not null, -- emp ������ null�� �� ����.
email varchar(20),
salary number(6) constraint emps_sal_ck check(salary > 1000), --�������� ���� üũ�Ѵ�.
-- salary�� 1000�� �ʰ��ؾ� �Ѵ�. insert, update   -- �������� �������� ���Ἲ�� Ȯ���ϴ� ���� check�̴�.
department_id number(3),
constraint emps_email_uk unique(email), -->Į�� ���ӹٷ� ���� ���� �ƴϱ⶧���� ������־�� �Ѵ�.
constraint emps_deptid_fk foreign key(department_id)
    references depts(department_id));   --emps�� department_id �� depts department_id

select constraint_name, constraint_type, table_name
from user_constraints;

insert into depts values(100, 'Development');
insert into emps values(500, 'musk', 'musk@gmail.com', 5000, 100);
insert into emps values(501, 'a', 'musk@gmail.net', 2000, 100);
-- ���� 501�� ����� ���ٸ� �������ϰ� ������ �����Ͱ� �ȴ�.
-- ������ �����͸� ���ֱ� ���ؼ��� �ӽŷ����� �ʿ��ϴ�.

drop table emps cascade constraints;

select constraint_name, constraint_type, table_name
from user_constraints;

select * from depts;
--������ ����϶�!!!!! 
--grant ��ɹ��� ����Ϸ��� �ý��� ������ �ٲ���Ѵ�.

grant all on hr.departments to you;
-- you�� hr.deparmtents�� �����͸� read write�� �� �ִ� ������ �����.

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
gu_name char(9) not null);    -- �θ����̺�

create table dong (
dong_id number(4) primary key,
dong_name varchar2(12) not null,
gu_id number(3) references gu(gu_id) on delete cascade); --�ڽ����̺�

create table dong2 (
dong_id number(4) primary key,
dong_name varchar2(12) not null,
gu_id number(3) references gu(gu_id) on delete set null);

insert into gu values(100, '������');
insert into gu values(200, '�����');

insert into dong values(5000, '�б�����', null);
insert into dong values(5001, '�Ｚ��', 100);
insert into dong values(5002, '���ﵿ', 100);
insert into dong values(6001, '��赿', 200);
insert into dong values(6002, '�߰赿', 200);

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
insert into b values(32, 9); -- ����� ���� �ƴϱ� ������ �θ�Ű�� �߰ߵ��� �ʾ� ������ �߻��Ѵ�.

--foreign key�� ���� ���
alter table b disable constraint b_aid_fik; -- �̸� fk�ε� �߸� ��
-- �ش� ��ɹ� �� 111���� �����غ��� �� �۵��Ѵ�.

alter table b enable constraint b_aid_fik; 
-- �̹� 111���̺� 9 ��� Ű�� ����Ǿ��� ������ �˻�� �θ����̺��� ������ �ʾ� ������ �߻��Ѵ�.
alter table b enable novalidate constraint b_aid_fik;

insert into b values(33, 8);

create table sub_departments as   -- ���̺��� �����ؿ´�.
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

--���̺��� �б��������� �ٲ㺸��.
insert into  users values(1);

alter table users read only;
insert into users values(2);

alter table users read write;
insert into users values(2);

commit;