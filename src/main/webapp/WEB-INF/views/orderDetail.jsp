<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<!-- CDN -->
<link href="../resources/css/main.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="generator" content="Hugo 0.115.4">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<!-- 외부 JS, CSS -->
<script type="text/javascript" src="/resources/js/order.js"></script>
<link href="../resources/css/order.css" rel="stylesheet">

<meta charset="UTF-8">
<title>수주 상세정보</title>
</head>
<body>

<h2>수주 상세정보</h2>

<div id="container">
<table class="table table-bordered">
      <tr>
        <th class="table-dark">상호</th>
        <td>${orderdetail[0].cname}</td>
        <th class="table-dark">사업자번호</th>
        <td>${orderdetail[0].cno}</td>
        <th class="table-dark">대표자명</th>
        <td>${orderdetail[0].ceo}</td>
      </tr>
      <tr>
        <th class="table-dark">주소</th>
        <td colspan="3">${orderdetail[0].caddress}</td>
        <th class="table-dark">연락처</th>
        <td>${orderdetail[0].cnumber}</td>
      </tr>
      <tr>
        <th class="table-dark">제품명</th>
        
        <td>
        <c:forEach items="${orderdetail}" var="orderdetail">
        ${orderdetail.pproduct} <br>
        </c:forEach>
        </td>
        
        <th class="table-dark">수주수량</th>        
        <td>
        <c:forEach items="${orderdetail}" var="orderdetail">
        ${orderdetail.ocount} <br>
        </c:forEach>
        </td>
        
        <th class="table-dark">합계금액</th>
        <td>${orderdetail[0].osum}</td>
      </tr>
      <tr>
        <th class="table-dark">수주담당자</th>
        <td>${orderdetail[0].omanager}</td>
        <th class="table-dark">요청사항</th>
        <td colspan="3">${orderdetail[0].otext}</td>
      </tr>
  </table>
</div>

</body>
</html>