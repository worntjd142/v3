<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "resources/css/p_manage.css">
<meta charset="UTF-8">
<title>제품 관리</title>
</head>
<body>
 <!--전체 div-->
<div class = main_container>
<!--등록창 div -->
	<div class = insert_container>
		<div class = "comment"><h4>신규 제품 등록</h4></div>
		<form action = "p_insert" method = "get">
		<div>
		<table id = "p_insertt">
		<tr>
			<th>제품명</th>
			<td><input type = "text" name = "pcode"></td>
			<th>제품단가</th>
			<td><input type = "text" name = "pprice"></td>
		</tr>
		<tr>
			<th>제조사</th>
			<td><input type = "text" name = "pmc"></td>
			<th>재고 수</th>
			<td><input type = "text" name = "pstock"></td>
		</tr>
		<tr>
			<th>제품설명</th>
			<td><input type = "text" name = "pmi"></td>
		</tr>
		</table>
		</div>
		</form>
	</div>
<!-- 제품 리스트 div -->
	<div class = "list_container">
		<div class = "comment"><h4>제품목록</h4></div>
		<table id = "p_list">
			<tr>
				<th>제품코드</th>
				<th>제품명</th>
				<th>제품단가</th>
				<th>재고 수</th>
			</tr>
			<tr>
				<td>$제품.코드</td>
				<td>$제품.이름</td>
				<td>$제품.단가</td>
				<td>$제품.재고 수</td>
			</tr>
		</table>
		
	</div>
<!-- 상세내역 div -->
	<div class = "detail_container">
	
	</div>

</div>
</body>
</html>