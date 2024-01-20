<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- CDN -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 외부 JS -->
<script type="text/javascript" src="/resources/js/main.js"></script>
<link href="../resources/css/main.css" rel="stylesheet">
<meta charset="UTF-8">

<title>변수제약회사</title>
</head>
<body>

<div class="container">
<div class="imagebox"><img src="../../resources/image/logo.png"></div>
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">로그인</h5>
            <form class="form-signin">
              <div class="form-label-group">
                <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                <label for="inputEmail">아이디</label>
              </div>

              <div class="form-label-group">
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
                <label for="inputPassword">비밀번호</label>
              </div>

              <div class="custom-control custom-checkbox mb-3">
                <input type="checkbox" class="custom-control-input" id="customCheck1">
                <label class="custom-control-label" for="customCheck1">로그인 상태 유지하기</label>
              </div>
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">로그인</button>
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">회원가입</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>