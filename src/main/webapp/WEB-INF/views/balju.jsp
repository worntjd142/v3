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
		<tr>
			<th>사업자번호</th>
			<td><input type="text" name="bnumber" readonly="readonly"  id="bnumber"></td>
		</tr>
		<tr>
			<th>상호</th>
			<td><input type="text" name="bname" readonly="readonly" id="bname"></td>
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
			<td><input type="number" name="bcount" id="num1"></td>
		</tr>
		<tr>
			<th>합계</th>
			<td><input type="text" name="bsum" id="total" readonly="readonly"></td>
		</tr>
		
	</table>
	<input type="submit" value="발주등록">
	</form>
<table border="1" id="table">
<tr>
<td>거래처</td>
<td>사업자 번호</td>
<td>주소</td>
<td>전화번호</td>
<td>팩스</td>
</tr>
<c:forEach items="${company}" var="com" varStatus="c"><!--  DB에 등록된 거래처 리스트 -->
<tr>
<td onclick="insert_company('${com.cname}', '${com.cnumber}')" style="cursor:pointer;">${com.cname}</td>
<td onclick="insert_company('${com.cname}', '${com.cnumber}')" style="cursor:pointer;">${com.cnumber} </td>
<td onclick="insert_company('${com.cname}', '${com.cnumber}')" style="cursor:pointer;">${com.caddress}</td>
<td >${com.ctel}</td>
<td >${com.cfax}</td>
</tr>
</c:forEach>
</table>

</body>
</html>