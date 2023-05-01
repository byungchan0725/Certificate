<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="check.js"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h2>좌석예약조회</h2>
	<form name="frm2" method="post" action="action.jsp">
	<input type="hidden" name="mode" value="search">
		<table border="1">
			<tr>
				<td>사원번호를 입력하시오.</td>
				<td><input type="text" name="empno"></td>
			</tr>
			<tr>
				<td colspan="2"> 
					<input type="button" value="좌석예약조회" onclick="return search()">
					<input type="button" value="홈으로" onclick="home()">
				</td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>