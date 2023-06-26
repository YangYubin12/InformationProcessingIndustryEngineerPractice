<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈쇼핑회원정보수정</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="check.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>홈쇼핑 회원 정보 수정</h2>
		<form name="frm" action="action.jsp" method="get">
			<input type="hidden" name="mode" value="modify">
			<table border="1">
				<%
				request.setCharacterEncoding("UTF-8");
				String mod_custno = request.getParameter("mod_custno");
				String custname = "";
				String phone = "";
				String address = "";
				String joindate = "";
				String grade = "";
				String city = "";
				try {
					Class.forName("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
					String sql = "SELECT custno, custname, phone, address, joindate, grade, city " + "FROM member_tbl_02 "
					+ "WHERE custno = " + mod_custno;
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					rs.next();
					mod_custno = rs.getString(1);
					custname = rs.getString(2);
					phone = rs.getString(3);
					address = rs.getString(4);
					joindate = rs.getString(5);
					joindate = joindate.substring(0, 10);
					joindate = joindate.substring(0, 4)+joindate.substring(5, 7)+joindate.substring(8, 10);
					grade = rs.getString(6);
					city = rs.getString(7);
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>
				<tr>
					<td>회원번호</td>
					<td><input type=text name="custno" value="<%=mod_custno%>"readonly></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type=text name="custname" value="<%=custname%>"></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone" value="<%=phone%>"></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type=text name="address" value="<%=address%>"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type=text name="joindate" value="<%=joindate%>"></td>
				</tr>
				<tr>
					<td>고객등급[A:VIP, B:일반, C:직원]</td>
					<td><input type=text name="grade" value="<%=grade%>"></td>
				</tr>
				<tr>
					<td>도시</td>
					<td><input type=text name="city" value="<%=city%>"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="수정" onclick="modify()"> &nbsp;&nbsp; 
					<input type="button" value="조회" onclick="search()"></td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>