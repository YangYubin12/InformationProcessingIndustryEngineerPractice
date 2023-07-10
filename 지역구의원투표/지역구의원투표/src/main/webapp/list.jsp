<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보조회</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>후보조회</h2>
		<form>
			<table border="1">
				<tr>
					<td>후보번호</td>
					<td>성명</td>
					<td>소속정당</td>
					<td>학력</td>
					<td>주민번호</td>
					<td>지역구</td>
					<td>대표전화</td>
				</tr>
				<%
				request.setCharacterEncoding("UTF-8");
				try{
					Class.forName("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
					String sql="select m.m_no, m.m_name, p.p_name, m.p_school, m.m_jumin, m_city, p_tel1, p_tel2, p_tel3 " +
							"from tbl_member_202205 m, tbl_party_202005 p where m.p_code = p.p_code";
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					while(rs.next()){
						String jumin = rs.getString("m_jumin");
						String school = rs.getString("p_school");
						switch (school) {
							case "1":
								school = "고졸";
								break;
							case "2":
								school = "학사";
								break;
							case "3":
								school = "석사";
								break;
							case "4":
								school = "박사";
								break;
						}						
						%>
				<tr>
					<td><%=rs.getString("m_no")%></td>
					<td><%=rs.getString("m_name")%></td>
					<td><%=rs.getString("p_name")%></td>
					<td><%=school%></td>
					<td><%=jumin.substring(0, 6)%>-<%=jumin.substring(6, 13)%></td>
					<td><%=rs.getString("m_city")%></td>
					<td><%=rs.getString("p_tel1")%>-<%=rs.getString("p_tel2")%>-<%=rs.getString("p_tel3")%></td>
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