<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수주서</title>
</head>
<link rel = "stylesheet" href = "resources/css/sujuletter.css" />
<body>
<div>
<form action="mail">
	<div style="text-align: center;"><h1 style="letter-spacing: 20px;">수 주 서</h1></div>

	<div>
	<div  id="aa">
<div class="sujuletter">수 주 일 자 :    <label>     </label></div>
	<div class="sujuletter">수 주 번 호 :    <label>     </label></div>
	<div class="sujuletter">거   래   처 :    <label>     </label></div>
	<div class="sujuletter">팩 스 번 호 :    <label>     </label></div>
	<div class="sujuletter">수   신   처 :    <label>     </label></div>
	</div>
	<div id="baljuletter">
	<table border="1">
	<tr>
	<td class="subtitle">등 록번호</td>
	<td colspan="3" class="input" id="registration_number">541-44-11357</td>
	</tr>
	
	<tr>
	<td class="subtitle">상  호</td>
	<td class="input" id="company">RED STAR</td>
	<td class="subtitle"> 성  명</td>
	<td class="input" id="company_boss">최 나 영</td>
	</tr >
	
	<tr>
	<td class="subtitle">주  소</td>
	<td colspan="3" class="input">울산 남구 삼산중로100번길 26, KM빌딩</td>
	</tr>
	
	<tr>
	<td class="subtitle">업 태</td>
	<td class="input">의약품 판매업</td>
	<td class="subtitle"> 종  목</td>
	<td class="input">마 약 류</td>
	</tr>
	
	<tr>
	<td class="subtitle">T E L</td>
	<td class="input">1588-1666</td>
	<td class="subtitle">F A X </td>
	<td class="input"> 052-5171-7979</td>
	</tr>
	</table>
	<div id="money">
	<label id="suju_ment1">아래와 같이 수주합니다.</label>
	<label id="suju_ment2">수주 금액 : </label> <div id="total_money">₩</div>
	</div>
	</div>
	
	<div id="suju_text">
	<table border="1" id="suju_table">
	<tr>
	<td class="susutext_title">N O</td>
	<td class="susutext_title">품 명</td>
	<td class="susutext_title">상 품 코 드</td>
	<td class="susutext_title">수 량</td>
	<td class="susutext_title">단 가</td>
	<td class="susutext_title">합 계</td>
	<td class="susutext_title">메 모</td>
	</tr >
	
	<c:forEach begin="1" end="7">
	<tr>
	<td>a</td>
	<td>a</td>
	<td>a</td>
	<td>a</td>
	<td>a</td>
	<td>a</td>
	<td>a</td>
	</tr>
	</c:forEach>
	</table>
	</div>
				 <div id="ment">
				 <p>안녕하십니까? redstarpharma입니다. "</p>
				 <p>귀사의 일익 번창하심을 진심으로 기원하며 귀사 수주의뢰서를 드립니다.</p>
				 <p>정보를 확인 부탁드립니다.</p>
				 <p>TEL - 1588-1666</p>
				 </div>
	</div>

<input type="submit" value="발행">
</form>
</div>			 
</body>
</html>