<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	String name = request.getParameter("name");
	String vno = request.getParameter("vno");
	String vtime = request.getParameter("vtime");
	String vplace = request.getParameter("vplace");
	String r_check = request.getParameter("r_check");
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		String sql ="insert into tbl_vote_202005 values(?, ?, ?, ?, ?, ?) ";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, no);
		pstmt.setString(2, name);
		pstmt.setString(3, vno);
		pstmt.setString(4, vtime);
		pstmt.setString(5, vplace);
		pstmt.setString(6, r_check);	
		pstmt.executeUpdate();	
		con.commit();
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>
	
<jsp:forward page="index.jsp"></jsp:forward>