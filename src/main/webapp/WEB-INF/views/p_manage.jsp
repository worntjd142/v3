<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<link rel = "stylesheet" href = "resources/css/p_manage.css">
<link rel = "stylesheet" href = "resources/css/p_detail.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript" src = "resources/js/p_manage.js"></script>
<meta charset="UTF-8">
<title>제품 관리</title>
</head>
<body>
 <!--전체 div-->
<div class = main_container>
<!--등록창 div -->
	<div class = col-md-8>
		<div class = "comment"><h4>신규 제품 등록</h4></div>
		<form action = "p_insert" method = "post">
		<input type = "hidden" name = "pcode" id = "randomcode">
		<div>
		<table id = "p_insertt">
		<tr>
			<th>제품명</th>
			<td><input type = "text" name = "pname"></td>
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
		<input type = "submit">
		</form>
	</div>
<!-- 제품 리스트 div -->
	<div class = "col-md-8">
		<div class = "comment"><h4>제품목록</h4></div>
		<table id = "p_list">
			<thead>
				<tr>
					<th>제품코드</th>
					<th>제품명</th>
					<th>제품단가</th>
					<th>재고 수</th>
				</tr>
			</thead>
			<tbody>
		<c:forEach items = "${p_list}" var = "pro" varStatus="a">
				<tr onclick = "insert_info('${pro.pcode}','${pro.pname}','${pro.pprice}','${pro.pmc}','${pro.pstock}','${pro.pmi}')">
					<td>${pro.pcode}</td>
					<td>${pro.pname}</td>
					<td>${pro.pprice}</td>
					<td>${pro.pstock}</td>
				</tr>
		</c:forEach>
			</tbody>
		</table>
		
	</div>
<!-- 상세내역 div -->
	<div class = "col-md-8">
		<div class = "comment"><h4>제품 상세 정보</h4></div>
		<table id = "p_detail" >
			<tr>
				<th>제품 코드</th>
				<td id = "pcodei"></td>
			</tr>
			<tr>
				<th>제품명</th>
				<td id = "pnamei"></td>
				<th>제품단가</th>
				<td id = "ppricei"></td>
			</tr>
			<tr>
				<th>제조사</th>
				<td id = "pmci"></td>
				<th>재고 수</th>
				<td id = "pstocki"></td>
			</tr>
			<tr>
				<th>제품설명</th>
				<td id = "pmii"></td>
			</tr>
		</table>
	</div>

</div>
</body>
</html>