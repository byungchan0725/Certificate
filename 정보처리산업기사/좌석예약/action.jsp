<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
String mode = request.getParameter("mode");
String resvno = request.getParameter("resvno");
String empno = request.getParameter("empno");
String resvdate = request.getParameter("resvdate");
String seatno = request.getParameter("seatno");
String sql = "";

request.setCharacterEncoding("UTF-8");

PreparedStatement pstmt = null;

try{
	switch(mode){
	case "search":
		sql = "select * from tbl_emp_202108 where empno=? ";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, empno);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			empno = rs.getString(1);
			%>
			<jsp:forward page="list2.jsp"></jsp:forward>
			<%
		}
		else{
			%>
			<jsp:forward page="fail.jsp"></jsp:forward>	
			<%
		}
	case "insert":
		sql = "insert into tbl_resv_202108 values(?, ?, ?, ?) ";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, resvno);
		pstmt.setString(2, empno);
		pstmt.setString(3, resvdate);
		pstmt.setString(4, seatno);
		pstmt.executeUpdate();
		%>
		<jsp:forward page="list.jsp"></jsp:forward>
		<%
	}
}catch(Exception e){
	e.printStackTrace();
}
%>