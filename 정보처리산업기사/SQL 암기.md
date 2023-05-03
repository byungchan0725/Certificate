SQL문 정리하기  
- to_char(avg(score), '99.99')  
	- 스코어의 평균을 낸다음 '99.99'와 같은 형식으로 값을 출력한다. 

- rank() over(order by sum(score) desc)
	- 점수가 높은 순서대로 자동으로 점수를 매겨줌 
	- 사용방법 
	> RANK() OVER(ORDER BY 컬럼명 (ASC|DESC)) (AS 별칭)

- group by 
	- 집계함수 count, sum, avg 이런친구들을 썻다면 무조건 써주어야함!

- modify
	- 수정을 하려면 번호에 href 태그를 달아서 페이지에 값을 전달해줄 수 있다.
	> a href="modify.jsp?id=<%=rs.getString(1) %>"><%=rs.getString(1) %>/a

- delete 
	> a href="action.jsp?id=<%=rs.getString(1) %>&mode=delete"
- as 
	> COUNT(A)라고 가정할 때 이 COUNT(A)를 as로 간단하게 부를 수 있다 <br>
	> COUNT(A) as N
