<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표하기</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<script type="text/javascript" src="check.js"></script>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>투표하기</h2>
		<form name="frm" method="post" action="action.jsp">
			<table border="1">
				<tr>
					<td>주민번호</td>
					<td style="text-align:left;">
						<input type="text" name="no" style="width:200px"> 예)8906153154726
					</td>
				</tr>
				<tr>
					<td>성명</td>
					<td style="text-align:left;">
						<input type="text" name="name" style="width:200px">
					</td>
				</tr>
				<tr>
					<td>후보번호</td>
					<td style="text-align:left;">
					<select name="vno" style="width:200px">
						<option value=""></option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>투표시간</td>
					<td style="text-align:left;">
						<input type="text" name="vtime" style="width:200px">
					</td>
				</tr>
				<tr>
					<td>투표장소</td>
					<td style="text-align:left;">
						<input type="text" name="vplace" style="width:200px">
					</td>
				</tr>
				<tr>
					<td>유권자확인</td>
					<td style="text-align:left;">
						<input type="radio" name="r_check" value="확인">확인
						<input type="radio" name="r_check" value="미확인">미확인
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="투표하기" onclick="vot()"> &nbsp;
						<input type="button" value="다시하기" onclick="res()">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>