<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h2><b>회원목록조회/수정</b></h2>
	<form>
		<table>
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>전화번호</td>
				<td>주소</td>
				<td>가입일자</td>
				<td>고객등급</td>
				<td>거주지역</td>
			</tr>
			<%
			request.setCharacterEncoding("UTF-8");
			String grade = "";
			try{
				String sql = "select * from tbl_member_202205";
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()){
					switch(grade){
					case "A":
						grade = "VIP";
						break;
					case "B":
						grade = "일반";
						break;
					case "C":
						grade = "직원";
						break;
					}
					%>
					<tr>
						<td> <a href="modify.jsp?custno=<%=rs.getString("custno") %>">
 <%=rs.getString("custno") %> </a> </td>
						<td><%=rs.getString("custname") %></td>
						<td><%=rs.getString("phone") %></td>
						<td><%=rs.getString("address") %></td>
						<td><%=rs.getDate("joindate") %></td>
						<td><%=rs.getString("grade") %></td>
						<td><%=rs.getString("city") %></td>
					</tr>
					<% 
				}
			}catch (Exception e){
				e.printStackTrace();
			}
			%>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>