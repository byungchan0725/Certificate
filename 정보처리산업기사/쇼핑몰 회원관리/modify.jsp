<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="check.js">
</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h2><b>홈쇼핑 회원 등록</b></h2>
		<form method="post" action="action.jsp" name="frm2">
		<input type="hidden" name="mode" value="modify">
			<table>
				<%
				request.setCharacterEncoding("UTF-8");
				String custno = request.getParameter("custno");
				try{
					String sql = "select * from tbl_member_202205 where custno=?";
					PreparedStatement pstmt = con.prepareStatement(sql);
					pstmt.setString(1, custno);
					ResultSet rs = pstmt.executeQuery();
					rs.next();
				%>
				<tr>
					<td>회원번호</td>
					<td><input type="text" name="custno" value="<%=rs.getString("custno")%>" readonly></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname" value="<%=rs.getString("custname")%>"></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone" value="<%=rs.getString("phone")%>"></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address" value="<%=rs.getString("address")%>"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate" value="<%=rs.getDate("joindate")%>"></td>
				</tr>
				<tr>
					<td>고객등급[A:VIP, B:일반, C:직원]</td>
					<td><input type="text" name="grade" value="<%=rs.getString("grade")%>"></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city" value="<%=rs.getString("city")%>"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록" onclick="return modify()">
						<input type="button" value="조회" onclick="return search()">
					</td>
				</tr>
				<%
				} catch(Exception e){
					out.println(e.getMessage());	
				}
				%>
			</table>
		</form>
	</section>
	
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>