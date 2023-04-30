SQL문 정리하기  
- to_char(avg(score), '99.99')  
	- 스코어의 평균을 낸다음 '99.99'와 같은 형식으로 값을 출력한다. 

- rank() over(order by sum(score) desc)
	- 점수가 높은 순서대로 자동으로 점수를 매겨줌 
	- 사용방법 
	> RANK() OVER(ORDER BY 컬럼명 (ASC|DESC)) (AS 별칭)
