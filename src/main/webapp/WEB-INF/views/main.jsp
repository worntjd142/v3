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
<script type="text/javascript" src="/resources/js/main.js"></script>
<link href="../resources/css/main.css" rel="stylesheet">
<meta charset="UTF-8">

<title>변수제약회사</title>
</head>
<body>

	<div class="container">

		<div class="imagebox">
			<img src="../../resources/image/logo.png" style="width: 260px;">
		</div>

		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h5 class="card-title text-center">로그인</h5>

						<form action="login" method="post" class="form-signin">

							<div class="form-label-group">
								<input type="text" id="inputid" class="form-control"
									placeholder="아이디" name="useid" required autofocus> <label
									for="inputid">아이디</label>
							</div>

							<div class="form-label-group">
								<input type="password" id="inputPassword" class="form-control"
									placeholder="비밀번호" name="usepassword" required> <label
									for="inputPassword">비밀번호</label>
							</div>

							<div class="custom-control custom-checkbox mb-3">
								<input type="checkbox" class="custom-control-input"
									id="customCheck1"> <label class="custom-control-label"
									for="customCheck1">로그인 상태 유지하기</label>
							</div>

							<input type="submit" value="로그인" class="btn btn-lg btn-primary btn-block text-uppercase">
							
						</form>
						
						<a href="join"><input type="submit" id="input_join" value="회원가입" class="btn btn-lg btn-primary btn-block text-uppercase"></a>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>