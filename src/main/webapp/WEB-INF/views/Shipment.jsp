<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="../resources/css/main.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="generator" content="Hugo 0.115.4">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="/resources/js/Shipment.js"></script>
<title>출하서</title>
</head>
	<body>	
	<div>
		<div id="title" style="text-align: center"> <h1>출 하 서</h1></div>
		<table class="table table-striped table-hover table-bordered table-responsive">
		<tr class="table-dark">
		<th scope="col" class="table-dark">출하번호</th>
		<td>${shipment[0].snumber}</td>
		<th scope="col" class="table-dark">거래처</th>
		<td>${shipment[0].sname}</td>
		<th scope="col" class="table-dark">발행일</th>
		<td>${shipment[0].sday}</td>
		<th scope="col" class="table-dark">납품일자</th>
		<td>${shipment[0].dday}</td>
		</tr>
		<tr>
		<th colspan="2">품목명</th>
		<th colspan="2">품목코드</th>
		<th colspan="2">수량</th> 
		<th colspan="2">단가</th>
		</tr>
		<c:forEach items="${shipment}" var="shipment" >
		<tr>
		<td colspan="2">${shipment.product}</td>
		<td colspan="2">${shipment.pcode}</td>
		<td colspan="2">${shipment.tcount}</td>
		<td colspan="2">${shipment.price}</td>
		</tr>
		</c:forEach>
		<tr>
		<td colspan="4">합 계</td>
		<td colspan="2"> </td>
		<td colspan="2">${shipment[0].osum}</td>
		</tr>
		
		</table>
</div>
</body>
</html>