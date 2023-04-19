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
	<h2><b>참가자 목록 조회</b></h2>
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
		String talent = "";
		String gender = "";
		String birth = "";
		
		try{
			sql = "select * from tbl_artist_201905";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				if(rs.getString("talent").equals("1")) talent = "보컬";
				else if(rs.getString("talent").equals("2")) talent = "댄스";
				else talent = "랩";
				
				if(rs.getString("gender").equals("F")) gender = "여";
				else gender = "남";
				
				birth = rs.getString("birth").substring(0,4) + "년" + rs.getString("birth").substring(4,6) + "월" + rs.getString("birth").substring(6,8) + "일";
				
				%>
				<tr>
					<td><%=rs.getString("artist_id") %></td>
					<td><%=rs.getString("artist_name") %></td>
					<td><%=birth %></td>
					<td><%=gender %></td>
					<td><%=talent %></td>
					<td><%=rs.getString("agency") %></td>
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