<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ include file="dbconn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String sql = "";
try{
	sql = "delete from course_tbl where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.executeUpdate();
}catch(Exception e){
	e.printStackTrace();
}
%>
<jsp:forward page="list.jsp"/>