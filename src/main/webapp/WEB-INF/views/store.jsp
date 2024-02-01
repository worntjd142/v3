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

	<div>
			<table
				class="table table-striped table-hover table-bordered table-responsive">
				<thead>
					<tr class="table-dark">
						<th class="title_th">수주번호</th>
						<th class="title_th">거래처명</th>
						<th class="title_th">제품명</th>
						<th class="title_th">요청수량</th>
						<th class="title_th">재고수량</th>
						<th class="title_th">출고수량</th>
						<th class="title_th">출고</th>
					</tr>
				</thead>
				<tbody>
					<tr  style="height:50px">
					<td id="uuid"></td>
					<td id="cname"></td>
					<td id="pproduct"></td>
					<td id="ocount"></td>
					<td id="pstock"></td>
					<td id="balju_count"></td>
					<td id="balju"></td>
					</tr>
				</tbody>
			</table>
	</div>
	

	<div id="balju_button"></div>
<h5>* 주문 순서대로 정렬됩니다.</h5>
	<div>
		<!-- <button type="button" id="check_button" class="btn btn-outline-secondary btn-sm">일괄체크</button>
	<button type="button" class="btn btn-outline-secondary btn-sm">일괄수주</button> -->

		<table
			class="table table-striped table-hover table-bordered table-responsive">
			<thead>
				<tr>
					<th scope="col" class="table-dark">출고요청일자</th>
					<!-- 발주 데이터 -->
					<th scope="col" class="table-dark">수주번호</th>
					<th scope="col" class="table-dark">거래처명</th>
					<th scope="col" class="table-dark">제품명</th>
					<th scope="col" class="table-dark">요청수량</th>
					<th scope="col" class="table-dark">출고수량</th>
					<th scope="col" class="table-dark">마감상태</th>
					<th scope="col" class="table-dark">요청사항</th>
					<th scope="col" class="table-dark">출고현황</th>
				</tr>
			</thead>
			<tbody>
			
				<c:forEach items="${stroe}" var="stroeList" varStatus="a">
					<tr>
						<td onclick="balju('${stroeList.ono}','${stroeList.uuid}','${stroeList.cname}','${stroeList.pproduct}','${stroeList.ocount}','${stroeList.pcode}')" style="cursor: pointer;">${stroeList.sdate}</td>
						<td onclick="balju('${stroeList.ono}','${stroeList.uuid}','${stroeList.cname}','${stroeList.pproduct}','${stroeList.ocount}','${stroeList.pcode}')" style="cursor: pointer;">${stroeList.uuid}</td>
						<td onclick="balju('${stroeList.ono}','${stroeList.uuid}','${stroeList.cname}','${stroeList.pproduct}','${stroeList.ocount}','${stroeList.pcode}')" style="cursor: pointer;">${stroeList.cname}</td> 
						<td onclick="balju('${stroeList.ono}','${stroeList.uuid}','${stroeList.cname}','${stroeList.pproduct}','${stroeList.ocount}','${stroeList.pcode}')" style="cursor: pointer;">${stroeList.pproduct}</td>
						<td onclick="balju('${stroeList.ono}','${stroeList.uuid}','${stroeList.cname}','${stroeList.pproduct}','${stroeList.ocount}','${stroeList.pcode}')" style="cursor: pointer;">${stroeList.ocount}</td>
						<td onclick="balju('${stroeList.ono}','${stroeList.uuid}','${stroeList.cname}','${stroeList.pproduct}','${stroeList.ocount}','${stroeList.pcode}')" style="cursor: pointer;">${stroeList.scount}</td>
						<td onclick="balju('${stroeList.ono}','${stroeList.uuid}','${stroeList.cname}','${stroeList.pproduct}','${stroeList.ocount}','${stroeList.pcode}')" style="cursor: pointer;">${stroeList.osuju}</td>
						<td onclick="balju('${stroeList.ono}','${stroeList.uuid}','${stroeList.cname}','${stroeList.pproduct}','${stroeList.ocount}','${stroeList.pcode}')" style="cursor: pointer;">${stroeList.otext}</td>
					 	<td>
					 	<c:choose>
					 	<c:when test="${stroeList.sdel  ==  '수주 대기'}">
							수주대기					 	
					 	</c:when>
					 	
					 	<c:when test="${stroeList.sdel  ==  '출고 중'}">
							<img alt="출고 중" src="../../resources/image/적재.png">
							<label>출고 중</label>				 	
					 	</c:when>
					 	
					 	<c:when test="${stroeList.sdel  ==  '배송 중'}">
							<img alt="배달 중" src="../../resources/image/배달.png" onclick="del('${stroeList.x}','${stroeList.y}','${stroeList.cname}')" style="cursor: pointer;">
							<label  style="cursor: pointer;" onclick="del('${stroeList.x}','${stroeList.y}','${stroeList.cname}')">배송 중</label>
					 	</c:when>
					 	
					 	<c:when test="${stroeList.sdel  ==  '배달 완료'}">
					 	배달 완료
					 	</c:when>
					 	</c:choose>
					 	</td>
					</tr>
					<!-- /반복문으로 데이터 가져오기 -->
				</c:forEach>
				<tr>
					<td colspan="12"><div>
							<nav aria-label="Page navigation example">
								<ul class="pagination">

									<!-- prev(이전)이 true면 버튼 활성화 -->
									<c:if test="${paging.prev}">
										<li class="page-item"><a class="page-link"
											href="order?pageNum=${paging.startPage-1}&amount=${paging.cd.amount}"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if>

									<!-- [1][2][3][4][5][6][7][8][9][10] -->
									<!-- [1]:begin이 [10]:end될 동안 반복 -->
									<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
										var="num">
										<li class="page-item"><a class="page-link"
											href="order?pageNum=${num}&amount=${paging.cd.amount}">
												${num}</a></li>
									</c:forEach>

									<!-- next(다음)이 true면 버튼 활성화 -->
									<c:if test="${paging.next}">
										<li class="page-item"><a class="page-link"
											href="order?pageNum=${paging.endPage+1}&amount=${paging.cd.amount}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
								</ul>
							</nav>
						</div></td>
				</tr>
			</tbody>
		</table>
	</div>



</body>
</html>