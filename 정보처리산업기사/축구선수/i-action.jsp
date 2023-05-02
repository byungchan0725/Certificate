<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String name = request.getParameter("name");
String position = request.getParameter("position");
String date = request.getParameter("date");
String team = request.getParameter("team");
String sql = "";

try{
	sql = "insert into tbl_player_20221205 values(?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, position);
	pstmt.setString(4, date);
	pstmt.setString(5, team);
	pstmt.executeUpdate();
}catch(Exception e){
	e.printStackTrace();
}
%>
<jsp:include page="list.jsp"></jsp:include>