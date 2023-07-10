<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사매출현황</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>강사매출현황</h2>
		<form>
			<table border="1">
				<tr>
					<td style="width:150px">강사코드</td>
					<td style="width:150px">강의명</td>
					<td style="width:150px">강사명</td>
					<td style="width:150px">총매출</td>
				</tr>
				<%
				request.setCharacterEncoding("UTF-8");
				try{
					Class.forName("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
					String sql="select cl.teacher_code, class_name, teacher_name,sum(tuition) " +
							   "from tbl_teacher_202201 te, tbl_class_202201 cl " +
							   "where te.teacher_code= cl.teacher_code " +
							   "group by cl.teacher_code,teacher_name,class_name " +
							   "order by cl.teacher_code";
						PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					while(rs.next()){
						int salary = rs.getInt(4);
						String price = rs.getString(4).substring(0,3)+","+rs.getString(4).substring(3,6);
						
						%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td>₩ <%=price %></td>
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