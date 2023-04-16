<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%@page import="java.sql.*"%>
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
	<h2><b>회원매출조회</b></h2>
	<form>
		<table>
			<tr>
				<td>회원번호</td>	
				<td>회원성명</td>
				<td>고객등급</td>
				<td>매출</td>
			</tr>
			<%
			request.setCharacterEncoding("UTF-8");
			String grade = "";
			try{
				Statement stmt = con.createStatement();
				String sql = "select me.custno, me.custname, me.grade, sum(mo.price) price  " +
							 "from tbl_member_202205 me, tbl_money_202205 mo  " + 
							 "where me.custno = mo.custno  " + 
							 "group by me.custno, me.custname, me.grade  " + 
							 "order by sum(mo.price) desc";
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
					grade = rs.getString("grade");
					switch(grade){
					case "A":
						grade = "VIP";
						break;
					case "B":
						grade = "일반";
						break;
					case "C":
						grade = "직원";
					}
				%>
					<tr>
						<td><%=rs.getString("custno") %></td>
						<td><%=rs.getString("custname") %></td>
						<td><%=grade %></td>
						<td><%=rs.getString("price") %></td>
					</tr>
				<%
				}
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