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
	<h2><b>참가자 등수 조회</b></h2>
	<table border="1">
		<tr>
			<td>참가번호</td>
			<td>참가자명</td>
			<td>총점</td>
			<td>평균</td>
			<td>등수</td>
		</tr>
		<%
		request.setCharacterEncoding("UTF-8");
		String sql = "";
		try{
			sql = "select po.artist_id, ar.artist_name, sum(score), to_char(avg(score), '99.99'), rank() over(order by sum(score) desc) " + 
					  "from tbl_artist_201905 ar, tbl_point_201905 po " +
					  "where ar.artist_id = po.artist_id " + 
					  "group by po.artist_id, artist_name ";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
				</tr>
				<%
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		%>
	</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>