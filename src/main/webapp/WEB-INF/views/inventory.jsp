<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "resources/css/inventory.css">
<meta charset="UTF-8">
<title>재고</title>
</head>
<body>
<div class ="headline"><h2>품목별 관리 현황</h2></div>
<table id = "inventory_t">
<caption id = "cap">거래기간 : $제품.거래날짜 ~ $제품.거래날짜</caption>
		<tr>
			<th>제품코드</th>
			<th>제품명</th>
			<th>단가</th>
			<th>이월재고</th>
			<th>수주수량</th>
			<th>출고 수량</th>
			<th>현 재고</th>
		</tr>
		<tr>
			<td>$제품.code</td>
			<td>$제품.name</td>
			<td>$제품.price</td>
			<td>$제품.caov</td>
			<td>$제품.oorder</td>
			<td>$제품.release</td>
			<td>$제품.inventory</td>
		</tr>
</table>
 
</body>
</html>