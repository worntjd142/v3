<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 입고</title>
</head>
<body>
<form action = "housing" method = "get">
	<input type = "hidden" name = "pstock" value = "${house.pstock}">
	<input type = "hidden" name = "pcode" value = "${house.pcode}">
	<table>
		<tr>
			<th>제품명</th>
			<td>${house.pname}</td>
		</tr>
		<tr>
			<th>추가 입고 수량</th>
			<td><input type = "number" name = "stockplus"></td>
		</tr>
	</table>
	<input type = "submit" value = "추가입고">
</form>
</body>
</html>