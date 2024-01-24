<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수주처 처리()</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/sujuletter1.js"></script>
<link rel = "stylesheet" href = "resources/css/sujuletter1.css" />
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.debug.js"></script>
</head>
<body>
		
	<div>
		<h1>수주서 처리()</h1>
		
	<div>입력정보</div>
	<table border="1">
	<tr>
	<td>거래처</td>
	<td>${sujuletter.bname}<input type="hidden" value="${sujuletter.bname}" name="bname" id="bname"></td>
	<td>현상태</td>
	<td>${sujuletter.sujubox}</td>
	<td>변경상태</td>
	<td></td>
	</tr>
	
	<tr>
	<td>품목</td>
	<td colspan="3">${sujuletter.bproduct}</td>
	<td>합계금액</td>
	<td style="color:red;"><fmt:formatNumber value="${sujulette.bsum}" pattern="#,###" ></fmt:formatNumber></td>
	</tr>
	
	<tr>
	<td>입금통장</td>
	<td colspan="5"><input type="text"></td>
	</tr>
	
	<tr>
	<td>택배사</td>
	<td colspan="2"><input type="text"></td>
	<td>운송장 번호</td>
	<td colspan="2"><input type="text"></td>
	</tr>
	
	<tr>
	<td>전달사항</td>
	<td colspan="5"><textarea></textarea></td>
	</tr>
	
	</table>
	
	<h1>발주처 정보</h1>
	
	<table border="1">
	<tr>
	<td>배송처</td>
	<td colspan="5"><input type="text"></td>
	</tr>
	
	<tr>
	<td>우편번호</td>
	<td><input type="text"></td>
	</tr>
	
	<tr>
	<td>수취인</td>
	<td><input type="text"></td>
	<td>전화번호</td>
	<td><input type="text" placeholder="052"> - <input type="text" placeholder="1234"> - <input type="text" placeholder="1234"></td>
	<td>휴대폰번호</td>
	<td><input type="text"> - <input type="text"> - <input type="text"></td>
	</tr>

	<tr>
	<td>배송메세지</td>
	<td colspan="5"></td>
	</tr>
	</table>
	
	<div>
	<input type="button" value="전송"> 
	<input type="button" value="취소">
	</div>



</div>
</body>
</html>