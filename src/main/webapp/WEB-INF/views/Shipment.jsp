<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="/resources/js/Shipment.js"></script>
<title>출하서</title>
</head>
	<body>	
		<table border = "1">
		<caption>출하서</caption>
		<tr>
		<th>출하번호</th>
		<th>거래처</th>
		<th>발행일</th>
		<th>납품일자</th>
		<th>품목명</th>
		<th>품목코드</th>
		<th>수량</th> 
		<th>단가</th>
		<th>비고</th>
		</tr>
		<c:forEach items="${shipment}" var="shipment" >
		<tr>
		<td>${shipment.snumber}</td>
		<td>${shipment.sname}</td>
		<td>${shipment.sday}</td>
		<td>${shipment.dday}</td>
		<td>${shipment.product}</td>
		<td>${shipment.pcode}</td>
		<td>${shipment.tcount}</td>
		<td>${shipment.price}</td>
		<td></td>
		</tr>
		</c:forEach>
		</table>

</body>
</html>