<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근무좌석예약</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<script type="text/javascript" src="check.js"></script>
	<jsp:include page="header.jsp" />
	<section>
		<h2>근무좌석예약</h2>
		<form name="frm" action="action.jsp">
			<table border="1">
				<tr>
					<td>예약번호</td>
					<td class="l2"><input type="text" name="resvno"> 예)20210001 </td>
				</tr>
				<tr>
					<td>사원번호</td>
					<td class="l2"><input type="text" name="empno"> 예)1001 </td>
				</tr>
				<tr>
					<td>근무일자</td>
					<td class="l2"><input type="text" name="resvdate"> 예)202111231 </td>
				</tr>
				<tr>
					<td>좌석번호</td>
					<td class="l2"><input type="text" name="seatno"> 예)S001~S009 </td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="등록" onclick="addCheck()">&nbsp;&nbsp;
						<input type="button" value="다시쓰기" onclick="res()">
					</td>
				</tr>

			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>