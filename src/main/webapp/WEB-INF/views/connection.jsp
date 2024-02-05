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
<script type="text/javascript" src="/resources/js/order.js"></script>
<script type="text/javascript" src="/resources/js/connection.js"></script>

<meta charset="UTF-8">
<title>거래처 목록</title>
</head>

<body>

	<!-- 헤더 -->
	<jsp:include page="include/header.jsp"></jsp:include>

	<div>
		<form action="connection_insert" method="post">
			<table
				class="table table-striped table-secondary table-hover table-bordered table-responsive">
				<thead>
					<tr>
						<td colspan="6"><input type="submit" value="등록"></td>
					</tr>
					<tr class="table-dark">
						<th colspan="6" class="title_th">거래처 등록</th>
					</tr>
					<tr>					
						<th scope="col">거래처 이름</th>
						<td><input type="text" name="cname" class="cname"></td>								
						<th scope="col">사업자 번호</th>
						<td><input type="text" name="cno" id="cno" maxlength="12"></td>
						<th scope="col">대표자 이름</th>
						<td><input type="text" name="ceo"></td>
					</tr>
					<tr>
						<th scope="col">거래처 주소</th>
						<td><input type="text" name="caddress" id = "caddress"> </td>
						<th scope="col">거래처 번호</th>
						<td><input type="text" name="cnumber" id="cnumber" maxlength="12"></td>
					</tr>
					<tr>
						<th scope="col">거래처 이메일</th>
						<td><input type="text" name="cemail"></td>
						<th scope="col">비고</th>
						<td colspan="3"><textarea rows="2" cols="52" name="cmi"></textarea></td>
					</tr>
				</thead>
			</table>
			<input type="hidden" value="" name="y" id="latitude"> <!-- y 위도 latitude -->
			<input type="hidden" value="" name="x" id="longitude"> <!-- x 경도 longitude -->
		</form>
	</div>

	<div>
		<!-- <button type="button" id="check_button" class="btn btn-outline-secondary btn-sm">일괄체크</button>
	<button type="button" class="btn btn-outline-secondary btn-sm">일괄수주</button> -->

		<table
			class="table table-striped table-hover table-bordered table-responsive">
			<thead>
				<tr>
					<th scope="col" class="table-dark">거래처</th>
					<th scope="col" class="table-dark">사업자번호</th>
					<th scope="col" class="table-dark">대표자</th>
					<th scope="col" class="table-dark">주소</th>
					<th scope="col" class="table-dark">번호</th>
					<th scope="col" class="table-dark">이메일</th>
					<th scope="col" class="table-dark">비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${c_list}" var="conn">
					<tr>
						<td>${conn.cname}</td>
						<td>${conn.cno}</td>
						<td>${conn.ceo}</td>
						<td>${conn.caddress}</td>
						<td>${conn.cnumber}</td>
						<td>${conn.cemail}</td>
						<td>${conn.cmi}</td>
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


<script>
$(function(){
		
	//주소창에 주소를 입력 후
	$("#caddress").on("blur", function(){
		// 주소값을 addres에 저장
	let addres =$("#caddress").val()
	
	let Search= {"query":addres} // json 타입으로 변경
		
		// 카카오 디벨로퍼스에서 발급받은 API 키
		var REST_API_KEY = "80f1edf0f84195c4ef77e3ea50b5c0c8";

		// Ajax 요청
		$.ajax({
		    type: "GET", // method 방식
		    url: "https://dapi.kakao.com/v2/local/search/address", // 카카오 주소 검색 api
		    data: Search, // 쿼리문의 데이트를 이용해서 위도, 경도값을 구함.
		    headers: {
		        "Authorization": "KakaoAK " + REST_API_KEY, // 보안 토큰
		        "content-type": "application/json"
		    },
		    success: function (data) {
		    	console.log(data.documents[0].x); //위도
		    	$("#longitude").val(data.documents[0].x)
		    	console.log(data.documents[0].y); //경도
		    	$("#latitude").val(data.documents[0].y)
		    	
		    },
		  	error: function (error){
		  		alert("검색 불가");
		  	}
	
	
		})
		    	
		    	
		    	
		    	
})

})
</script>
</body>
</html>