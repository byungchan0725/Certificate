<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ include file="dbconn.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h2>선수별 홈그라운드 조회</h2>
	<table border="1">
		<tr>
			<td>선수이름</td>
			<td>포지션</td>
			<td>팀이름</td>
			<td>경기장 이름</td>
			<td>좌석 수</td>
		</tr>
		<%
		request.setCharacterEncoding("UTF-8");
		String sql = "";
		String count = "";
		String position = "";
		
		try{
			sql = "select pl.player_name, pl.player_position, te.team_name, st.stadium_name, st.seat_count " + 
				  "from tbl_player_20221205 pl, tbl_team_20221205 te, tbl_stadium_20221205 st " +
				  "where pl.team_id = te.team_id AND st.stadium_id = te.stadium_id AND seat_count >= 30000" +
				  "order by seat_count";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				if(rs.getString(5).length() == 5){
					count = rs.getString(5).substring(0,2)+","+rs.getString(5).substring(2,5);
				}
				else{
					count = rs.getString(5).substring(0,1)+","+rs.getString(5).substring(1,4);
				}
				
				if(rs.getString(2).equals("GK")) position = "골키퍼";
				else if(rs.getString(2).equals("DF")) position = "수비수";
				else if(rs.getString(2).equals("FW")) position = "공격수";
				else position = "미드필더";
		%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=position %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=count %>개</td>
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