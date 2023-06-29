<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과목별성적조회</title>
<link rel="stylehsheet" href="style.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<script type="text/javascript" src="check.js"></script>
	<section>
	<h2>과목별 성적조회</h2>
	<form name="frm2" method="post">
	<table border="1">
		<tr>
			<td>과목코드</td>
			<td><input type="text" name="subcode"></td>
			<td><input type="button" onclick="find()" value="조회"></td>
		</tr>
	</table>
	</form>
	<br><br>
	<form method="post">
	<table border="1">
		<tr>
			<td>학번</td>
			<td>성명</td>
			<td>학과</td>
			<td>과목</td>
			<td>중간</td>
			<td>기말</td>
			<td>출석</td>
			<td>레포트</td>
			<td>기타</td>
			<td>총점</td>
			<td>학점</td>
		</tr>
	<%
	request.setCharacterEncoding("UTF-8");
	String subcode=request.getParameter("subcode");
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		Statement pstmt = con.createStatement();
		String sql = String.format("select st.stuid, sname, dept_name, subname, midscore, finalscore, sttend, report, etc,TO_CHAR((midscore*0.3)+(finalscore*0.3)+(sttend*0.2)+(report*0.1)+(etc*0.1), '999.0') as num,(midscore*0.3)+(finalscore*0.3)+(sttend*0.2)+(report*0.1)+(etc*0.1) as num1 from tbl_student_202210 st, tbl_score_202210 sc, tbl_subject_202210 su where st.stuid=sc.sid and sc.subcode=su.subcode and trim(sc.subcode)='%s'",subcode);
		ResultSet rs = pstmt.executeQuery(sql);
		while(rs.next()){
			String num1= rs.getString("num1");
			float grade= Float.valueOf(num1);
			if(grade>=95) num1="A+";
			else if(grade>=90) num1="A";
			else if(grade>=85) num1="B+";
			else if(grade>=80) num1="B";
			else if(grade>=75) num1="C+";
			else if(grade>=70) num1="C";
			else if(grade>=65) num1="D+";
			else if(grade>=60) num1="D";
			else num1="F";
			%>
			<tr>
				<td><%=rs.getString("stuid") %></td>
				<td><%=rs.getString("sname") %></td>
				<td><%=rs.getString("dept_name") %></td>
				<td><%=rs.getString("subname") %></td>
				<td><%=rs.getString("midscore") %></td>
				<td><%=rs.getString("finalscore") %></td>
				<td><%=rs.getString("sttend") %></td>
				<td><%=rs.getString("report") %></td>
				<td><%=rs.getString("etc") %></td>
				<td><%=rs.getString("num") %></td>
				<td><%=num1 %></td>
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