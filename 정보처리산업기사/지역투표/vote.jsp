<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="check.js"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h2>투표하기</h2>
	<form name="frm" method="post" action="i-action.jsp">
		<table border="1">
			<tr>
				<td>주민번호</td>
				<td><input type="text" name="jumin">예 : 8906143154726</td>
			</tr>
			<tr>
				<td>성명</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>후보번호</td>
				<td>
					<select name="m_no">
						<option value=""></option>
						<option value="1">김후보</option>
						<option value="2">이후보</option>
						<option value="3">박후보</option>
						<option value="4">조후보</option>
						<option value="5">최후보</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>투표시간</td>
				<td><input type="text" name="v_time"></td>
			</tr>
			<tr>
				<td>투표장소</td>
				<td><input type="text" name="v_area"></td>
			</tr>
			<tr>
				<td>유권자 확인</td>
				<td>
					<input type="radio" name="v_confirm" value="Y"> 확인
					<input type="radio" name="v_confirm" value="Y"> 미확인
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="투표하기" onclick="return join()">
					<input type="button" value="다시하기" onclick="return rreset()">
				</td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>