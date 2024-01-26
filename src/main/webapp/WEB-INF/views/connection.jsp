<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- CDN -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- 외부 JS -->
<meta charset="UTF-8">
<title>거래처 목록</title>
</head>
<body>
	<h1>거래처 목록</h1>
	
	<form action="connection_insert" method="post" accept-charset="utf-8">
	<table border="1">
	<tr>
		<tr>
			<th>거래처 이름</th>
			<td><input type="text" name="cname" id="cname"></td>
		</tr>
		<tr>
			<th>사업자 번호</th>
			<td><input type="text" name="cno" id="cno"></td>
		</tr>
		<tr>
			<th>대표자 이름</th>
			<td><input type="text" name="ceo" id="ceo"></td>			
		</tr>
		<tr>
			<th>거래처 주소</th>
			<td><input type="text" name="caddress"  id="caddress"></td>
		</tr>
		<tr>
			<th>거래처 번호</th>
			<td><input type="text" name="cnumber" id="cnumber"></td>
		</tr>
		<tr>
			<th>거래처 이메일</th>
			<td><input type="text" name="cemail" id="cemail"></td>
		</tr>
		<tr>
			<th>비고</th>
			<td><input type="text" name="cmi" id="cmi"></td>
		</tr>
		
	</table>
	<input type="submit" value="거래처 등록">
	</form>
<table border="1" id="table">
<tr>
<td>거래처</td>
<td>사업자 번호</td>
<td>대표자</td>
<td>주소</td>
<td>번호</td>
<td>이메일</td>
<td>비고</td>

</tr>
<c:forEach items="${c_list}" var="com"><!--  DB에 등록된 거래처 리스트 -->
<tr>
<td>${com.cname}</td>
<td>${com.cno}</td>
<td>${com.ceo}</td>
<td>${com.caddress}</td>
<td>${com.cnumber}</td>
<td>${com.cemail}</td>
<td>${com.cmi}</td>
</tr>
</c:forEach>
</table>

</body>
</html>