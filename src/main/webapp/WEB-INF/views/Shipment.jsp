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
<link rel = "stylesheet" href = "resources/css/shipment.css" />
<title>출하서</title>
</head>
	<body     style="height: 400px;">	
	<div>
		<div id="title" style="text-align: center"> <h1>출 하 서</h1></div>
		<table class="table table-striped table-hover table-bordered table-responsive" style="width: 550px;">
		<tr class="table-dark">
		<th scope="col" class="table-dark" style="width: 90px;">출하번호</th>
		<th scope="col" class="table-dark" style="width: 70px;">거래처</th>
		<th scope="col" class="table-dark"style="width: 110px;">발행일</th>
		<th scope="col" class="table-dark" style="width: 110px;">납품일자</th>
		</tr>
		<tr>
		<td>${shipment[0].snumber}</td>
		<td style="width: 130px;">${shipment[0].sname}</td>
		<td>${shipment[0].sday}</td>
		<td>${shipment[0].dday}</td>
		</tr>
		<tr> 
		<th  style="text-align: center;">품목명</th>
		<th style="text-align: center;">품목코드</th>
		<th  style="text-align: center;">수량</th> 
		<th  style="text-align: center;">단가</th>
		</tr>
		<c:forEach items="${shipment}" var="shipment" varStatus="a" >
		<tr>
		<td style="text-align: left;">${shipment.product}</td>
		<td  style="text-align: left;">${shipment.pcode}</td>
		<td  style="text-align: right;"><fmt:formatNumber value="${shipment.ocount}" pattern="#,###" ></fmt:formatNumber><input type="hidden" value="${shipment.ocount}" id="ocount${a.index}"></td>
		<td  style="text-align: right;"><fmt:formatNumber value="${shipment.price}" pattern="#,###" ></fmt:formatNumber></td>
		</tr>
		</c:forEach>
		<tr>
		<td colspan="2" >합 계</td>
		<td id="tocount" style="text-align: right;"> 
		<script>
		let osum = 0;
 		for(let i = 0; i < ${shipment[0].pcount}; i++){
		 osum += parseInt($("#ocount"+i).val());
		}
 	
 		$("#tocount").html(osum.toLocaleString("ko-KR"));
 		</script>
 	
		</td>
		<td colspan="2" style="text-align: right;"><fmt:formatNumber value="${shipment[0].osum}" pattern="#,###" ></fmt:formatNumber></td>
		</tr>
		
		</table>
</div>
<button onclick = "return printPage()" id = "prtin_after">출력</button>
<script>
reload();
</script>

</body>
</html>