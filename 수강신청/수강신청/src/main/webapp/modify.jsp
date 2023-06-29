<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교과목수정</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<script type="text/javascript" src="check.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2>교과목 수정</h2>
<form name="frm" action="action.jsp" method="get">
<input type="hidden" name="mode" value="modify">
<table border="1">
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String name = "";
String credit = "";
String lecturer = "";
String week = "";
String start_hour = "";
String end_hour = "";
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	String sql = "select * " +
				"from course_tbl " +
				"where trim(id)=? " ;
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	
	name = rs.getString(2);
	credit = rs.getString(3);
	lecturer = rs.getString(4);
	week = rs.getString(5);
	start_hour = rs.getString(6);
	while(start_hour.length()<4){
		start_hour = "0" + start_hour;
	}
	end_hour = rs.getString(7);
	while(end_hour.length()<4){
		end_hour = "0" + end_hour;
	}
}
catch(Exception e){
	e.printStackTrace();
}
%>
	<tr>
		<td>과목코드</td>
		<td><input type="text" name="id" style="width:98%" value="<%=id %>" readonly>
	</tr>
	<tr>
		<td>과목명</td>
		<td><input type="text" name="name" style="width:98%" value="<%=name %>" >
	</tr>
	<tr>
		<td>학점</td>
		<td><input type="text" name="credit" style="width:98%" value="<%=credit %>" >
	</tr>
	<tr>
		<td>담당강사</td>
		<td>
			<select name="lecturer" style="width:98%">
				<option value="">담당강사</option>
				<option value="1" <%if(lecturer.equals("1")) out.println("selected"); %> >김교수 </option>
				<option value="2" <%if(lecturer.equals("2")) out.println("selected"); %> >이교수 </option>
				<option value="3" <%if(lecturer.equals("3")) out.println("selected"); %> >박교수 </option>
				<option value="4" <%if(lecturer.equals("4")) out.println("selected"); %> >우교수 </option>
				<option value="5" <%if(lecturer.equals("5")) out.println("selected"); %> >최교수 </option>
				<option value="6" <%if(lecturer.equals("6")) out.println("selected"); %> >임교수 </option>
			</select>
		</td>
	</tr>
	<tr>
		<td>요일</td>
		<td>
			<input type="radio" name="week" value="1" <% if(week.equals("1")) out.println("checked"); %>> 월
			<input type="radio" name="week" value="2" <% if(week.equals("2")) out.println("checked"); %>> 화
			<input type="radio" name="week" value="3" <% if(week.equals("3")) out.println("checked"); %>> 수
			<input type="radio" name="week" value="4" <% if(week.equals("4")) out.println("checked"); %>> 목
			<input type="radio" name="week" value="5" <% if(week.equals("5")) out.println("checked"); %>> 금
		</td>
	</tr>
	<tr>
		<td>시간 시간</td>
		<td><input type="text" name="start_hour" style="width:98%" value="<%=start_hour %>"></td>
	</tr>
	<tr>
		<td>종료 시간</td>
		<td><input type="text" name="end_hour" style="width:98%" value="<%=end_hour %>"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="수정" onclick="modify()">&nbsp;&nbsp;&nbsp;
			<input type="button" value="취소" onclick="res()">
		</td>
	</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>