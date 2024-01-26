<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- CDN -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- 외부 JS -->
<script type="text/javascript" src="/resources/js/balju.js"></script>
<meta charset="UTF-8">
<title>출고</title>
</head>
<body>
	<h1>출고</h1>
	
	<form action="balju_insert" method="post" accept-charset="utf-8">
	<table border="1">
	<tr>
		<tr>
				<!--출고요청일자 -->
			<td><input type="text" name="sdate" id = "sdate"></td>
		</tr>
		<tr>
			<th>수주번호</th>
			<td>
				<select name="bproduct" id="selectbox">
				<option selected="selected">제품선택</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>거래처명</th>
			<td><input type="text" name="pprice"  id="stock_money" readonly="readonly"></td>			
		</tr>
		<tr>
			<th>제품명</th>
			<td><input type="text" name="pprice"  id="stock_money" readonly="readonly"> </td>
		</tr>
		<tr>
			<th>요청수량</th>
			<td><input type="number" name="bcount" id="num1"></td>
		</tr>
		<tr>
			<th>재고수량</th>
			<td><input type="text" name="bsum" id="total" readonly="readonly"></td>
		</tr>
		<tr>
			<th>출고수량</th>
			<td><input type="number" name="bsum" id="total"></td>
		</tr>
		<tr>
			<th>재고잔량</th>
			<td><input type="text" name="bsum" id="total" readonly="readonly"></td>
		</tr>
		<tr>
			<th>출고현황</th>
			<td><input type="text" name="bsum" id="total" readonly="readonly"></td>
		</tr>
		
	</table>
	<input type="submit" value="발주등록">
	<input type="hidden" name="pcode" id="pcode">
	</form>
<table border="1" id="table">
<tr>
<td>거래처</td>
<td>사업자 번호</td>
<td>주소</td>
<td>전화번호</td>
<td>원장</td>
</tr>
<c:forEach items="${company}" var="com" varStatus="c"><!--  DB에 등록된 거래처 리스트 -->
<tr>
<td onclick="insert_company('${com.cname}', '${com.cnumber}')" style="cursor:pointer;">${com.cname}</td>
<td onclick="insert_company('${com.cname}', '${com.cnumber}')" style="cursor:pointer;">${com.cnumber} </td>
<td onclick="insert_company('${com.cname}', '${com.cnumber}')" style="cursor:pointer;">${com.caddress}</td>
<td >${com.ctel}</td>
<td >${com.cdoc}</td>
</tr>
</c:forEach>
</table>

</body>
</html>