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
	<h2>투표검수조회</h2>
	<table border="1">
		<tr>
			<td>성명</td>
			<td>생년월일</td>
			<td>나이</td>
			<td>성별</td>
			<td>후보번호</td>
			<td>투표시간</td>
			<td>유권자확인</td>
		</tr>
		<% 
		request.setCharacterEncoding("UTF-8");
		
		String sql = "";
		String gender = "";
		String check = "";
		
		try{
			sql = "select v_name, v_jumin, me.m_no, v_time, v_confirm " + 
				  "from tbl_vote_202005 vo, tbl_member_202005 me " + 
				  "where vo.m_no = me.m_no";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				String date = rs.getString(2);
				if(date.substring(6,7).equals("1")) gender = "남";
				else gender = "여";
				
				if(rs.getString(5).equals("Y")) check="확인";
				else check="미확인";
				
				int age = 2020 - (1900 + Integer.parseInt(date.substring(0,2)));
				
		%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%="19"+date.substring(0,2)+"년"+date.substring(2,4)+"월"+date.substring(4,6)+"일생" %></td>
				<td>만 <%=age %>세</td>
				<td><%=gender %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4).substring(0,2)+":"+rs.getString(4).substring(2) %></td>
				<td><%=check %></td>
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