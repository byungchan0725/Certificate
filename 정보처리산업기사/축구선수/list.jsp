<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
	<h2>선수조회</h2>
	<table border="1">
		<tr>
			<td>선수ID</td>
			<td>선수이름</td>
			<td>포지션</td>
			<td>선수등록일</td>
			<td>팀 이름</td>
		</tr>
		<%
		request.setCharacterEncoding("UTF-8");
		String sql = "";
		String position = "";
		try{
			sql = "select pl.player_id, pl.player_name, pl.player_position, pl.player_date, te.team_name " +
				  "from tbl_player_20221205 pl, tbl_team_20221205 te " +
				  "where te.team_id = pl.team_id " + 
				  "order by pl.player_id ";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				if(rs.getString(3).equals("GK")) position = "골키퍼";
				else if(rs.getString(3).equals("DF")) position = "수비수";
				else if(rs.getString(3).equals("FW")) position = "공격수";
				else position = "미드필더";
				%>
				<tr>
					<td><a href="modify.jsp?id=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
					<td><%=rs.getString(2) %></td>
					<td><%=position %></td>
					<td><%=rs.getString(4).substring(0,4)+"년"+rs.getString(4).substring(4,6)+"월"+rs.getString(4).substring(6,8)+"일" %></td>
					<td><%=rs.getString(5) %></td>
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