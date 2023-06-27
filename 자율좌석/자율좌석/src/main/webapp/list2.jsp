<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서별 근무일수 집계</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<h2>부서별 근무일수 집계</h2>
		<form>
			<table border=1>
				<tr>
					<td>사원번호</td>
					<td>이름</td>
					<td>부서명</td>
					<td>근무일수</td>
				</tr>
				<%
				request.setCharacterEncoding("UTF-8");
				try {
					Class.forName("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
					String sql = "SELECT em.empno, empname, deptcode, count(resvno) "+ 
								"FROM tbl_emp_202108 em, tbl_resy_202108 re "+ 			
								"WHERE em.empno=re.empno AND deptcode=10 " + 
								"GROUP BY em.empno, empname, deptcode " + 
								"ORDER BY deptcode ";
					PreparedStatement pstmt = con.prepareStatement(sql);
					
					ResultSet rs = pstmt.executeQuery();
					while (rs.next()) {
						String deptcode = rs.getString(3);
						if (deptcode.equals("10"))
							deptcode = "영업팀";
						else if (deptcode.equals("20"))
							deptcode = "총무팀";
						else if (deptcode.equals("30"))
							deptcode = "구매팀";
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=deptcode%></td>
					<td><%=rs.getString(4)%></td>
				</tr>
				<%
				}
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>