<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
String sid = request.getParameter("sid");
String subcode = request.getParameter("subcode");
String midscore = request.getParameter("midscore");
String finalscore = request.getParameter("finalscore");
String sttend = request.getParameter("sttend");
String report = request.getParameter("report");
String etc = request.getParameter("etc");
System.out.println(sid);
System.out.println(subcode);
System.out.println(midscore);
System.out.println(finalscore);
System.out.println(sttend);
System.out.println(report);
System.out.println(etc);
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	String sql = "insert into tbl_score_202210 values(?,?,?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, sid);
	pstmt.setString(2, subcode);
	pstmt.setInt(3, Integer.parseInt(midscore));
	pstmt.setInt(4, Integer.parseInt(finalscore));
	pstmt.setInt(5, Integer.parseInt(sttend));
	pstmt.setInt(6, Integer.parseInt(report));
	pstmt.setInt(7, Integer.parseInt(etc));
	pstmt.executeUpdate();
}
catch(Exception e){
	e.printStackTrace();
}
%>
<jsp:forward page="insert.jsp"></jsp:forward>