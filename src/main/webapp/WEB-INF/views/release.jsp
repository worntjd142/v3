<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출고 내역</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="../resources/js/release.js"></script>
</head>
<body>

<div>

<div>
<table border="1">
<tr>
<td colspan="2"> 출고기간 </td>
<td>납품처</td>
</tr>
<tr>
<td>2016-04-01</td>
<td>2016-04-05</td>
<td>
</td>
</tr>
</table>
</div>


<div>
<button>검색하기</button>
<button>모두표시</button>
<button>날짜정렬</button>
</div>

<table border="1">
<tr>
<td>출 고 날 짜</td>
<td>납 품 처</td>
<td>제 품 코 드 </td>
<td>품 명</td>
<td>운 송 자 현 위 치</td>
</tr>
<!-- 테이블 10개 생성 -->
<!-- varStatus를 이용하여 테이블 위치확인에 id값을 10개 생성하기. -->
<c:forEach begin="1" end="10" varStatus="location">
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td id="location${location.index}">위 치 확 인</td>
</tr>
</c:forEach>
</table>





</div>
</body>
</html>

