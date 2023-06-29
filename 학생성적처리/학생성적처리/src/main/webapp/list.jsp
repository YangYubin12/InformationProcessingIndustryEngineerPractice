<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생성적처리프로그램</title>
<link rel="stylehsheet" href="style.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h2>학생정보현황</h2>
	<form>
	<table border="1">
		<tr>
			<td>학번</td>
			<td>이름</td>
			<td>주민번호</td>
			<td>학과명</td>
			<td>성별</td>
			<td>전화번호</td>
			<td>이메일</td>
		</tr>
	<%
	request.setCharacterEncoding("UTF-8");
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		String sql = "select stuid, sname, jumin, dept_name, jumin, phone, email " +
					"from tbl_student_202210 ";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			String jumin = rs.getString(3);
			String jumin2 = jumin.substring(0,6) + "-" + jumin.substring(6,13);
			String gender = jumin.substring(6,7);
			if(gender.equals("3")) gender="남자";
			else if(gender.equals("4")) gender="여자";
			%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=jumin2 %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=gender %></td>
				<td><%=rs.getString(6) %></td>
				<td><%=rs.getString(7) %></td>
			</tr>
			<%
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
	%>
	</table>
	</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>