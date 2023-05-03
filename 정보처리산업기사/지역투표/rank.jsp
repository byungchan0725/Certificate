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
	<h2>후보자 등수 조회</h2>
	<table border="1">
		<tr>
			<td>후보번호</td>
			<td>성명</td>
			<td>총투표건수</td>
		</tr>
		<% 
		request.setCharacterEncoding("UTF-8");
		String sql = "";
		try{
			sql = "select me.m_no, me.m_name, COUNT(vo.m_no) as count " + 
				  "from tbl_vote_202005 vo, tbl_member_202005 me " + 
				  "where vo.m_no = me.m_no and vo.v_confirm = 'Y' " + 
				  "group by me.m_no, me.m_name " + 
				  "order by count desc ";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
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