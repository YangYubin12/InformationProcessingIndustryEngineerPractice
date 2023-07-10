<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보조회</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>회원정보조회</h2>
		<form>
			<table border="1">
				<tr>
					<td style="width:150px">수강월</td>
					<td style="width:150px">회원번호</td>
					<td style="width:150px">회원명</td>
					<td style="width:150px">강의명</td>
					<td style="width:150px">강의장소</td>
					<td style="width:150px">수강료</td>
					<td style="width:150px">등급</td>
				</tr>
				<%
				request.setCharacterEncoding("UTF-8");
				try{
					Class.forName("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
					String sql="select regist_month, cl.c_no, c_name, class_name, class_area, tuition, grade " +
								"from tbl_teacher_202201 te, tbl_member_202201 me, tbl_class_202201 cl " +
								"where te.teacher_code=cl.teacher_code and me.c_no=cl.c_no " +
								"order by cl.c_no" ;
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					while(rs.next()){
						String resist_month=rs.getString(1);
						String month = resist_month.substring(0,4) + "년" + 
										resist_month.substring(4,6) + "월";
						int tuition = rs.getInt(6);
						String price = rs.getString(6).substring(0,3)+","+rs.getString(6).substring(3,6);
						%>
				<tr>
					<td><%=month%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td>₩ <%=price %></td>
					<td><%=rs.getString(7)%></td>
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