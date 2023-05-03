<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String jumin = request.getParameter("jumin");
String name = request.getParameter("name");
String m_no = request.getParameter("m_no");
String v_time = request.getParameter("v_time");
String v_area = request.getParameter("v_area");
String v_confirm = request.getParameter("v_confirm");
String sql = "";
try{
	sql = "insert into tbl_vote_202005 values(?,?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareCall(sql);
	pstmt.setString(1, jumin);
	pstmt.setString(2, name);
	pstmt.setString(3, m_no);
	pstmt.setString(4, v_time);
	pstmt.setString(5, v_area);
	pstmt.setString(6, v_confirm);
	pstmt.executeUpdate();
}catch(Exception e){
	e.printStackTrace();
}
%>
<jsp:forward page="list2.jsp"></jsp:forward>