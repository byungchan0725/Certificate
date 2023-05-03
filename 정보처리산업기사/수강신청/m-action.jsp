<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String name = request.getParameter("name");
String credit = request.getParameter("credit");
String lecturer = request.getParameter("lecturer");
String week = request.getParameter("week");
String start_hour = request.getParameter("start_hour");
String end_hour = request.getParameter("end_hour");
String sql = "";
try{
	sql = "update course_tbl " + 
 		  "set name=?, credit=?, lecturer=?, week=?, start_hour=?, end_hour=? " +
		  "where id=? ";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, credit);
	pstmt.setString(3, lecturer);
	pstmt.setString(4, week);
	pstmt.setString(5, start_hour);
	pstmt.setString(6, end_hour);
	pstmt.setString(7, id);
	pstmt.executeUpdate();
}catch(Exception e){
	e.printStackTrace();
}
%>
<jsp:forward page="list.jsp"/>