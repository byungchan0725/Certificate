<%@page import="java.sql.PreparedStatement"%>
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
	<%
	String empno = request.getParameter("empno");
	request.setCharacterEncoding("UTF-8");
	%>
	<h2>사원번호:<%=empno %>님의 좌석예약조회</h2>
	<table border="1">
		<tr>
			<td>사원번호</td>
			<td>이름</td>
			<td>근무일자</td>
			<td>좌석번호</td>
			<td>좌석위치</td>
			<td>내선번호</td>
		</tr>
		<%
		String sql = "";
		try{
			sql = "select emp.empno, emp.empname, re.resvdate, re.seatno, se.office, se.callno " +
				  "from tbl_emp_202108 emp, tbl_seat_202108 se, tbl_resv_202108 re " +
				  "where re.seatno = se.seatno and emp.empno = re.empno and re.empno = ? " +
				  "order by seatno ";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, empno);
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