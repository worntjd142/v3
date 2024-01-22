<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수 주 서</title>
</head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/sujuletter.js"></script>
<script type="text/javascript" src="/resources/js/orderajax.js"></script>
<link rel = "stylesheet" href = "resources/css/sujuletter.css" />
<body>
<div>

	<div id="print_page">
	<div style="text-align: center;" ><h1 style="letter-spacing: 20px;">수 주 서</h1></div>

	<div>
	<div  id="aa">
<div class="sujuletter">수 주 일 자 :    <label> ${sujuletter[0].baljuday} <input type="hidden" value="${sujuletter[0].baljuday}" name="baljuday"></label></div>
	<div class="sujuletter">사업자 번 호	:    <label> ${sujuletter[0].bnumber} <input type="hidden" value="${sujuletter[0].bnumber}" name="bnumber"></label></div>
	<div class="sujuletter">거   래   처	:    <label> ${sujuletter[0].bname}<input type="hidden" value="${sujuletter[0].bname}" name="bname"></label></div>
	<div class="sujuletter">전 화 번 호	:    <label>     </label></div>
	<div class="sujuletter">수 주 번 호	:	  <label>${sujuletter[0].uuid} <input type="hidden" value="${sujuletter[0].uuid}" name="uuid"></label></div>
	</div>
	<div id="baljuletter">
	<table border="1">
	<tr>
	<td class="subtitle">등 록번호</td>
	<td colspan="3" class="input" id="registration_number">541-44-11357</td>
	</tr>
	
	<tr>
	<td class="subtitle">상  호</td>
	<td class="input" id="company">변수제약</td>
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
	<label id="suju_ment2">수주 금액 : </label> <div id="total_money">₩ <fmt:formatNumber value="${sujuletter[0].bsum}" pattern="#,###" ></fmt:formatNumber>원
																				<input type="hidden" value="${sujuletter[0].bsum}" name="bsum"></div>
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
	<td class="susutext_title">비 고</td>
	</tr >
	<c:forEach items="${sujuletter}" var="letter" varStatus="a"> 
	<tr>
	<td style="text-align: center;">${a.count} </td>
	<td style="text-align: center;">${letter.bproduct}<input type="hidden" value="${letter.bproduct}" name="bproduct"></td>
	<td style="text-align: center;">${letter.pcode} </td>
	<td style="text-align: center;">${letter.bcount} <input type="hidden" value="${letter.bcount}" name="bcount"></td>
	<td style="text-align: right;"><fmt:formatNumber value="${letter.pprice}" pattern="#,###" ></fmt:formatNumber> <input type="hidden" value="${letter.pprice}" name="pprice"></td>
	<td style="text-align: right;"><fmt:formatNumber value="${letter.bsum}" pattern="#,###" ></fmt:formatNumber> </td>
	<td></td>
	</tr>
	</c:forEach>
	</table>
	<input type="hidden" value="${sujuletter[0].bno}" name="bno" id="bno"> <!--  업데이트 구분을 위한 bno -->
	</div>
	
				 <div id="ment">
				 <p>안녕하십니까? redstar제약기술재단 변수제약입니다. "</p>
				 <p>귀사의 일익 번창하심을 진심으로 기원하며 귀사 수주의뢰서를 드립니다.</p>
				 <p>정보를 확인 부탁드립니다.</p>
				 <p>TEL - 1588-1666</p>
				 </div>
			</div><!--  프린트 페이지  -->
	</div>
	<div>
		<input type="button" id="print" onclick="return prints()" value="출력">
		<input type="button" id="close" onclick="closes()" value="닫기">
	</div>
	
	<!--  발행 여부를 확인하여 발행버튼 보이게하기 -->
<c:if test="${sujuletter[0].sujubox.equals('미발행')}"> 
<input type="button" value="발행" id="send">
</c:if>
</div>
</body>
</html>