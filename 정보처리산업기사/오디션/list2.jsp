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
	<h2><b>멘토 점수 조회</b></h2>
	<table border="1">
		<tr>
			<td>채점번호</td>
			<td>참가번호</td>
			<td>참가자명</td>
			<td>생년월일</td>
			<td>점수</td>
			<td>평점</td>
			<td>멘토명</td>
		</tr>
		<%
		request.setCharacterEncoding("UTF-8");
		
		String sql = "";
		String score = "";
		
		try{
			String birth = "";
			sql = "select po.serial_no, ar.artist_id, ar.artist_name, ar.birth, po.score, score, me.mento_name " +
					 "from tbl_artist_201905 ar, tbl_mento_201905 me, tbl_point_201905 po " +
					 "where po.artist_id = ar.artist_id and me.mento_id = po.mento_id " +
					 "order by po.serial_no";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				birth = rs.getString("birth").substring(0,4) + "년" + rs.getString("birth").substring(4,6) + "월" + rs.getString("birth").substring(6,8) + "일";
				
				if(rs.getInt(6) >= 90) score = "A";
				else if(rs.getInt(6) >= 80) score = "B";
				else if(rs.getInt(6) >= 70) score = "C";
				else if(rs.getInt(6) >= 60) score = "D";
				else score = "F";
				%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=birth %></td>
					<td><%=rs.getInt(5) %></td>
					<td><%=score %></td>
					<td><%=rs.getString(7) %></td>
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