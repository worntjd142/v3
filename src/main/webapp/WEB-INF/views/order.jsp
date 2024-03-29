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

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="generator" content="Hugo 0.115.4">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 외부 JS, CSS -->
<script type="text/javascript" src="/resources/js/order.js"></script>
<link href="../resources/css/order.css" rel="stylesheet">

<meta charset="UTF-8">
<title>수주</title>
</head>

<body>

	<!-- 헤더 -->
	<jsp:include page="include/header.jsp"></jsp:include>
	
	<div>
		<div class="main1">	
		<form action="order_insert" id="orderForm" method="post" id="autosearch">	
		
			<table class="table table-striped table-hover table-bordered table-responsive">
				<thead>
					<tr class="table-dark">
						<th colspan="5" class="title_th">수주 등록</th>
						<th class="title_th">
						<input class = "allbtn" type="submit" value="등록">
						</th>
					</tr>
					<tr>					
						<th scope="col">사업자번호</th>						
						<td><input type="text" name="cno" id="cno" readonly style = "border-width: 0"><label for="cno"></label></td>
						<th scope="col">거래처명</th>						
						<td><input type="text" name="cname" id="auto"><label for="auto"></label></td>
						<th scope="col">대표자</th>						
						<td><input type="text" name="ceo" id="ceo" readonly style = "border-width: 0"><label for="ceo"></label></td>
					</tr>
					<tr>
						<th scope="col">수주제품</th>
						<td colspan="3">
							<label for="pcount">품목 수 : </label>
							<input type="text" name="pcount" id="pcount" style = "border-width: 0" readonly>
							<label for="pproduct">제품명 : </label>
							<input type="text" name="pproduct" id="pproduct" style = "border-width: 0" readonly><br>
							<label for="pprice">제품단가 : </label>
							<input type="text" name="pprice" id="pprice" style = "border-width: 0" readonly>
							<label for="ocount">제품수량 : </label>
							<input type="text" name="ocount" id="ocount" style = "border-width: 0" readonly>
						</td>
						<th scope="col">총 합계</th>
						<td><input type="text" name="osum" id="osum" readonly style = "border-width: 0"><label for="osum"></label></td>
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
		
	
	
	<div class="tableBox" id="product_list">
			
		<table class="table table-striped table-hover table-bordered table-responsive tableData" id = "prodlist">
		  <thead class="table-dark">


	
		    <tr>
				<th scope="col" id="th1"><input type="checkbox" id="all_Check" name="all_Check"></th>
				<th scope="col" id="th2">제품명</th>
				<th scope="col" id="th3">제품단가</th>
				<th scope="col" id="th4">주문수량
					<div class = "pbutton">
						<input type="button" class="allbtn" id="btn_Chklist" name="btn_Chklist" value="제품추가">
						<input type="button"  class = "allbtn" id="delete_Btn" name="delete_Btn" value="제품삭제">
					</div> 
					
				</th>
		    </tr>
		  </thead>		  
		  <tbody class="scroll">	    
			  <c:forEach items="${plist}" var="prolist" varStatus="count">
			    <tr>
					<td><input type="checkbox" class="choice_Check" id="choice_Check" name="choice_Check" value="${prolist.pname}"></td>
			      	<!-- 제품명 -->
			      	<td><input type="hidden" name="pname">${prolist.pname}</td>
			      	<!-- 제품단가 -->
			      	<td id="tdbox"><input type="hidden" id="pprice${count.index}" name="pprice">${prolist.pprice}</td> 
			      	<!-- 수주수량 -->
			  		<td><input type="text" class = "count2box" name="ocount" id="countBox${count.index}" value = 0> 
			      		<button class = "allbtn" onclick = "minus(${count.index})"> - </button>
			      		<button class = "allbtn" onclick = "plus(${count.index})"> + </button>
			      	</td>
			    </tr>
			   </c:forEach>			   
		  </tbody>
		</table>		
		 
	</div>	
	

	<div class="main4">
		<form action="order" method="get">
		<table class="table  table-hover table-bordered" id="mainsujutable" >
			<thead id="stock_thead">
			<tr class="table-dark">
						<th colspan="10" class="title_th">검색</th>
					</tr>
					<tr>
						<td scope="col">수주일</td>
															<!-- 컨트롤 "paging" 변수에 저장된 cdto모델에 있는 startday  -->
						<td colspan="8">
						<input type="date" name="startday" id="startday" value="${paging.cd.startday}"> 
							<label> ~ </label> 
						<input type="date" name="endday" id="endday" value="${paging.cd.endday}">
						</td>
						<td id="tdborder"><input type="submit" value="조회" name="search"
							class="btn btn-outline-secondary btn-sm"></td>
					</tr>
				<tr>
				<th>

				</th>
				</tr>
				
				<tr>
					<th scope="col" id="tthbox" class="table-dark">
									<input type="button" class = "allbtn" name="companyname" value="일괄체크" id="check_button">
					<input type="button" class = "allbtn" name="companyname" value="출하" onclick="update()">
					
					</th>
					<th scope="col" class="table-dark" style="text-align:center;">
					<input type="checkbox" id="check_all"></th>
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
					<th scope="col" class="table-dark" id="d_Btn">요청사항</th>
				</tr>
			</thead>
			<tbody id="stock_tbody">
				<c:forEach items="${olist}" var="orderlist" varStatus="a">
					<tr onclick="product_details(${orderlist.ono})" style="cursor: pointer;" id="d_r${orderlist.ono}">
						<td>${a.count}</td>
						<td style="text-align:center;"><c:if test="${orderlist.osuju == '수주 대기'}"><input type="checkbox" class='check_all' id="check_val${a.index}" value="${orderlist.ono}"></c:if></td>
						<td>${orderlist.uuid}</td>
						<td>${orderlist.oday}</td>
						<td><a href="orderDetail?ono=${orderlist.ono}" onclick="window.open(this.href, '_blank', top=100, left=40, 'width=800, height=600'); return false;">${orderlist.cname}</a></td> 
						<td>
						<c:choose>
						<c:when test="${orderlist.pcount ge 2 }">
						${orderlist.pproduct} 외  ${orderlist.pcount - 1}개
						</c:when>
						<c:otherwise>
						${orderlist.pproduct}
						</c:otherwise>
						</c:choose>
						</td>						
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

								<ul class="pagination justify-content-center" >

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
		</form>
	</div>
	<div id="mody_button"></div>
</div>


</body>
</html>