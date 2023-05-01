<%@page import="javax.naming.ldap.PagedResultsResponseControl"%>
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
	<h2>부서별 근무일수 집계</h2>
	<table border="1">
		<tr>
			<td>사원번호</td>
			<td>이름</td>
			<td>부서명</td>
			<td>근무일수</td>
		</tr>
		<%
		request.setCharacterEncoding("UTF-8");
		String sql = "";
		String dept = "";
		try{
			sql = "select emp.empno, emp.empname, emp.deptcode, COUNT(re.resvno) " +
				  "from tbl_emp_202108 emp, tbl_resv_202108 re " +
				  "where emp.empno = re.empno " + 
				  "group by emp.empno, emp.empname, emp.deptcode " +
				  "order by emp.deptcode ";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				if(rs.getString(3).equals("10")) dept = "영업팀";
				else if(rs.getString(3).equals("20")) dept = "총무팀";
				else dept = "구매팀";
				%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=dept %></td>
					<td><%=rs.getString(4) %></td>
				</tr>
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