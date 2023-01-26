--ddl

drop table hire_dates;

--���̺� ���� ������ ���´�.
create table hire_dates (
emp_id number(8),
hire_date date default sysdate);
-- �ʵ� ������ null ���� �ִ� ���� null�� ����ϰų� �������ش�.
-- �̶� ���ϰ��� default�� �ְ� ������ ���� ���� �ڵ带 �ۼ��ϸ� �ȴ�.

--data dictionary
select tname
from tab;

-- ���� : ������ ���̺��� ���� ��ȸ�϶�.
select tname
from tab
where tname not like 'BIN%';

insert into hire_dates values(1, to_date('2025/12/21'));
insert into hire_dates values(2, null);
insert into hire_dates (emp_id) values(3); -- ���� ����Ʈ�� �ٲ��־��� ������ sysdate�� ����.

select * from hire_dates;

commit; -- ����Ŭ�� �޸𸮿� ���� �� �����͸� ��ũ ���Ϸ� ���� �����Ѵ�.
--hr ��Ű���� ������ �ȴ�.

-- DCL (Data Control Language)
--