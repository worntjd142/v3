<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!-- CDN -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- 외부 JS, CSS -->
<script type="text/javascript" src="/resources/js/store.js"></script>
<link href="../resources/css/order.css" rel="stylesheet">
<link rel = "stylesheet" href = "resources/css/store.css" />
<meta charset="UTF-8">
<title>출하</title>
</head>

<body>
 	<!-- 헤더 -->
	<jsp:include page="include/header.jsp"></jsp:include>
	<div id="release">
		<h3>출하 요청</h3>
		<div id="release_check">
			<table
				class="table table-striped table-hover table-bordered table-responsive">
				<thead>
					<tr class="table-dark">
						<th class="title_th">요청일자</th>
						<th class="title_th">수주번호</th>
						<th class="title_th">진행상태</th>
						<th class="title_th">거래처</th>
						<th class="title_th">품목수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${stroe}" var="stroeList" varStatus="a">
					<tr id="ch"  style="cursor: pointer;" onclick="balju('${stroeList.ono}')">
					<td>${stroeList.oday}</td>
					<td>${stroeList.uuid}</td>
					<td>${stroeList.osuju}</td>
					<td>${stroeList.cname}</td>
					<td>${stroeList.pcount}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
				<div id="buttons">
	<a href = "store"><input type="button" value="출하" class="btn btn-outline-light me-2" id="culha"></a>
	<a href = "store_release"><input type="button" value="출고" class="btn btn-outline-light me-2" id="culgo"></a>
		</div>
		<div id="detailed" >
		<h3>출하 상세</h3>
		<ul id= "ment" style="list-style: none;">
		<li style="color:red;">※ 출하일의 기본값은 현재일로 지정되어있습니다.</li>
		<li style="color:red;">※ 출하수량은 요청수량을 초과 할 수 없습니다.</li>
		</ul>
		<table class="table table-striped table-hover table-bordered table-responsive">
			<tbody>
					<tr>
						<td>거래처</td>
					 	<td id="cname"></td>
					 	<td>요청수량</td>
					 	<td id="ocount"></td>
					 	</tr>
					 	<tr>
					 	<td>출하일</td>
					 	<td><input type="date" id="balju_day"></td>
					 	<td>출하수량</td>
					 	<td class="scount"></td>
					 	</tr>
				</tbody>
			</table>
			</div>
			<input type="button" value="제품출하">
	<div id="change">
		<h3>재고</h3>
		<table
			class="table table-striped table-hover table-bordered table-responsive">
			<thead>
				<tr>
					<th scope="col" class="table-dark">상품명</th>
					<th scope="col" class="table-dark">기준단위</th>
					<th scope="col" class="table-dark">재고량</th>
					<th scope="col" class="table-dark">출하수량</th>
					<th scope="col" class="table-dark">단가</th>
					<th scope="col" class="table-dark">요청잔량</th>
					<th scope="col" class="table-dark">비고</th>
				</tr>
			</thead>
			<tbody>
					<tr>
						<td id="pname"></td>
						<td id="ea"></td>
						<td id="pstock"></td>
						<td class="scount"></td>
						<td id="pprice"></td>
						<td id="requested"></td>
						<td id="otext"></td>
					</tr>
					
					<tr>
					<td colspan="4" style="text-align: center;">합 계</td>
					<td id="total"></td>
					<td ></td>
					<td id="shipment"></td>
					</tr>
			</tbody>
		</table>
			<div id="Warning"></div>
	</div>
</div>


</body>
</html>