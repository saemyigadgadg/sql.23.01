-- where
select employee_id, last_name, department_id
from employees
where department_id = 50;
--where���� boolean Ÿ���� �ͽ��������� ����Ѵ�.

--���� : 176�� ����� ���, �̸�, �μ���ȣ�� ��ȸ�϶�.
select employee_id, last_name, department_id
from employees
where employee_id = 176;

select employee_id, last_name, department_id
from employees
where last_name = 'Whalen'; 
/*������Ʈ��Ʈ������ ��ҹ��ڸ� �������� �ʴ´�. 
�׷��� ������ 'Whalen'�� ��� ��ҹ��ڸ� �����Ѵ�*/

select employee_id, last_name, hire_date
from employees
where hire_date = '2008/02/06';

select last_name, salary
from employees
where salary <= 3000;

-- ����: �� $12,000 �̻� ���� ������� �̸�, ������ ��ȸ�϶�.
select last_name, salary
from employees
where salary >= 12000;

select last_name, job_id
from employees
where job_id != 'IT_PROG';

select last_name, salary
from employees
where salary between 2500 and 3500; --2500 �̻� 3500������ ���� ã�´�.

select last_name
from employees
where last_name between 'King' and 'Smith'; --K~ S������ ���� ã�´�.

--���� : 'king' ����� first_name, last_name, ����, ������ ��ȸ�϶�.
select first_name, last_name, job_id, salary 
from employees
where last_name = 'King';

select last_name, hire_date
from employees
where hire_date between '2002/01/01' and '2002/12/31';

select employee_id, last_name, manager_id
from employees
where manager_id in (100, 101, 201);   
/* between�� ������ ������ in�� �Ǽ��� �����͸� ã�´�.
in�� n���� �����͸� �ž� �������� ���� �� ����Ѵ�.*/

select employee_id, last_name, manager_id
from employees
where manager_id = 100 or 
    manager_id = 101 or
    manager_id = 201;  
/*���ǵ� �߿��� ��� �ϳ��� true�� ������ ã�Ƴ���.
n�� ������� ����.*/
    
select employee_id, last_name
from employees
where last_name in ('Hartstein', 'Vargars');

select last_name, hire_date
from employees
where hire_date in ('2003/06/17', '2005/09/21');

select last_name
from employees
where last_name like 'S%'; 
--like�� charŸ�Ը� ����Ѵ�. %�� ���ϵ�ī�带 �ǹ��Ѵ�. �ش� �����ڴ� �˻������ �Ҷ� Ȱ���� ���̴�.

select last_name
from employees
where last_name like 'r';

--���� : �̸��� s�� ���Ե� ������� �̸��� ��ȸ�϶�.
select last_name
from employees
where last_name like '%s%';

--���� : 2005�⿡ �Ի��� ������� �̸�, �Ի����� ��ȸ�϶�.
select last_name, hire_date
from employees
where hire_date like '2005%';
