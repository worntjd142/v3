<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수주처 처리(${sujuletter.sujubox})</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/sujuletter1.js"></script>
<link rel = "stylesheet" href = "resources/css/sujuletter1.css" />
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.debug.js"></script>
</head>
<body>
		<div>
	<div id="prtin_after">
		<h1>수주서 처리(${sujuletter.sujubox})</h1>
	<div>입력정보</div>
	<table border="1">
	<tr>
	<td>거래처</td>
	<td>${sujuletter.bname}</td>
	<td>현상태</td>
	<td>${sujuletter.sujubox}</td>
	<td>변경상태</td>
	<td></td>
	</tr>
	
	<tr>
	<td>품목</td>
	<td colspan="3">${sujuletter.bproduct}</td>
	<td>합계금액</td>
	<td style="color:red;"><fmt:formatNumber value="${sujuletter.bsum}" pattern="#,###" ></fmt:formatNumber></td>
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
	<td colspan="5">${company.caddress}<input type="hidden" value="${company.caddress}"></td>
	</tr>
	
	<tr>
	<td>수취인</td>
	<td>${company.cdoc}<input type="hidden" value="${company.cdoc}"></td>
	<td>전화번호</td>
	<td>${company.ctel}</td>
	</tr>

	<tr>
	<td>배송메세지</td>
	<td colspan="5"></td>
	</tr>
	</table>
	
	<div>
	<c:if test="${sujuletter.sujubox == '미발행'}">
	<input type="button" value="전송" id="send"> 
	</c:if>
	<input type="button" value="출력" onclick="prints()"> 
	<input type="button" value="닫기">
	</div>
</div>


<!-- 프린터해야 할 이미지 숨겨놓음. -->
	
	<div id="print_page" style="display: none;">
	<div style="text-align: center;" ><h1 style="letter-spacing: 20px;">수 주 서</h1></div>
														<input type="hidden" value="${sujuletter.bno}" id="bno">
	<div>
	<div  id="aa">
	<div class="sujuletter">수 주 일 자 :   		 <label>${sujuletter.baljuday}	</label></div>
	<div class="sujuletter">사업자 번 호	:   	 <label>${sujuletter.bnumber}	</label></div>
	<div class="sujuletter">거   래   처:   	 <label>${sujuletter.bname}		<input type="hidden" value="${sujuletter.bname}" id="bname"></label></div>
	<div class="sujuletter">전 화 번 호	:  		 <label>${company.ctel}			</label></div>
	<div class="sujuletter">수 주 번 호	:		 <label>${sujuletter.uuid}		<input type="hidden" value="${sujuletter.uuid}" id="uuid"></label></div>
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
	<label id="suju_ment2">수주 금액 : </label> 
	<div id="total_money">₩ <fmt:formatNumber value="${sujuletter.bsum}" pattern="#,###" ></fmt:formatNumber>원
	<input type="hidden" value="" name="bsum"></div>
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
	<c:forEach begin="1" end="1" varStatus="a"> 
	<tr>
	<td style="text-align: center;">${a.count} </td>
	<td style="text-align: center;">${sujuletter.bproduct}<input type="hidden" value="${sujuletter.bproduct}" name="bproduct"></td>
	<td style="text-align: center;">${sujuletter.pcode} </td>
	<td style="text-align: center;">${sujuletter.bcount} <input type="hidden" value="${sujuletter.bcount}" name="bcount"></td>
	<td style="text-align: right;"><fmt:formatNumber value="${sujuletter.pprice}" pattern="#,###" ></fmt:formatNumber> <input type="hidden" value="${sujuletter.pprice}" name="pprice"></td>
	<td style="text-align: right;"><fmt:formatNumber value="${sujuletter.bsum}" pattern="#,###" ></fmt:formatNumber> </td>
	<td></td>
	</tr>
	</c:forEach>
	</table>
	</div>
	</div>
</div>
</div>
</body>
</html>