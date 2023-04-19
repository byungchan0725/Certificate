<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="check.js"></script>
<link rel="stylesheet" href="style.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h2><b>오디션 등록</b></h2>
	<form name="frm" method="get" action="action.jsp">
		<table border="1">
		<tr>
			<td>참가번호</td>
			<td><input type="text" name="id">*참가번호는(A000)4자리입니다.</td>
		</tr>
		<tr>
			<td>참가자명</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>
				<input type="text" name="y">년
				<input type="text" name="m">월
				<input type="text" name="d">일
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<input type="radio" name="gender" value="1">남성
				<input type="radio" name="gender" value="2">여성
			</td>
		</tr>
		<tr>
			<td>특기</td>
			<td>
				<select name="talent">
					<option value="">특기 선택</option>
					<option value="1">[1]보컬</option>
					<option value="2">[2]댄스</option>
					<option value="3">[3]랩</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>소속사</td>
			<td><input type="text" name="agency"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="오디션등록" onclick="return join()">
				<input type="button" value="다시쓰기" onclick="rreset()">
			</td>
		</tr>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>