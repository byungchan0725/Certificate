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
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h2>교과목 목록</h2>
	<table border="1">
		<tr>
			<td>과목코드</td>
			<td>과목명</td>
			<td>학점</td>
			<td>담당강사</td>
			<td>요일</td>
			<td>시작시간</td>
			<td>종료시간</td>
			<td>삭제</td>
		</tr>
		<%
		request.setCharacterEncoding("UTF-8");
		
		String sql = "";
		String week = "";
		String lecturer = "";
		
		try{
			sql = "SELECT * " + 
				  "from course_tbl " + 
				  "order by id";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				if(rs.getString(4).equals("1")) lecturer = "김교수";
				else if(rs.getString(4).equals("2")) lecturer = "이교수";
				else if(rs.getString(4).equals("3")) lecturer = "박교수";
				else if(rs.getString(4).equals("4")) lecturer = "우교수";
				else if(rs.getString(4).equals("5")) lecturer = "최교수";
				else lecturer = "임교수";
				
				if(rs.getString(5).equals("1")) week = "월요일";
				else if(rs.getString(5).equals("2")) week = "화요일";
				else if(rs.getString(5).equals("3")) week = "수요일";
				else if(rs.getString(5).equals("4")) week = "목요일";
				else week = "금요일";
				
				String s_time = rs.getString(6);
				if(s_time.length() == 3){
					s_time = "0"+s_time;
				}
				
				String e_time = rs.getString(7);
				if(e_time.length() == 3){
					e_time = "0"+e_time;
				}
				
				%>
				<tr>
					<td><a href="modify.jsp?id=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=lecturer %></td>
					<td><%=week %></td>
					<td><%=s_time.substring(0,2)+"시"+s_time.substring(2,4)+"분" %></td>
					<td><%=e_time.substring(0,2)+"시"+e_time.substring(2,4)+"분" %></td>
					<td><a href="d-action.jsp?id=<%=rs.getString(1) %>">삭제</a></td>
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