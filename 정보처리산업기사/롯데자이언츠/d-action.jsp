<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="dbconn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String pid = request.getParameter("pid");
String sql = "";

try{
	sql = "delete from giants_player where pid=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, pid);
	pstmt.executeUpdate();
}catch(Exception e){
	e.printStackTrace();
}
%>
<jsp:forward page = "list.jsp"></jsp:forward>