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
	<h2>참가자 목록 조회</h2>
	<table border="1">
		<tr>
			<td>참가번호</td>
			<td>참가자명</td>
			<td>생년월일</td>
			<td>성별</td>
			<td>특기</td>
			<td>소속사</td>
		</tr>
		<%
		request.setCharacterEncoding("UTF-8");
		
		String sql = "";
		String gender = "";
		String date = "";
		String talent = "";
		
		try{
			sql = "select * from tbl_artist_201905 order by artist_id";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				if(rs.getString(4).equals("F")) gender = "여";
				else gender = "남";
				
				if(rs.getString(5).equals("1")) talent = "보컬";
				else if(rs.getString(5).equals("2")) talent = "댄스";
				else talent = "랩";
				
				date = rs.getString(3).substring(0,4) + "년" + rs.getString(3).substring(4,6) + "월" + rs.getString(3).substring(6,8);
				
				
				%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=date %></td>
					<td><%=gender %></td>
					<td><%=talent %></td>
					<td><%=rs.getString(6) %></td>
				<%
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		%>
	</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>