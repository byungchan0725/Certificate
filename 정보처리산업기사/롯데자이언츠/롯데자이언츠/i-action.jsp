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
	sql = "insert into giants_player values(?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, pid);
	pstmt.setString(2, pname);
	pstmt.setString(3, pposition);
	pstmt.setString(4, pdate);
	pstmt.setString(5, pgrade);
	pstmt.executeUpdate();
}catch(Exception e){
	e.printStackTrace();
}
%>
<jsp:forward page = "list.jsp"></jsp:forward>