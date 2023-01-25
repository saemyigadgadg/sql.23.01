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