<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오디션참가현황</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<script type="text/javascript" src="check.js"></script>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h2>오디션 등록</h2>
	<form name="frm" method="get" action="action.jsp">
		<input type="hidden" name="mode" value="insert">
		<table border="1">
			<tr>
				<td>참가번호</td>
				<td class="l"><input type="text" name="artist_id">*참가번호는(A000)4자리입니다.</td>
			</tr>
			<tr>
				<td>참가자명</td>
				<td class="l"><input type="text" name="artist_name" ></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td class="l">
					<input type="text" name="date1">년
					<input type="text" name="date2">월
					<input type="text" name="date3">일
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td class="l">
					<input type="radio" name="gender" value="M">남성
					<input type="radio" name="gender" value="F">여성
				</td>
			<tr>
			<tr>
				<td>특기</td>
				<td class="l">
					<select name="talent">
						<option value="">특기선택</option>
						<option value="1">보컬</option>
						<option value="2">댄스</option>
						<option value="3">랩</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>소속사</td>
				<td class="l"><input type="text" name="agency"></td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="button" onclick="check()" value="오디션등록">
					<input type="button" onclick="res()" value="다시쓰기">
				</td>
			</tr>
		</table>
	</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>