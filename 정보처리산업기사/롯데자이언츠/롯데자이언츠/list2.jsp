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
	<h2>롯데자이언츠 코치별 관리 선수 목록</h2>
	<table border="1">
		<tr>
			<td>코치번호</td>
			<td>코치이름</td>
			<td>코치포지션</td>
			<td>관리선수</td>
			<td>관리선수연봉합계</td>
			<td>관리선수평균연봉</td>
			<td>관리선수최대연봉</td>
			<td>관리선수최소연봉</td>
		</tr>
		<%
		String sql = "";
		try{
			sql = "select co.cid, co.cname, co.cposition, count(mo.cid), SUM(mo.pcost), AVG(mo.pcost), MAX(mo.pcost), MIN(mo.pcost) " + 
					"from GIANTS_money mo, giants_coach co, giants_player pl " +
					"where co.cid = mo.cid and pl.pid = mo.pid " +
					"group by co.cid, co.cname, co.cposition " +
					"order by SUM(mo.pcost) DESC ";
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
					<td><%=rs.getString(6) %></td>
					<td><%=rs.getString(7) %></td>
					<td><%=rs.getString(8) %></td>
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