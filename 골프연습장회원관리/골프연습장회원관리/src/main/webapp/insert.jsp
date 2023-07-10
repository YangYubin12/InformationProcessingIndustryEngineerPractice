<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<script type="text/javascript" src="check.js"></script>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>수강신청</h2>
		<form name="frm" method="post" action="action.jsp">
			<table border="1">
				<tr>
					<td>수강월</td>
					<td style="text-align:left;">
						<input type="text" name="resist_month" style="width:150px"> 예)202203
					</td>
				</tr>
				<tr>
					<td>회원명</td>
					<td style="text-align:left;">
					<select name="c_name" style="width:150px">
						<option value="">회원명</option>
						<option value="10001">홍길동</option>
						<option value="10002">장발장</option>
						<option value="10003">임꺽정</option>
						<option value="20001">성춘향</option>
						<option value="20002">이몽룡</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>회원번호</td>
					<td style="text-align:left;">
						<input name="c_no" id="c_no" readonly style="width:150px">
					</td>
				</tr>
				<tr>
					<td>강의장소</td>
					<td style="text-align:left;">
						<input type="radio" name="class_area" value="서울본원">서울본원
						<input type="radio" name="class_area" value="성남분원">성남분원
						<input type="radio" name="class_area" value="대전분원">대전분원
						<input type="radio" name="class_area" value="부산분원">부산분원
						<input type="radio" name="class_area" value="대구분원">대구분원
					</td>
				</tr>
				<tr>
					<td>강의명</td>
					<td style="text-align:left;">
						<select name="class_name" style="width:150px">
							<option value="">강의신청</option>
							<option value="100000">초급반</option>
							<option value="200000">중급반</option>
							<option value="300000">고급반</option>
							<option value="400000">심화반</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>수강료</td>
					<td style="text-align:left;">
					<input type="text" id="tuition" name="tuition" style="width:150px">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="수강신청" onclick="sub()"> &nbsp;
						<input type="button" value="다시쓰기" onclick="res()">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>