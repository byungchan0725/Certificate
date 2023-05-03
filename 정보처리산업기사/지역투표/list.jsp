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
	<h2>후보조회</h2>
	<table border="1">
		<tr>
			<td>후보번호</td>
			<td>성명</td>
			<td>소속정당</td>
			<td>학력</td>
			<td>주민번호</td>
			<td>지역구</td>
			<td>대표전화</td>
		</tr>
		<%
		request.setCharacterEncoding("UTF-8");
		
		String tel = "";
		String sch = "";
		String jumin = "";
		
		String sql = "";
		try{
			sql = "select me.m_no, me.m_name, pa.p_name, me.p_school, me.m_jumin, me.m_city, pa.p_tel1, pa.p_tel2, pa.p_tel3 " + 
				  "from tbl_member_202005 me, tbl_party_202005 pa " +
			 	  "where me.p_code = pa.p_code " + 
				  "order by me.m_no ";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				tel = rs.getString(7)+"-"+rs.getString(8)+"-"+rs.getString(9);
				jumin = rs.getString(5).substring(0,7) + "-" + rs.getString(5).substring(7, 13);
				
				if(rs.getString(4).equals("1")) sch = "고졸";
				else if(rs.getString(4).equals("2")) sch = "학사";
				else if(rs.getString(4).equals("2")) sch = "석사";
				else sch = "박사";
				%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=sch %></td>
					<td><%=jumin %></td>
					<td><%=rs.getString(6) %></td>
					<td><%=tel %></td>
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