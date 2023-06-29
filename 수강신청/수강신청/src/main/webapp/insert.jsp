<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교과목추가</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<script type="text/javascript" src="check.js"></script>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h2>교과목 추가</h2>
	<form name="frm" method="get" action="action.jsp">
	<input type="hidden" name="mode" value="insert">
		<table border="1" style="width: 45%">
			<tr>
				<td>과목코드</td>
				<td align="left"><input type="text" name="id" style="width:98%"></td>
			</tr>
			<tr>
				<td>과목명</td>
				<td align="left"><input type="text" name="name" style="width:98%"></td>
			</tr>
			<tr>
				<td>학점</td>
				<td align="left"><input type="text" name="credit" style="width:98%"></td>
			</tr>
			<tr>
				<td>담당강사</td>
				<td align="left">
					<select name="lecturer" style="width:98%">
						<option value="">담당강사선택</option>
						<option value="1">김교수</option>
						<option value="2">이교수</option>
						<option value="3">박교수</option>
						<option value="4">우교수</option>
						<option value="5">최교수</option>
						<option value="6">임교수</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>요일</td>
				<td>
					<input type="radio" name="week" value="1">월
					<input type="radio" name="week" value="2">화
					<input type="radio" name="week" value="3">수
					<input type="radio" name="week" value="4">목
					<input type="radio" name="week" value="5">금
				</td>
			</tr>
			<tr>
				<td>시작시간</td>
				<td align="left"><input type="text" name="start_hour" style="width:98%"></td>
			</tr>
			<tr>
				<td>종료시간</td>
				<td align="left"><input type="text" name="end_hour" style="width:98%"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type ="submit" onclick="add()" value="추가">&nbsp;&nbsp;&nbsp;
					<input type ="button" onclick="window.location='list.jsp'" value="목록">
				</td>
			</tr>
		</table>
	</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>