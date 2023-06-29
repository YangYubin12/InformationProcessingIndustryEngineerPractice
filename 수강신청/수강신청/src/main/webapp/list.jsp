<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교과목목록</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2>교과목 목록</h2>
<form>
<table border="1">
	<tr>
		<td>과목코드</td>
		<td>과목명</td>
		<td>학점</td>
		<td>담당강사</td>
		<td>요일</td>
		<td>시작시간</td>
		<td>종료시간</td>
		<td>삭제</td>
	</tr>
<%
request.setCharacterEncoding("UTF-8");
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	String sql = "select id, co.name, credit, le.name, week, start_hour, end_hour " +
				"from lecturer_tbl le, course_tbl co " +
				"where co.lecturer = le.idx " +
				"order by id ";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		String week = rs.getString(5);
		switch(week){
		case "1":
			week = "월요일";
			break;
		case "2":
			week = "화요일";
			break;
		case "3":
			week= "수요일";
			break;
		case "4":
			week = "수요일";
			break;
		case "5":
			week = "목요일";
			break;
		}
		String start_hour = rs.getString(6);
		while(start_hour.length()<4){
			start_hour = "0" + start_hour;
		}
		String start = start_hour.substring(0,2) + "시" + start_hour.substring(2,4) + "분";
		String end_hour = rs.getString(7);
		while(end_hour.length()<4){
			end_hour = "0" + end_hour;
		}
		String end = end_hour.substring(0,2) + "시" + end_hour.substring(2,4) + "분";
		%>
		<tr>
			<td><a href="modify.jsp?id=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getInt(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=week %></td>
			<td><%=start %></td>
			<td><%=end %></td>
			<td><a href="action.jsp?id=<%=rs.getString(1) %>&mode=delete">삭제</a></td>
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