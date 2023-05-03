<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
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
	<h2>홈쇼핑 회원 정보 수정</h2>
	<form name="frm" method="post" action="m-action.jsp">
		<table border="1">
		<%
		request.setCharacterEncoding("UTF-8");

		String custno = request.getParameter("custno");
		String custname = "";
		String phone = "";
		String address = "";
		String joindate = "";
		String grade =  "";
		String city =  "";
		String sql = "";
		try{
			sql = "select * from member_tbl_02 where custno=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, custno);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
		
		%>
			<tr>
				<td>회원번호</td>
				<td><input type="text" name="custno" value="<%=rs.getString(1)%>"></td>
			</tr>
			<tr>
				<td>회원성명</td>
				<td><input type="text" name="custname" value="<%=rs.getString(2)%>"></td>
			</tr>
			<tr>
				<td>회원전화</td>
				<td><input type="text" name="phone" value="<%=rs.getString(3)%>"></td>
			</tr>
			<tr>
				<td>회원주소</td>
				<td><input type="text" name="address" value="<%=rs.getString(4)%>"></td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td><input type="text" name="joindate" value="<%=rs.getDate(5)%>"></td>
			</tr>
			<tr>
				<td>고객등급[A:VIP, B:일반, C:직원]</td>
				<td><input type="text" name="grade" value="<%=rs.getString(6)%>"></td>
			</tr>
			<tr>
				<td>도시코드</td>
				<td><input type="text" name="city" value="<%=rs.getString(7)%>"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" onclick="return edit()">
					<input type="button" value="조회" onclick="search()">
				</td>
			</tr>
		<%
		}catch(Exception e){
			e.printStackTrace();
		}
		%>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>