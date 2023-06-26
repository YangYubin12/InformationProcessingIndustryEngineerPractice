<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action</title>
</head>
<body>
		<%
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		request.setCharacterEncoding("UTF-8");
		String mode = request.getParameter("mode");
		String custno = request.getParameter("custno");
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
		String joindate = request.getParameter("joindate");
		System.out.println(mode);
		System.out.println(custno);
		System.out.println(custname);
		System.out.println(phone);
		System.out.println(address);
		System.out.println(grade);
		System.out.println(city);
		System.out.println(joindate);
		try{
		String sql = "";
		PreparedStatement pstmt = null;
		switch(mode){
		case "insert":
			sql = "INSERT INTO member_tbl_02 values(?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, custno);
			pstmt.setString(2, custname);
			pstmt.setString(3, phone);
			pstmt.setString(4, address);
			pstmt.setString(5, joindate);
			pstmt.setString(6, grade);
			pstmt.setString(7, city);
			pstmt.executeUpdate();
		%>
			<jsp:forward page="./insert.jsp"></jsp:forward>
		<% 		
			break;
			case "modify":
			sql = "UPDATE member_tbl_02 SET custname=?, phone=?, address=?, grade=?, joindate=?, city=? " +
      		"WHERE custno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, custname);
			pstmt.setString(2, phone);
			pstmt.setString(3, address);
			pstmt.setString(4, grade);
			pstmt.setString(5, joindate);
			pstmt.setString(6, city);	
			pstmt.setString(7, custno);
			pstmt.executeUpdate();
		%>
			<jsp:forward page="./list.jsp"></jsp:forward>
		<% 
			break;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		%>
</body>
</html>