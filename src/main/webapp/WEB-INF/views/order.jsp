<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!-- CDN -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<!-- 외부 JS, CSS -->
<script type="text/javascript" src="/resources/js/order.js"></script>
<link href="../resources/css/order.css" rel="stylesheet">

<meta charset="UTF-8">
<title>수주</title>
</head>

<body>

	<!-- 헤더 -->
	<jsp:include page="include/header.jsp"></jsp:include>

	<div class="main1">
		<form action="order_insert" method="post" id="autosearch">
			<table
				class="table table-striped table-hover table-bordered table-responsive">
				<thead>
					<tr>
						<td colspan="6"><input type="submit" value="등록"></td>
					</tr>
					<tr class="table-dark">
						<th colspan="6" class="title_th">수주 등록</th>
					</tr>
					<tr>					
						<th scope="col">거래처명</th>
						
						<td><input type="text" name="cname" id="auto"><label for="auto"></label></td>										
						
						<th scope="col">제품명</th>
						<td><input type="text" name="pproduct" id="auto_product"></td>
						<th scope="col">제품단가</th>
						<td><input type="text" name="pprice" id="pprice"></td>
					</tr>
					<tr>
						<th scope="col">수주수량</th>
						<td><input type="text" name="ocount" id="ocount" onkeyup="count()"> </td>
						<th scope="col">합계금액</th>
						<td><input type="text" name="osum" id="total"></td>
					</tr>
					<tr>
						<th scope="col">수주 담당자</th>
						<td><input type="text" hidden="" name="omanager" value="${sessionScope.login.usename}"><span>${sessionScope.login.usename}</span></td>
						<th scope="col">요청사항</th>
						<td colspan="3"><textarea rows="2" cols="52" name="otext"></textarea></td>
					</tr>
				</thead>
			</table>
		</form>	
	</div>
	
	<div class="main2">
	<h4>장바구니 만드는 중</h4>
		<table class="table table-striped  table-hover table-bordered table-responsive">
			<thead>
			  <tr class="table-dark">				
				<th scope="col">제품명</th>
				<th scope="col">제품수량</th>
				<th scope="col">제품합계</th>
			  </tr>
			</thead>
			<tbody>
			  <tr>		
				<td> </td>
				<td> </td>
				<td> </td>
			  </tr>
			  <tr>		
				<td class="table-dark" colspan="2"> 총 품목 </td>
				<td> </td>
			  </tr>
			  	<tr>		
				<td class="table-dark" colspan="2"> 총 합계 </td>
				<td> </td>
			  </tr>
			</tbody>
		  </table>
	</div>
	
	
	
	<div class="main3">
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
						
					</tr>
					<tr>
						<td><input type="submit" value="조회" name="search"
							class="btn btn-outline-secondary btn-sm"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<div class="main4">
		<!-- <button type="button" id="check_button" class="btn btn-outline-secondary btn-sm">일괄체크</button>
	<button type="button" class="btn btn-outline-secondary btn-sm">일괄수주</button> -->
		<input type="button" name="companyname" value="일괄체크" id="check_button">
		<input type="button" name="companyname" value="일괄등록" onclick="update()">
		<table
			class="table table-striped table-hover table-bordered table-responsive">
			<thead>
				<tr>
					<th scope="col" class="table-dark"><input type="checkbox" id="check_all"></th>
					<th scope="col" class="table-dark">수주번호</th>
					<!-- 발주 데이터 -->
					<th scope="col" class="table-dark">수주일자</th>
					<th scope="col" class="table-dark">거래처명</th>
					<th scope="col" class="table-dark">품목수</th>
					<th scope="col" class="table-dark" hidden="">제품단가</th>
					
					<th scope="col" class="table-dark">합계</th>
					<!-- 수주 데이터 -->
					<th scope="col" class="table-dark">수주상태</th>
					<th scope="col" class="table-dark">수주담당자</th>
					<th scope="col" class="table-dark">요청사항</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${olist}" var="orderlist" varStatus="a">
					<tr>
						<td><c:if test="${orderlist.osuju == '수주 대기'}"><input type="checkbox" class='check_all' id="check_val${a.index}" value="${orderlist.ono}"></c:if></td>
						<td>${orderlist.uuid}</td>
						<td>${orderlist.oday}</td>
						<td>${orderlist.cname}</td> 
						<td> 품목수 </td>
						<td hidden="">${orderlist.pprice}</td>
						
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