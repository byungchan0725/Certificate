<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String name = request.getParameter("name");

String d1 = request.getParameter("y");
String d2 = request.getParameter("m"); 
String d3 = request.getParameter("d");
String birth = d1 + d2 + d3;

String gender = request.getParameter("gender");
String talent = request.getParameter("talent");
String agency = request.getParameter("agency");

String sql = "";

try{
	sql = "insert into tbl_artist_201905 values(?,?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, birth);
	pstmt.setString(4, gender);
	pstmt.setString(5, talent);
	pstmt.setString(6, agency);
	pstmt.executeUpdate();
	%>
	<jsp:forward page="list.jsp"></jsp:forward>
	<%
	
	} catch(Exception e){
		e.printStackTrace();
}
%>