<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String mode = request.getParameter("mode");
String artist_id = request.getParameter("artist_id");
String artist_name = request.getParameter("artist_name");
String bir1 = request.getParameter("bir1");
String bir2 = request.getParameter("bir2");
String bir3 = request.getParameter("bir3");
String birth = bir1 + bir2 + bir3;
String gender = request.getParameter("gender");
String talent = request.getParameter("talent");
String agency = request.getParameter("agency");

String sql = "";
try{
		sql = "insert into tbl_artist_201905 values(?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, artist_id);
		pstmt.setString(2, artist_name);
		pstmt.setString(3, birth);
		pstmt.setString(4, gender);
		pstmt.setString(5, talent);
		pstmt.setString(6, agency);
		pstmt.executeUpdate();
		%>
		<jsp:forward page="list1.jsp"></jsp:forward>
		<%
}catch(Exception e){
	e.printStackTrace();
}
%>