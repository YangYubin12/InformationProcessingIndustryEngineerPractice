<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록조회/수정</title>
<link rel="stylesheet" href="style.css" >
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2>회원목록조회/수정</h2>
<form>
<table border="1">
	<tr>
		<td> 회원번호 </td>
		<td> 회원성명 </td>
		<td> 전화번호 </td>
		<td> 주소 </td>
		<td> 가입일자 </td>
		<td> 고객등급 </td>
		<td> 거주지역 </td>
	</tr>
<%
request.setCharacterEncoding("UTF-8");
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	String sql = "SELECT custno, custname, phone, address, grade, grade, city " +
		   "FROM member_tbl_02 " +
		   "ORDER BY custno";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()) {
		String grade = rs.getString(6);
		switch(grade) {
		case "A":
			grade = "VIP";
			break;
		case "B":
			grade = "일반";
			break;
		case "C":
			grade = "직원";
			break;
		}
		%>
		<tr>
			<td><a href="modify.jsp?mod_custno=<%=rs.getString(1)%>"> <%=rs.getString(1) %> </a> </td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=grade %></td>
			<td><%=rs.getString(7) %></td>
		</tr>
		<%
	}	
}
catch (Exception e) {
	e.printStackTrace();
}
%>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>