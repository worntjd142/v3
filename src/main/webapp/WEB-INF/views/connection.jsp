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
	<input type="hidden" value="" name="y" id="latitude"> <!-- y 위도 latitude -->
	<input type="hidden" value="" name="x" id="longitude"> <!-- x 경도 longitude -->
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

<script>
$(function(){
		
	//주소창에 주소를 입력 후
	$("#caddress").on("blur", function(){
		// 주소값을 addres에 저장
	let addres =$("#caddress").val()
	
	let Search= {"query":addres} // json 타입으로 변경
		
		// 카카오 디벨로퍼스에서 발급받은 API 키
		var REST_API_KEY = "80f1edf0f84195c4ef77e3ea50b5c0c8";

		// Ajax 요청
		$.ajax({
		    type: "GET", // method 방식
		    url: "https://dapi.kakao.com/v2/local/search/address", // 카카오 주소 검색 api
		    data: Search, // 쿼리문의 데이트를 이용해서 위도, 경도값을 구함.
		    headers: {
		        "Authorization": "KakaoAK " + REST_API_KEY, // 보안 토큰
		        "content-type": "application/json"
		    },
		    success: function (data) {
		    	console.log(data.documents[0].x); //위도
		    	$("#longitude").val(data.documents[0].x)
		    	console.log(data.documents[0].y); //경도
		    	$("#latitude").val(data.documents[0].y)
		    	
		    },
		  	error: function (error){
		  		alert("검색 불가");
		  	}
	
	
		})
		    	
		    	
		    	
		    	
})

})
</script>
</body>
</html>