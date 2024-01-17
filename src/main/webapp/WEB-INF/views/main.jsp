<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>붉은별 수주프로그램</title>
</head>
<body>

 <nav class="navbar navbar-expand-lg bg-body-tertiary">
 <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="../resources/image/redstar.png" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
      	붉은별
    </a>
  </div>
  
  <div class="container-fluid">
    <a class="navbar-brand" href="#">수주내역</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">제품관리</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">출고내역</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            거래처관리
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">수금내역</a></li>
            <li><a class="dropdown-item" href="#">외상매출금대장</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">거래처원장</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" aria-disabled="true">추가예정</a>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">검색</button>
      </form>
    </div>
  </div>
</nav>

</body>
</html>