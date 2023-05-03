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
<script type="text/javascript" src="check.js"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h2>교과목 수정</h2>
	<form name="frm" action="m-action.jsp" method="post">
		<table border="1">
		<%
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String sql = "";
		String s_time = "";
		try{
			sql = "select * from course_tbl where id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			
			if(s_time.length() == 0){
				s_time = "0"+rs.getString(6);
			}
		%>
			<tr>
				<td>과목코드</td>
				<td><input type="text" name="id" value="<%=id %>"></td>  
			</tr>
			<tr>
				<td>과목명</td>
				<td><input type="text" name="name" value="<%=rs.getString(2) %>"></td>
			</tr>
			<tr>
				<td>학점</td>
				<td><input type="text" name="credit" value="<%=rs.getString(3) %>"></td>
			</tr>
			<tr>
				<td>담당강사</td>
				<td>
					<select name="lecturer">
						<option value="">담당강사선택</option>
						<option value="1" <%if(rs.getString(4).equals("1")) out.println("selected"); %>>김교수</option>
						<option value="2" <%if(rs.getString(4).equals("2")) out.println("selected"); %>>이교수</option>
						<option value="3" <%if(rs.getString(4).equals("3")) out.println("selected"); %>>박교수</option>
						<option value="4" <%if(rs.getString(4).equals("4")) out.println("selected"); %>>우교수</option>
						<option value="5" <%if(rs.getString(4).equals("5")) out.println("selected"); %>>최교수</option>
						<option value="6" <%if(rs.getString(4).equals("6")) out.println("selected"); %>>임교수</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>요일</td>
				<td>
					<input type="radio" name="week" value="1" <%if(rs.getString(5).equals("1")) out.println("checked"); %>>월
					<input type="radio" name="week" value="2" <%if(rs.getString(5).equals("2")) out.println("checked"); %>>화
					<input type="radio" name="week" value="3" <%if(rs.getString(5).equals("3")) out.println("checked"); %>>수
					<input type="radio" name="week" value="4" <%if(rs.getString(5).equals("4")) out.println("checked"); %>>목
					<input type="radio" name="week" value="5" <%if(rs.getString(5).equals("5")) out.println("checked"); %>>금
				</td>
			</tr>
			<tr>
				<td>시작시간</td>
				<td><input type="text" name="start_hour" value="<%=s_time %>"></td>
			</tr>
			<tr>
				<td>종료시간</td>
				<td><input type="text" name="end_hour" value="<%=rs.getString(7) %>"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" onclick="return edit()">
					<input type="button" value="취소" onclick="rreset()">
				</td>
			</tr>
			<%
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