<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!-- CDN -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- 외부 JS -->
<script type="text/javascript" src="/resources/js/order.js"></script>

<meta charset="UTF-8">
<title>수주</title>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="include/header.jsp"></jsp:include>
	
	<div>
	<table class="table table-striped table-secondary table-hover table-bordered table-responsive">
		<thead>			
			<tr>
			<td colspan="6"><input type="button" value="등록"></td>
			</tr>
			<tr class="table-dark">
				<th colspan="6" class="title_th">거래처 등록</th>
			</tr>
			<tr>
				<th scope="col">거래처명</th>
				<td><select><option selected="selected">거래처
							선택</option></select></td>
				<th scope="col">제품명</th>
				<td><select><option selected="selected">제품 선택</option></select></td>
				<th scope="col">제품단가</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th scope="col">수주수량</th>
				<td><input type="number"></td>
				<th scope="col">출고수량</th>
				<td><input type="number"></td>
				<th scope="col">합계금액</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th scope="col">수주 담당자</th>
				<td><span>${sessionScope.login.usename}</span></td>
				<th scope="col">요청사항</th>
				<td colspan="3"><textarea rows="2" cols="89"></textarea></td>
			</tr>
		</thead>
	</table>
	</div>

	<div>
	<form action="order" method="get">
		<table class="table table-striped table-hover table-bordered table-responsive">
			<thead>
				<tr class="table-dark">
					<th colspan="6" class="title_th">검색</th>
				</tr>
				<tr>
					<th scope="col">수주일</th>
					<td><input type="date" name="startday" id="startday"
						value="${paging.cdto.startday}"> ~ <input type="date"
						name="endday" value="${paging.cdto.endday}"></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="col">수주번호</th>
					<td><input type="text" name="companyname">수주번호로 조회</td>
				</tr>
				<tr>
					<td><input type="submit" value="조회" onclick="search()"
						class="btn btn-outline-secondary btn-sm"></td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>

	<div>
	<button type="button" id="check_button"
		class="btn btn-outline-secondary btn-sm">일괄체크</button>
	<button type="button" class="btn btn-outline-secondary btn-sm">일괄수주</button>
	<table class="table table-striped table-hover table-bordered table-responsive">
		<thead>
			<tr>
				<td><input type="checkbox" id="check_all"></td>
				<th scope="col" class="table-dark">주문번호</th>
				<!-- 발주 데이터 -->
				<th scope="col" class="table-dark">발주 일자</th>
				<th scope="col" class="table-dark">수주 일자</th>
				<th scope="col" class="table-dark">사업자번호</th>
				<th scope="col" class="table-dark">거래처</th>
				<th scope="col" class="table-dark">제품명</th>
				<th scope="col" class="table-dark">단가</th>
				<th scope="col" class="table-dark">수량</th>
				<!-- 수주 데이터 -->
				<th scope="col" class="table-dark">합계액</th>
				<th scope="col" class="table-dark">결제상태</th>
				<th scope="col" class="table-dark">배송상태</th>
				<th scope="col" class="table-dark">수주서 발행</th>
				<th scope="col" class="table-dark">수주서</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${baljulist}" var="balju" varStatus="a">
				<tr>
					<td><c:if test="${balju.sujubox.equals('미발행')}">
							<input type="checkbox" id="check_all" id="check_box${a.index}">
						</c:if></td>
					<td scope="row">${balju.uuid}</td>
					<td>${balju.baljuday}</td>
					<td>${balju.sujuday}</td>
					<td>${balju.bnumber}</td>
					<td>${balju.bname}</td>
					<td>${balju.bproduct}</td>
					<td><fmt:formatNumber value="${balju.pprice}" pattern="#,###"></fmt:formatNumber></td>
					<td><fmt:formatNumber value="${balju.bcount}" pattern="#,###"></fmt:formatNumber></td>
					<td><fmt:formatNumber value="${balju.bsum}" pattern="#,###"></fmt:formatNumber></td>
					<td>${balju.spayment}</td>
					<td>${balju.sdelivery}</td>
					<td id="sujubox${balju.bno}">${balju.sujubox}</td>
					<td><button id="sujuletter"
							onclick="sujuletter('${balju.bno}')">확인</button></td>
				</tr>
			</c:forEach>
			<!-- /반복문으로 데이터 가져오기 -->
		</tbody>
	</table>
	</div>
	
	<div>
	<nav aria-label="Page navigation example">
		<ul class="pagination">

			<!-- prev(이전)이 true면 버튼 활성화 -->
			<c:if test="${paging.prev}">
				<li class="page-item"><a class="page-link"
					href="order?pageNum=${paging.startPage-1}&amount=${paging.cdto.amount}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>

			<!-- [1][2][3][4][5][6][7][8][9][10] -->
			<!-- [1]:begin이 [10]:end될 동안 반복 -->
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
				var="num">
				<li class="page-item"><a class="page-link"
					href="order?pageNum=${num}&amount=${paging.cdto.amount}">
						${num}</a></li>
			</c:forEach>

			<!-- next(다음)이 true면 버튼 활성화 -->
			<c:if test="${paging.next}">
				<li class="page-item"><a class="page-link"
					href="order?pageNum=${paging.endPage+1}&amount=${paging.cdto.amount}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
		</ul>
	</nav>
	</div>

</body>
</html>