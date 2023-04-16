<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
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
		<h2><b>홈쇼핑 회원 등록</b></h2>
		<form method="post" action="action.jsp" name="frm">
		<input type="hidden" name="mode" value="insert">
			<table>
				<%
				request.setCharacterEncoding("UTF-8");
				String custno = "";
				try{
					String sql = "select max(custno)+1 as custno from tbl_member_202205";
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					rs.next();
					custno = rs.getString("custno");
				} catch(Exception e){
					e.printStackTrace();
				}
				%>
				<tr>
					<td>회원번호(자동등록)</td>
					<td><input type="text" name="custno" value="<%=custno %>" readonly></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname"></td>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone"></td>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address"></td>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate"></td>
				<tr>
					<td>고객등급[A:VIP, B:일반, C:직원]</td>
					<td><input type="text" name="grade"></td>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록" onclick="return joincheck()">
						<input type="button" value="조회" onclick="return search()">
					</td>
			</table>
		</form>
	</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>