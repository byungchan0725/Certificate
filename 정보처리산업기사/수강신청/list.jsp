<%@page import="java.sql.*"%>
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
	<h2><b>교과목 목록</b></h2>
	<form>
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
			String week = "";
			String lecturer = "";
			String start, s_time;
			String end, e_time;
			
			String sql = "";
			try{
				sql = "select * from course_tbl order by(id)";
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()){
					if(rs.getString("week").equals("1")) week = "월요일";
					else if(rs.getString("week").equals("2")) week = "화요일";
					else if(rs.getString("week").equals("3")) week = "수요일";
					else if(rs.getString("week").equals("4")) week = "목요일";
					else week = "금요일";
					
					if(rs.getString("lecturer").equals("1")) lecturer = "김교수";
					else if(rs.getString("lecturer").equals("2")) lecturer = "이교수";
					else if(rs.getString("lecturer").equals("3")) lecturer = "박교수";
					else if(rs.getString("lecturer").equals("4")) lecturer = "우교수";
					else if(rs.getString("lecturer").equals("5")) lecturer = "최교수";
					else lecturer = "임교수";
					
					start = rs.getString("start_hour");
					if(start.length() == 3){
						start = "0" + start;
					}
					s_time = start.substring(0,2) + "시" + start.substring(2, 4) + "분";
					
					end = rs.getString("end_hour");
					if(end.length() == 3){
						end = "0" + start;
					}
					e_time = end.substring(0,2) + "시" + end.substring(2, 4) + "분";
					
					
					
					%>
					<tr>
						<td>
							<a href="modify.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("id") %></a>
						</td>
						<td><%=rs.getString("name") %></td>
						<td><%=rs.getString("credit") %></td>
						<td><%=lecturer %></td>
						<td><%=week %></td>
						<td><%=s_time %></td>
						<td><%=e_time %></td>
						<td>
							<a href="action.jsp?id=<%=rs.getString("id")%>&mode=delete">삭제</a>
						</td>
					</tr>
					<%
				}
			} catch (Exception e){
				e.printStackTrace();
			}
			%>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>