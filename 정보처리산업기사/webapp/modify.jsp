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
<script type="text/javascript" src="check.js"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h2>등록된 선수 정보 수정</h2>
	<form name="frm" method="post" action="m-action.jsp">
		<table border="1">
		<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String sql = "";
		try{
			sql = "select * " + 
				  "from tbl_player_20221205 " +
				  "where player_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			String team_name = rs.getString(5);
		%>
			<tr>
				<td>선수ID</td>
				<td><input type="text" name="id" value="<%=rs.getString(1) %>" readonly></td>
			</tr>
			<tr>
				<td>선수이름</td>
				<td><input type="text" name="name" value="<%=rs.getString(2) %>"></td>
			</tr>
			<tr>
				<td>포지션</td>
				<td>
					<input type="radio" name="position" value="GK" <%if(rs.getString(3).equals("GK")) out.println("checked"); %>>골키퍼
					<input type="radio" name="position" value="DF" <%if(rs.getString(3).equals("DF")) out.println("checked"); %>>수비수
					<input type="radio" name="position" value="MF" <%if(rs.getString(3).equals("MF")) out.println("checked"); %>>미드필더
					<input type="radio" name="position" value="FW" <%if(rs.getString(3).equals("FW")) out.println("checked"); %>>공격수
				</td>
			</tr>
			<tr>
				<td>선수등록일</td>
				<td><input type="text" name="date" value="<%=rs.getString(4) %>"></td>
			</tr>
			<tr>
				<td>소속팀</td>
				<td>
					<select name="team">
						<option value="K00" <%if(team_name.equals("K00")) out.print("selected"); %>>무소속</option>
						<option value="K01" <%if(team_name.equals("K01")) out.print("selected"); %>>울산현대</option>
						<option value="K02" <%if(team_name.equals("K02")) out.print("selected"); %>>삼성블루윙즈</option>
						<option value="K03" <%if(team_name.equals("K03")) out.print("selected"); %>>스틸러스</option>
						<option value="K04" <%if(team_name.equals("K04")) out.print("selected"); %>>유나이티드</option>
						<option value="K05" <%if(team_name.equals("K05")) out.print("selected"); %>>현대모터스</option>
						<option value="K06" <%if(team_name.equals("K06")) out.print("selected"); %>>부산소마고</option>
						<option value="K07" <%if(team_name.equals("K07")) out.print("SELECTED"); %>>드래곤즈</option>
						<option value="K08" <%if(team_name.equals("K08")) out.print("selected"); %>>일화천마</option>
						<option value="K09" <%if(team_name.equals("K09")) out.print("selected"); %>>FC서울</option>
						<option value="K10" <%if(team_name.equals("K10")) out.print("selected"); %>>시티즌</option>
						<option value="K11" <%if(team_name.equals("K11")) out.print("selected"); %>>경남FC</option>
						<option value="K12" <%if(team_name.equals("K12")) out.print("selected"); %>>광주상무</option>
						<option value="K13" <%if(team_name.equals("K13")) out.print("selected"); %>>강원FC</option>
						<option value="K14" <%if(team_name.equals("K14")) out.print("selected"); %>>제주유나이티드FC</option>
						<option value="K15" <%if(team_name.equals("K15")) out.print("selected"); %>>대구FC</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" onclick="return edit()">
					<input type="button" value="취소" onclick="rreset()">
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