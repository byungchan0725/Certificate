<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h2>롯데자이언츠 선수 목록</h2>
	<table border="1">
		<tr>
			<td>선수번호</td>
			<td>선수이름</td>
			<td>선수포지션</td>
			<td>선수등록일</td>
			<td>선수등급</td>
			<td>삭제</td>
		</tr>
		<%
		String sql = "";
		try{
			sql = "select * from giants_player order by pid";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				%>
				<tr>
					<td style="text-align: center"><a href="modify.jsp?pid=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
					<td style="text-align: center"><%=rs.getString(2) %></td>
					<td style="text-align: center"><%=rs.getString(3) %></td>
					<td style="text-align: center"><%=rs.getString(4).substring(0,4)+"년"+rs.getString(4).substring(4,6)+"월"+rs.getString(4).substring(6,8)+"일" %></td>
					<td style="text-align: center"><%=rs.getString(5) %></td>
					<td style="text-align: center"><a href="d-action.jsp?pid=<%=rs.getString(1) %>">삭제</a></td>
				</tr>
				<%
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		%>
	</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>