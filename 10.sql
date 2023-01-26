--ddl

drop table hire_dates;

--테이블 명은 복수로 짓는다.
create table hire_dates (
emp_id number(8),
hire_date date default sysdate);
-- 필드 벨류를 null 값을 넣는 법은 null을 명시하거나 생략해준다.
-- 이때 리턴값의 default를 주고 싶으면 위와 같이 코드를 작성하면 된다.

--data dictionary
select tname
from tab;

-- 과제 : 쓰레기 테이블을 빼고 조회하라.
select tname
from tab
where tname not like 'BIN%';

insert into hire_dates values(1, to_date('2025/12/21'));
insert into hire_dates values(2, null);
insert into hire_dates (emp_id) values(3); -- 위에 디폴트로 바꿔주었기 때문에 sysdate가 들어간다.

select * from hire_dates;

commit; -- 오라클의 메모리에 저장 된 데이터를 디스크 파일로 보내 저장한다.
--hr 스키마에 저장이 된다.

-- DCL (Data Control Language)
--