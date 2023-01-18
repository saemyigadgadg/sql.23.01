--single function
desc dual
select * from dual; --��¥ ���̺�

select lower('SQL Course') --�ҹ��ڷ� ���´�.
from dual;  

select upper('SQL Course') --�빮�ڷ� ���´�.
from dual;

select initcap('SQL Course') -- ù ���ڸ� �빮�ڷ� ���´�.
from dual;

select last_name
from employees
where last_name = 'higgins'; -- ��ȸ�� �ȵȴ�.

select last_name
from employees
where last_name = 'Higgins'; -- ��ȸ�� �ȴ�.

select last_name
from employees
where lower(last_name) = 'higgins'; -- �ҹ��ڷ� �ٲ㼭 ã���ش�.
--lower function�� ���ϰ��� ��� 'higgins'�� ���Ѵ�.

select concat('Hello', 'World') --�ʵ� 2���� �𿩼� �ϳ��� �ο츦 �����.
from dual;

select substr('HelloWorld', 2, 5) --�ο� 1��, �ʵ� 3�� 'elloW'�� �����Ѵ�.
from dual;

select substr('Hello', -1, 1) -- '-'�� ���̸� �ڿ��� ���� �����Ѵ�.
from dual;

select length('Hello')
from dual;

select instr('Hello', 'l') /*hello�� l�̶�� ���ڰ� �ִ��İ� ���´�. ���ʺ��� �˻��ϱ� ������ 3���� �˻��� ������ 3�ε����� �����Ѵ�.*/
from dual; --�ڹٿ��� Ȱ���� �� ���ϰ��� 0���� ū���� ���Ѵ�.

select instr('Hello', 'w')
from dual;

select lpad(salary, 5, '*') --������ ����.
from employees;

select rpad(salary, 5, '*') --�������� ����.
from employees;

select replace('JACK and JUE', 'J', 'BL')    --j��� ���ڸ� bl�� �ٲ۴�.
from dual;

select trim('H' from 'Hello') -- �Ӹ����� H��� ���ڸ� �� ���̴�.
from dual;

select trim('l' from 'Hello')
from dual;

select trim(' ' from ' Hello ')
from dual;

select concat ('|', trim(' ' from ' Hello '), '|')
from dual;

select '|' || trim(' ' from ' Hello ') || '|'
from dual;

select trim(' Hello World ')
from dual;

select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where substr(job_id, 4) = 'PROG';

--4�� �ε������� ������ ���� ����.

select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where job_id like '%PROG';

--���� : �̸��� J�� A�� M���� �����ϴ� ������� �̸�, �̸��� ���ڼ��� ��ȸ�϶�
--       �̸��� ù ���ڴ� �빮��, �������� �ҹ��ڷ� ����Ѵ�.
select initcap(last_name) ,length(last_name)
from employees
where last_name like 'J%' 
        or last_name like 'A%' 
        or last_name like 'M%';
        
select round(45.926, 2)   -- �ݿø� �۾�, �տ��ִ� �Ҽ��� �ڿ� �ִ� �ڸ��� ��ŭ �����Ѵ�.
from dual;

select trunc(45.926, 2)   -- ���� �۾�
from dual;

select round(45.923, 0), round(45.923)
from dual;

select trunc(45.923, 0), trunc(45.923)
from dual;

--���� : ������� �̸�, ����, 15.5% �λ�� ����(New Salary, ����), 
--       �λ��(Increase)�� ��ȸ�϶�.
select last_name, salary, 
       round(salary * (1 + (15.5/100))) "New Salary", 
       round(salary * (1 + (15.5/100))) - salary "Increase"
from employees;

--�Ʒ��� ������ ���̴�.
select last_name, salary, 
       round(salary * 1.155) "New Salary", 
       round(salary * 1.155) - salary "Increase"
from employees;

select sysdate         --ȣ��Ǵ� ������ ��¥�� �����Ѵ�.
from dual;

select sysdate + 1
from dual;

select sysdate - 1
from dual;


select sysdate - sysdate
from dual;

select last_name, sysdate - hire_date
from employees
where department_id = 90;

select months_between('2023/12/31', '2022/12/31') -- ������ ���� ��
from dual;

select add_months('2024/01/18', 3)
from dual;

select next_day('2023/01/18', 5)  -- ��(1)��(2)ȭ(3)��(4)��(5)��(6)��(7)
from dual;

select next_day('2023/01/18', 4)
from dual;

select next_day('2023/01/18', 'thursday') -- ���ڷ� �� �� �� �ִ�.
from dual;

select next_day('2023/01/18', 'thu') -- ������ ���ڷ� �� �� �� �ִ�.
from dual;

select last_day('2023/01/18') -- ������ ���� ��
from dual;

-- ����: 20�� �̻� ������ ������� �̸�, ù �������� ��ȸ�϶�.
        
select last_name, last_day(hire_date)
from employees
where months_between(sysdate, hire_date) >= 12 * 20;

-- ����: ������� function�� �̿��ϸ� �ȴ�, ������� �̸�, ���� �׷����� ��ȸ�϶�.
--       �׷����� $1000 �� * �ϳ��� ǥ���Ѵ�.
select last_name, rpad(' ', salary/1000 + 1, '*')
from employees
order by salary desc;
