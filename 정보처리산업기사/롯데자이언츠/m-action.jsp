<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="dbconn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String pid = request.getParameter("pid");
String pname = request.getParameter("pname");
String pposition = request.getParameter("pposition");
String pdate = request.getParameter("pdate");
String pgrade = request.getParameter("pgrade");
String sql = "";

try{
	sql = "UPDATE giants_player " + 
		  "SET pname=?, pposition=?, pdate=?, pgrade=? " + 
		  "where pid=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, pname);
	pstmt.setString(2, pposition);
	pstmt.setString(3, pdate);
	pstmt.setString(4, pgrade);
	pstmt.setString(5, pid);
	pstmt.executeUpdate();
}catch(Exception e){
	e.printStackTrace();
}
%>
<jsp:forward page = "list.jsp"></jsp:forward>