<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
String empno = request.getParameter("empno");
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	String sql = "SELECT * " + 
		   "FROM tbl_emp_202108 " + 
		   "WHERE empno=? ";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, empno);
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()) {
		empno = rs.getString(1);
		%>
		<jsp:forward page="success.jsp"></jsp:forward>
		<%
	}
	else {
		%>
		<jsp:forward page="fail.jsp"></jsp:forward>
		<%
	}
}
catch (Exception e) {
	e.printStackTrace();
}
%>