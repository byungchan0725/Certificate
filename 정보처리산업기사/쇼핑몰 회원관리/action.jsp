<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String mode = request.getParameter("mode");
String custno = request.getParameter("custno");
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("grade");
String city = request.getParameter("city");
try {
    String sql = "";
    switch(mode){
    case "insert":
        sql = "insert into tbl_member_202205 values(?,?,?,?,TO_DATE(?, 'yyyy-mm-dd'),?,?)";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, custno);
        pstmt.setString(2, custname);
        pstmt.setString(3, phone);
        pstmt.setString(4, address);
        pstmt.setString(5, joindate);
        pstmt.setString(6, grade);
        pstmt.setString(7, city);
        pstmt.executeUpdate();
        %>
            <jsp:forward page="list.jsp"/>
        <%
        break;
    case "modify":
        sql = "update tbl_member_202205 set custname=?, phone=?, address=?, joindate=TO_DATE(?, 'yyyy-mm-dd'), grade=?, city=? where custno=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, custname);
        pstmt.setString(2, phone);
        pstmt.setString(3, address);
        pstmt.setString(4, joindate);
        pstmt.setString(5, grade);
        pstmt.setString(6, city);
        pstmt.setString(7, custno);
        pstmt.executeUpdate();
        %>
        <jsp:forward page="list.jsp"/>
        <%
        break;
    }
} catch (Exception e){
    e.printStackTrace();
    out.println(e.getMessage());
}
%>
</body>
</html>
