<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
<link rel="stylesheet" href="style.css" >
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2> <b>회원매출조회</b> </h2>
<form>
<table border="1">
	<tr>
		<td>회원번호</td>
		<td>회원성명</td>
		<td>고객등급</td>
		<td>매출</td>
	</tr>
	<%
	request.setCharacterEncoding("UTF-8");

	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		String sql = "SELECT me.custno, me.custname, me.grade, sum(mo.price) as total " +
	    	         "FROM member_tbl_02 me, money_tbl_02 mo " +
		   			"WHERE me.custno = mo.custno " + 
		   			"GROUP BY me.custno,me.custname, me.grade " +
		   			"ORDER BY sum(mo.price) desc";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			String grade = rs.getString(3);
			switch(grade){
				case "A":
					grade ="VIP";
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
				<td><%= rs.getString(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= grade %></td>
				<td><%= rs.getString(4) %></td>
			</tr>
            <% 		
		}
	}catch(Exception e){
		e.printStackTrace();
	}

	%>				
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>