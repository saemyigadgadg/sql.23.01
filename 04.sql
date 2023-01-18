select hire_date
from employees
where hire_date = '2003/06/17'; -- char이 date로 변환되다.

select salary
from employees
where salary = '7000'; -- num이 char로 변환되다. 그러나 hello로는 변환이 안된다.

select hire_date || '' -- 문자로 변환
from employees;

select salary || '' -- 문자로 변환
from employees;

select to_char(hire_date) -- char로 변환시킨다.
from employees;

select to_char(sysdate, 'dd-mm-yyyy') --내가 지정할 수 있다.
from dual;

select to_char(sysdate, 'YEAR MONTH DDsp DAY(DY)') --날짜를 문자로 리턴한다. (대문자)
from dual;

select to_char(sysdate, 'Year Month Ddsp Day(Dy)') --날짜를 문자로 리턴한다. (대소문자 혼합)
from dual;

select to_char(sysdate, 'd') --잘 기억해두기
from dual;

select last_name, hire_date,
       to_char(hire_date, 'day'),
       to_char(hire_date, 'd')
from employees;

--과제: 위 체이블을 월요일부터 입사일 순 오름차순 정렬하라.
select last_name, hire_date,
       to_char(hire_date, 'day') day
from employees
order by to_char(hire_date -1 , 'd');

select to_char(sysdate, 'hh24:mi:ss am')
from dual;

select to_char(sysdate, 'DD "of" Month')
from dual;

select to_char(hire_date, 'fmDD Month YY') -- fill mode 눌러서 공간을 절약시켜준다.
from employees;

-- 과제: 사원들의 이름, 입사일, 인사평가일을 조회하라.
--       인사평가일은 입사한 지 3개월 후 첫번째 월요일이다.
select last_name, hire_date, next_month(to_char(hire_date, 'DD "of" Month'),3)
from employees;