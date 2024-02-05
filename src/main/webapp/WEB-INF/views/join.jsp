<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- CDN -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 외부 JS -->
<script type="text/javascript" src="/resources/js/join.js"></script>
<link href="../resources/css/join.css" rel="stylesheet">
<meta charset="UTF-8">
<title>변수제약회사 | 회원가입</title>
</head>
<body>

	<div class="container">

		<div class="imagebox">
			<img src="../../resources/image/logo.png">
		</div>

		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h5 class="card-title text-center">회원가입</h5>

						<form action="login_insert" method="POST" class="form-signin">

							<div class="form-label-group">
								<input type="text" id="useid" name="useid" class="form-control"
									placeholder="아이디" required autofocus> <label
									for="useid">아이디</label>
							</div>

							<div class="form-label-group">
								<input type="password" id="usePassword" name="usepassword" class="form-control"
									placeholder="비밀번호" required> <label
									for="usePassword">비밀번호</label>
							</div>

							<div class="form-label-group">
								<input type="text" id="usename" name="usename" class="form-control"
									placeholder="사용자 이름" required autofocus> <label
									for="usename">사용자 이름</label>
							</div>

							<div class="form-label-group">
								<input type="text" id="usenum" name="usenumber" class="form-control"
									placeholder="사업자번호" required autofocus> <label
									for="usenum">사업자번호</label>
							</div>

							<div class="form-label-group">
								<input type="text" id="usetel" name="usetel" class="form-control"
									placeholder="연락처" required autofocus> <label
									for="usetel">연락처</label>
							</div>

							<input type="submit" value="가입하기"
								class="btn btn-lg btn-primary btn-block text-uppercase">

						</form>



					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>