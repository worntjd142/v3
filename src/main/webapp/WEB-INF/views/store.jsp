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
<title>출고</title>
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
						<th class="title_th">품목코드</th>
						<th class="title_th">품목명</th>
						<th class="title_th">요청수량</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${stroe}" var="stroeList" varStatus="a">
					<tr style="cursor: pointer;" onclick="balju('${stroeList.cname}', '${stroeList.ocount}','${stroeList.pcode}')">
					<td>${stroeList.oday}</td>
					<td>${stroeList.uuid}</td>
					<td>${stroeList.osuju}</td>
					<td>${stroeList.cname}</td>
					<td>${stroeList.pcode}</td>
					<td>${stroeList.pproduct}</td>
					<td>${stroeList.ocount}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
				<div id="buttons">
	<input type="button" value="창고재고">
	<input type="button" value="출하현황">
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
					 	<td>출하잔량</td>
					 	<td></td>
					 	</tr>
					 	<tr>
					 	<td>출하일</td>
					 	<td><input type="date" id="balju_day" value="2024-01-03"></td>
					 	<td>출하수량</td>
					 	<td class="scount"></td>
					 	<td colspan="2"><input type="button" value="제품출하"></td>
					 	</tr>
				</tbody>
			</table>
			</div>
		
	<div id="change">
		<h3>창고 재고</h3>
		<table
			class="table table-striped table-hover table-bordered table-responsive">
			<thead>
				<tr>
					<th scope="col" class="table-dark">상품명</th>
					<th scope="col" class="table-dark">기준단위</th>
					<th scope="col" class="table-dark">재고량</th>
					<th scope="col" class="table-dark">출하수량</th>
					<th scope="col" class="table-dark">출하대상</th>
				</tr>
			</thead>
			<tbody>
					<tr>
						<td id="pname"></td>
						<td id="ea"></td>
						<td id="pstock"></td>
						<td class="scount"></td>
						<td id="checkbox"></td>
					</tr>
					<!-- /반복문으로 데이터 가져오기 -->
			</tbody>
		</table>
	</div>
</div>


</body>
</html>