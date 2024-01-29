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

<meta charset="UTF-8">
<title>출고</title>
</head>

<body>
	<!-- 헤더 -->
	<jsp:include page="include/header.jsp"></jsp:include>

	<div>
		<form action="order" method="get">
			<table
				class="table table-striped table-hover table-bordered table-responsive">
				<thead>
					<tr class="table-dark">
						<th colspan="6" class="title_th">검색</th>
					</tr>
					<tr>
						<th scope="col">수주일</th>
															<!-- 컨트롤 "paging" 변수에 저장된 cdto모델에 있는 startday  -->
						<td><input type="date" name="startday" id="startday" value="${paging.cd.startday}"> 
							<label> ~ </label> 
						<input type="date" name="endday" id="endday" value="${paging.cd.endday}"></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="col">수주번호</th>
						<td><input type="text" name="companyname">수주번호로 조회</td>
						<td><input type="button" name="companyname" value="일괄등록" onclick="update()"></td>
					</tr>
					<tr>
						<td><input type="submit" value="조회" name="search"
							class="btn btn-outline-secondary btn-sm"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<div>
		<!-- <button type="button" id="check_button" class="btn btn-outline-secondary btn-sm">일괄체크</button>
	<button type="button" class="btn btn-outline-secondary btn-sm">일괄수주</button> -->

		<table
			class="table table-striped table-hover table-bordered table-responsive">
			<thead>
				<tr>
					<th scope="col" class="table-dark"><input type="checkbox" id="check_all"></th>
					<th scope="col" class="table-dark">출고요청일자</th>
					<!-- 발주 데이터 -->
					<th scope="col" class="table-dark">수주번호</th>
					<th scope="col" class="table-dark">거래처명</th>
					<th scope="col" class="table-dark">제품명</th>
					<th scope="col" class="table-dark">요청수량</th>
					<th scope="col" class="table-dark">재고수량</th>
					<th scope="col" class="table-dark">출고수량</th>
					<th scope="col" class="table-dark">마감상태</th>
					<th scope="col" class="table-dark">요청사항</th>
					<th scope="col" class="table-dark">출고현황</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${stroe}" var="stroeList" varStatus="a">
					<tr>
						<td><input type="checkbox" class='check_all' id="check_val${a.index}" value="${stroeList.ono}"></td>
						<td></td>
						<td>${stroeList.uuid}</td>
						<td>${stroeList.cname}</td> 
						<td>${stroeList.pproduct}</td>
						<td>${stroeList.pprice}</td>
						<td></td>
						<td></td>
						<td>${stroeList.osuju}</td>
						<td></td>
					 	<td>
					 	<c:choose>
					 	<c:when test="${stroeList.sdel  ==  '-'}">
							-					 	
					 	</c:when>
					 	
					 	<c:when test="${stroeList.sdel  ==  '출고 중'}">
							<img alt="출고 중" src="../../resources/image/적재.png">
							<label>출고 중</label>				 	
					 	</c:when>
					 	
					 	<c:when test="${stroeList.sdel  ==  '배송 중'}">
							<img alt="배달 중" src="../../resources/image/배달.png" onclick="del('${stroeList.x}','${stroeList.y}','${stroeList.cname}')">
							<label>배송 중</label>
					 	</c:when>
					 	
					 	<c:when test="${stroeList.sdel  ==  '배달완료'}">
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