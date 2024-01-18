<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../resources/css/main.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="generator" content="Hugo 0.115.4">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>header</title>
</head>
<body>

	<!-- 헤더 -->
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
					<li><a href="order" class="nav-link px-2 text-white">수주내역</a></li>
					<li><a href="inventory" class="nav-link px-2 text-white">제품현황</a></li>
					<li><a href="release" class="nav-link px-2 text-white">출고현황</a></li>
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
	<!-- /헤더 -->

</body>
</html>