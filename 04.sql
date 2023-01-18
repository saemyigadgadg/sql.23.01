select hire_date
from employees
where hire_date = '2003/06/17'; -- char�� date�� ��ȯ�Ǵ�.

select salary
from employees
where salary = '7000'; -- num�� char�� ��ȯ�Ǵ�. �׷��� hello�δ� ��ȯ�� �ȵȴ�.

select hire_date || '' -- ���ڷ� ��ȯ
from employees;

select salary || '' -- ���ڷ� ��ȯ
from employees;

select to_char(hire_date) -- char�� ��ȯ��Ų��.
from employees;

select to_char(sysdate, 'dd-mm-yyyy') --���� ������ �� �ִ�.
from dual;

select to_char(sysdate, 'YEAR MONTH DDsp DAY(DY)') --��¥�� ���ڷ� �����Ѵ�. (�빮��)
from dual;

select to_char(sysdate, 'Year Month Ddsp Day(Dy)') --��¥�� ���ڷ� �����Ѵ�. (��ҹ��� ȥ��)
from dual;

select to_char(sysdate, 'd') --�� ����صα�
from dual;

select last_name, hire_date,
       to_char(hire_date, 'day'),
       to_char(hire_date, 'd')
from employees;

--����: �� ü�̺��� �����Ϻ��� �Ի��� �� �������� �����϶�.
select last_name, hire_date,
       to_char(hire_date, 'day') day
from employees
order by to_char(hire_date -1 , 'd');

select to_char(sysdate, 'hh24:mi:ss am')
from dual;

select to_char(sysdate, 'DD "of" Month')
from dual;

select to_char(hire_date, 'fmDD Month YY') -- fill mode ������ ������ ��������ش�.
from employees;

-- ����: ������� �̸�, �Ի���, �λ������� ��ȸ�϶�.
--       �λ������� �Ի��� �� 3���� �� ù��° �������̴�.
select last_name, hire_date, next_month(to_char(hire_date, 'DD "of" Month'),3)
from employees;