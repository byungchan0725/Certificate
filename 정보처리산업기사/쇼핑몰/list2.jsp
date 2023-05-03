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
	<h2>회원매출</h2>
	<table border="1">
		<tr>
			<td>회원번호</td>
			<td>회원성명</td>
			<td>고객등급</td>
			<td>매출</td>
		</tr>
		<%
		request.setCharacterEncoding("UTF-8");
		String sql = "";
		String grade = "";
		try{
			sql = "select me.custno, me.custname, me.grade, sum(mo.amount) as sum " + 
				  "from member_tbl_02 me, money_tbl_02 mo " +
				  "where me.custno = mo.custno " + 
				  "group by me.custno, me.custname, me.grade " + 
				  "order by sum desc";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				if(rs.getString(3).equals("A")) grade = "VIP";
				if(rs.getString(3).equals("B")) grade = "일반";
				else grade = "직원";
			%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=grade %></td>
				<td><%=rs.getString(4) %></td>
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