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
		<h3 id="Shipment_Request">출하 요청</h3>
		<div id="release_check" class="tableData thead tr th">
			<table
				class="table table-striped table-hover table-bordered table-responsive">
				<thead>
					<tr class="table-dark" style="text-align: center;" >
						<th class="title_th" style="width: 30px;"></th>
						<th class="title_th" style="width: 115px;">요청일자</th>
						<th class="title_th" style="width: 200px;">거래처</th>
						<th class="title_th" style="width: 180px;">수주번호</th>
						<th class="title_th" style="width: 180px;">품목명</th>
						<th class="title_th" style="width: 80px;">진행상태</th>
						<th class="title_th" style="width: 116px;">비고</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${stroe}" var="stroeList" varStatus="a">
					<tr id="ch"  style="cursor: pointer;" onclick="balju('${stroeList.ono}')">
					<td>${a.count}</td>
					<td>${stroeList.oday}</td>
					<td>${stroeList.cname}</td>
					<td>${stroeList.uuid}</td>
					<td>
					<c:choose>
					<c:when test="${stroeList.pcount ge 2 }">
					${stroeList.pproduct} 외  ${stroeList.pcount - 1}개
					</c:when>
					<c:otherwise>
					${stroeList.pproduct}
					</c:otherwise>
					</c:choose></td>
					<td>${stroeList.osuju}</td>
					<td>${stroeList.otext}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			
	<div id="buttons">
		<a href = "store"><input type="button" value="출하" class="btn btn-outline-light me-2" id="culha"></a>
		<a href = "store_release"><input type="button" value="출고" class="btn btn-outline-light me-2" id="culgo"></a>
	</div>
	
		<h3  id="Shipment_Details">상세</h3>
		<ul id= "Shipment_ment" style="list-style: none;">
		<li style="color:red;">※ 출하일의 기본값은 현재일로 지정되어있습니다.</li>
		<li style="color:red;">※ 출하수량은 요청수량을 초과 할 수 없습니다.</li>
		</ul>
		<div id="detailed" class="tableData thead tr th">
		<table class="table table-striped table-hover table-bordered table-responsive">
				<thead>
					<tr class="table-dark" style="text-align: center;" >
						<th class="title_th" style="width: 30px;"></th>
						<th class="title_th" style="width: 200px;">거래처</th>
						<th class="title_th" style="width: 130px;">품목명</th>
						<th class="title_th" style="width: 80px;">품목코드</th>
						<th class="title_th" style="width: 90px;">수주수량</th>
						<th class="title_th" style="width: 90px;">출하수량</th>
						<th class="title_th" style="width: 100px;">단가</th>
						<th class="title_th" style="width: 150px;">합계</th>
					</tr>
					<tbody Id="table_culha">
				</tbody >
			</table>
			</div>
			
			<div id="detailed_total">
				<table class="table table-striped table-hover table-bordered table-responsive">
			<tr>
					<th colspan="4" style="width: 441px;text-align: center;">합 계</th>
					<th id="ocount_total" style="width: 90px; text-align: right;"></th>
					<th id="scount_total" style="width: 90px; text-align: right; "></th>
					<th id="sum_price" style="width: 100px; text-align: right;"> </th>
					<th id="total_price" style="width: 150px;text-align: right: ;"> </th>
					</tr>
			</table>
			</div>
			
			
			<h3 id="title_psock">재고</h3>
	<div id="change" class="tableData thead tr th">
		<table
			class="table table-striped table-hover table-bordered table-responsive">
			<thead>
				<tr style="text-align: center;" >
					<th scope="col" class="table-dark" style="width: 30;"></th>
					<th scope="col" class="table-dark" style="width: 180px;">품목명</th>
					<th scope="col" class="table-dark">품목코드</th>
					<th scope="col" class="table-dark">재고량</th>
					<th scope="col" class="table-dark">수주수량</th>
					<th scope="col" class="table-dark">출하수량</th>
					<th scope="col" class="table-dark">요청잔량</th>
				</tr>
			</thead>
			<tbody id="stock">
			</tbody>
		</table>
	</div>
	
	<div id="change_total">
				<table class="table table-striped table-hover table-bordered table-responsive">
			<tr class="table-dark">
					<th colspan="4" style="text-alzign: center;" id="to">합 계</th>
					<th id="total_psock" style="width: 30px;"></th>
					<th id="total_ocount" ></th>
					<th id="total_scount"> </th>
					<th id="total_amount"> </th>
					</tr>
			</table>
			</div>
	
	<div><input type="button" value="출하요청" class="btn btn-outline-light me-2" id="culha_sinho" onclick="culha()"></div>
</div>


</body>
</html>