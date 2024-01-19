<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- CDN -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- 외부 JS -->
<script type="text/javascript" src="/resources/js/balju.js"></script>
<meta charset="UTF-8">
<title>발주</title>
</head>
<body>
	<h1>발주등록 페이지</h1>
	
	<form action="balju_insert" method="post" accept-charset="utf-8">
	<table border="1">
		<tr>
			<th>발주일자</th>
				<!-- input name이 db이름과 같아야 데이터가 들어감 -->
			<td><input type="date" name="baljuday"></td>
		</tr>
		<tr>
			<th>사업자번호</th>
			<td><input type="text" name="bnumber"></td>
		</tr>
		<tr>
			<th>상호</th>
			<td><input type="text" name="bname"></td>
		</tr>
		<tr>
			<th>제품명</th>
			<td>
			<select name="bproduct" id="selectbox">
			<option selected="selected">제품선택</option>
			</select>
			</td>			
		</tr>
		<tr>
			<th id="stock">단가</th>
			<td id="stock_money"></td>
		</tr>
		<tr>
			<th>수량</th>
			<td><input type="text" name="bcount" id="num1"></td>
		</tr>
		<tr>
			<th>합계</th>
			<td><input type="text" name="bsum" id="total" readonly="readonly"></td>
		</tr>
		
	</table>
	<input type="submit" value="발주등록">
	</form>

</body>
</html>