select avg(salary), max(salary), min(salary), sum(salary)
from employees;

select min(hire_date), max(hire_date)
from employees;

-- ���� : �ְ���ް� �ּҿ����� ������ ��ȸ�϶�.
select max(salary) - min(salary)
from employees;

select count(*) -- ��� Į���̶�� �ǹ��̴�.
from employees;

--���� : 70�� �μ����� ������� ��ȸ�϶�.
select count(department_id)
from employees
where department_id in(70);
--������ ��
select count(*)
from employees
where department_id = 70;

select count(employee_id)  -- ���⼭ pk �ʵ� ������ ������ �����ϴ�.
from employees;

select count(manager_id)
from employees;

select avg(commission_pct) --���� ������� Ŀ�̼� ����̴�.
from employees;

-- ����: ������ ��� Ŀ�̼� ���� ��ȸ�϶�.
select avg(nvl(commission_pct, 0))
from employees;

select avg(all salary) -- �ߺ��Ǵ� ���� ������ �ʴ´�. �⺻������ all�� ����. all�� ������ �� �ִ�.
from employees;

select avg(distinct salary) -- �ߺ��� �����Ѵ�.
from employees;

-- ����: ������ ��ġ�� �μ� ������ ��ȸ�϶�.
select count(distinct department_id)
from employees;

-- ����: �Ŵ��� ���� ��ȸ�϶�.
select count(distinct manager_id)
from employees;

select department_id, count(employee_id) -- select ���� �׷��Լ��� ������ �ϸ� �����Ѵ�.
from employees;

select department_id, count(employee_id)
from employees
group by department_id -- �׷��� ������ �Ѵ�. select���� Į�� ������ �����ϸ� �׷���̸� ����Ѵ�.
order by department_id;

select employee_id
from employees
where department_id = 30;

select department_id, job_id, count(employee_id)
from employees
group by department_id , job_id
order by department_id;

-- ����: ������ ������� ��ȸ�϶�.
select job_id, count(employee_id)
from employees
group by job_id
order by count(employee_id);

select department_id, max(salary)
from employees
group by department_id
having department_id > 50;     -- �׷쿡 ������ �ٿ��ش�.

select department_id, max(salary)
from employees
group by department_id
having max(salary) > 10000;

select department_id, max(salary) max_sal
from employees
group by department_id
having max_sal > 10000;  --�� �˾� ��´�.

select department_id, max(salary)
from employees
where department_id > 50
group by department_id;

select department_id, max(salary)
from employees
where max(salary) > 10000              --where������ �̱� �Լ��� �� �� ������ �׷� �Լ��� �� ����.
group by department_id;

select job_id, sum(salary) payroll
from employees
where job_id not like '%REP%'
group by job_id
having sum(salary) > 13000
order by payroll;

-- ����: �Ŵ���ID, �Ŵ����� ���� ������ �� �ּҿ����� ��ȸ�϶�.
--       �ּҿ����� $6,000 �ʰ����� �Ѵ�.
select manager_id, min(salary)
from employees
group by manager_id
having min(salary) > 6000;

--������ ��
select manager_id, min(salary)
from employees
where manager_id is not null
group by manager_id
having min(salary) > 6000
order by 2 desc;

select sum(max(avg(salary)))  -- �׷������ 2�ܰ������ �� �� �ִ�.
from employees
group by department_id;

select department_id, round(avg(salary))
from employees
group by department_id;

select department_id, round(avg(salary))
from employees;

-- ����: (2�������� �����ؾ� �Ѵ�.
--       2001��, 2002��, 2003�⵵�� �Ի��� ���� ��ȸ�϶�.
--�������� ��
select to_char(hire_date, 'yyyy') hire_year, count(*) emp_cnt
from employees
where to_char(hire_date, 'yyyy') in (2001, 2002, 2003)
group by to_char(hire_date, 'yyyy')
order by hire_year;

-- ������ ��
select sum(decode(to_char(hire_date, 'yyyy'), '2001', 1, 0)) "2001",
    sum(decode(to_char(hire_date, 'yyyy'), '2002', 1, 0)) "2002",
    sum(decode(to_char(hire_date, 'yyyy'), '2003', 1, 0)) "2003"
from employees;

-- ������ ��2
select count(case when hire_date like '2001%' then 1 else null end) "2001",
    count(case when hire_date like '2002%' then 1 else null end) "2002",
    count(case when hire_date like '2003%' then 1 else null end) "2003"
from employees;

-- ����: ������, �μ��� �������� ��ȸ�϶�.
--       �μ��� 20, 50, 80 �̴�.
select job_id,
    sum(decode(department_id, 20, salary)) "20",
    sum(decode(department_id, 50, salary)) "50",
    sum(decode(department_id, 80, salary)) "80"
from employees
group by job_id;