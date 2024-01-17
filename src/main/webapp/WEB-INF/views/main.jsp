<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link href="../resources/css/main.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="generator" content="Hugo 0.115.4">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>붉은별 수주프로그램</title>
</head>
<body>

	<header class="p-3 bg-dark text-white">
		<div class="container">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<a href="/"
					class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
					<img src="../resources/image/main.png"
					style="width: 50px; height: 50px;"> <use
						xlink:href="#bootstrap"></use>
				</a>

				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<!-- a태그 클릭 비활성화 -->
					<li><a href="#" class="nav-link px-2 text-secondary"
						style="pointer-events: none"></a></li>
					<li><a href="#" class="nav-link px-2 text-white">수주내역</a></li>
					<li><a href="#" class="nav-link px-2 text-white">제품현황</a></li>
					<li><a href="#" class="nav-link px-2 text-white">출고내역</a></li>
					<li><a href="#" class="nav-link px-2 text-white">거래처목록</a></li>
					<li><a href="#" class="nav-link px-2 text-white">거래처원장</a></li>
				</ul>

				<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
					<input type="search" class="form-control form-control-dark"
						placeholder="검색..." aria-label="Search">
				</form>

				<div class="text-end">
					<button type="button" class="btn btn-outline-light me-2">로그인</button>
					<button type="button" class="btn btn-warning">회원가입</button>
				</div>
			</div>
		</div>
	</header>

	<div class="row mb-3 text-center">
	
		<div class="col-md-8 themed-grid-col">
		
			<div class="row">
				<div class="col-md-6 themed-grid-col" id="div1_box">
					<table class="table table-striped table-hover table-bordered">
						<thead>
							<tr>
								<th scope="col" colspan="2" class="table-dark">입고기간</th>
								<th scope="col" class="table-dark">거래처명</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>시작날짜</td>
								<td>종료날짜</td>
								<td>거래처명</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-md-6 themed-grid-col"></div>
				
				<div class="col-md-6 themed-grid-col" id="div2_box">
					<button type="button" class="btn btn-outline-secondary btn-sm">검색</button>
				</div>
				<div class="col-md-6 themed-grid-col" id="div3_box"></div>
			

			<div class="col-md-6 themed-grid-col"></div>

			<div class="col-md-6 themed-grid-col">
				<button type="button" class="btn btn-outline-secondary btn-sm">오름차순 정렬</button>
				<button type="button" class="btn btn-outline-secondary btn-sm">내림차순 정렬</button>
				<button type="button" class="btn btn-outline-secondary btn-sm">모두보기</button>
			</div>
			
			

			<div class="pb-3">
				<table class="table table-striped table-hover table-bordered">
					<thead>
						<tr>
							<th scope="col" class="table-dark">#</th>
							<th scope="col" class="table-dark">주문 날짜</th>
							<th scope="col" class="table-dark">제품 코드</th>
							<th scope="col" class="table-dark">제품명</th>
							<th scope="col" class="table-dark">병원명</th>
							<th scope="col" class="table-dark">주소</th>
							<th scope="col" class="table-dark">단가</th>
							<th scope="col" class="table-dark">수량</th>
							<th scope="col" class="table-dark">금액</th>
							<th scope="col" class="table-dark">담당자</th>
							<th scope="col" class="table-dark">결제 확인</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>Mark</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>Mark</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>Mark</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		
		</div>
		<div class="col-md-4 themed-grid-col">.col-md-4</div>
		
		
		
		</div>

		


</body>
</html>