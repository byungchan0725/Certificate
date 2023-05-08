<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="check.js"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h2>선수 등록</h2>
	<form name="frm" method="post" action="m-action.jsp">
		<table border="1">
		<% 
		request.setCharacterEncoding("UTF-8");
		String pid = request.getParameter("pid");
		
		String position = "";
		String sql = "";
		
		try{
			sql = "select * from giants_player where pid=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pid);
			pstmt.executeUpdate();
			ResultSet rs = pstmt.executeQuery();
			rs.next();
		%>
			<tr>
				<td>선수번호</td>
				<td><input type="text" name="pid" value="<%=rs.getString(1) %>" readonly></td>
			</tr>
			<tr>
				<td>선수이름</td>
				<td><input type="text" name="pname" value="<%=rs.getString(2) %>"></td>
			</tr>
			<tr>
				<td>선수포지션</td>
				<td>
					<select name="pposition">
						<option value="">포지션 선택</option>
						<option value="투수" <%if(rs.getString(3).equals("투수")) out.print("selected"); %>>투수</option>
						<option value="내야수" <%if(rs.getString(3).equals("내야수")) out.print("selected"); %>>내야수</option>
						<option value="외야수" <%if(rs.getString(3).equals("외야수")) out.print("selected"); %>>외야수</option>
						<option value="포수" <%if(rs.getString(3).equals("포수")) out.print("selected"); %>>포수</option>
					</select> 
				</td>
			</tr>
			<tr>
				<td>선수등록일</td>
				<td><input type="text" name="pdate" value="<%=rs.getString(4) %>"></td>
			</tr>
			<tr>
				<td>선수등급</td>
				<td>
					<input type="radio" name="pgrade" value="S" <%if(rs.getString(5).equals("S")) out.print("checked"); %>>S
					<input type="radio" name="pgrade" value="A" <%if(rs.getString(5).equals("A")) out.print("checked"); %>>A
					<input type="radio" name="pgrade" value="B" <%if(rs.getString(5).equals("B")) out.print("checked"); %>>B
					<input type="radio" name="pgrade" value="C" <%if(rs.getString(5).equals("C")) out.print("checked"); %>>C
				</td>
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