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
		<form action="order_insert" method="post">
			<table
				class="table table-striped table-secondary table-hover table-bordered table-responsive">
				<thead>
					<tr>
						<td colspan="6"><input type="submit" value="등록"></td>
					</tr>
					<tr class="table-dark">
						<th colspan="6" class="title_th">수주 등록</th>
					</tr>
					<tr>
						<th scope="col">거래처명</th>
						<td><input type="text" name="cname"></td>
						<th scope="col">제품명</th>
						<td><input type="text" name="pproduct"></td>
						<th scope="col">제품단가</th>
						<td><input type="text" name="pprice"></td>
					</tr>
					<tr>
						<th scope="col">수주수량</th>
						<td><input type="number" name="ocount"></td>
						<th scope="col">요청수량</th>
						<td><input type="number" name="recount"></td>
						<th scope="col">합계금액</th>
						<td><input type="text" name="osum"></td>
					</tr>
					<tr>
						<th scope="col">수주 담당자</th>
						<td><input type="text" hidden="" name="omanager"><span>${sessionScope.login.usename}</span></td>
						<th scope="col">요청사항</th>
						<td colspan="3"><textarea rows="2" cols="89" name="otext"></textarea></td>
					</tr>
				</thead>
			</table>
		</form>
	</div>
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
						<td><input type="date" name="startday" value="${paging.cd.startday}"> 
							<label> ~ </label> 
						<input type="date" name="endday" value="${paging.cd.endday}"></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="col">수주번호</th>
						<td><input type="text" name="companyname">수주번호로 조회</td>
					</tr>
					<tr>
						<td><input type="submit" value="조회" 
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
					<th scope="col" class="table-dark"><input type="checkbox"
						id="check_all"></th>
					<th scope="col" class="table-dark">수주번호</th>
					<!-- 발주 데이터 -->
					<th scope="col" class="table-dark">수주일자</th>
					<th scope="col" class="table-dark">거래처명</th>
					<th scope="col" class="table-dark">제품명</th>
					<th scope="col" class="table-dark" hidden="">제품단가</th>
					<th scope="col" class="table-dark">수주수량</th>
					<th scope="col" class="table-dark">요청수량</th>
					<th scope="col" class="table-dark">수주잔량</th>
					<th scope="col" class="table-dark">수주합계금액</th>
					<!-- 수주 데이터 -->
					<th scope="col" class="table-dark">수주상태</th>
					<th scope="col" class="table-dark">수주담당자</th>
					<th scope="col" class="table-dark">요청사항</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${olist}" var="orderlist" varStatus="a">
					<tr>
						<td><input type="checkbox"></td>
						<td>${orderlist.uuid}</td>
						<td>${orderlist.oday}</td>
						<td>${orderlist.cname}</td>
						<td>${orderlist.pproduct}</td>
						<td hidden="">${orderlist.pprice}</td>
						<td>${orderlist.ocount}</td>
						<td>${orderlist.recount}</td>
						<td>${orderlist.iocount}</td>
						<td>${orderlist.osum}</td>
						<td>${orderlist.osuju}</td>
						<td>${orderlist.omanager}</td>
						<td>${orderlist.otext}</td>
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