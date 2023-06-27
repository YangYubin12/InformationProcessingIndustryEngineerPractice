<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참가자등수조회</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h2>참가자 등수 조회</h2>
	<form>
	<table border="1">
		<tr>
			<td>참가번호</td>
			<td>참가자명</td>
			<td>총점</td>
			<td>평균</td>
			<td>등수</td>
		</tr>
	<%
	request.setCharacterEncoding("UTF-8");
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		String sql ="SELECT po.artist_id, artist_name, SUM(score), TO_CHAR(avg(score),'99.99'), RANK() over(order by sum(score) desc) " +
					"FROM tbl_artist_201905 ar, tbl_point_201905 po " +
					"WHERE ar.artist_id = po.artist_id " +
					"GROUP BY po.artist_id, artist_name";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			%>
			<tr>
				<td> <%=rs.getString(1) %> </td>
				<td> <%=rs.getString(2) %> </td>
				<td> <%=rs.getString(3) %> </td>
				<td> <%=rs.getString(4) %> </td>
				<td> <%=rs.getString(5) %> </td>
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