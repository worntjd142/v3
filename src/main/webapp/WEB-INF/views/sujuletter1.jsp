<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수주처 처리(${connection[0].cname})</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/sujuletter.js"></script>
<link rel = "stylesheet" href = "resources/css/sujuletter1.css" />
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.debug.js"></script>
</head>
<body>


<!-- 프린터해야 할 이미지 숨겨놓음. -->
	<div id="print_page">
	<div style="text-align: center;" ><h1 style="letter-spacing: 20px;">수 주 서</h1></div>
	<input type="hidden" value="${connection[0].ono}" id="pdf_ono">
	<div>
	<div  id="aa">
	<div class="sujuletter">수 주 일 자 :   	 <label>${connection[0].oday}</label></div>
	<div class="sujuletter">사업자 번 호:   	 <label>${connection[0].cno}</label></div>
	<div class="sujuletter">거   래   처:   	 <label>${connection[0].cname}</label></div>
	<div class="sujuletter">전 화 번 호	:  		 <label>${connection[0].cnumber}</label></div>
	<div class="sujuletter">수 주 번 호	:		 <label>${connection[0].uuid}</label></div>
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
	<td class="input">의 약 류</td>
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
	<div id="total_money">₩ <label id="osum_psum2"></label>원</div>
	</div>
	</div>
	
	<div id="suju_text">
	<table border="1" id="suju_table">
	<tr>
	<td class="susutext_title"></td>
	<td class="susutext_title">품 명</td>
	<td class="susutext_title">상 품 코 드</td>
	<td class="susutext_title">수 량</td>
	<td class="susutext_title">단 가</td>
	<td class="susutext_title">합 계</td>
	<td class="susutext_title">비 고</td>
	</tr >
	<c:forEach items="${connection}" var="con" varStatus="a"> 
	<tr>
	<td style="text-align: center;">${a.count} </td>
	<td style="text-align: center;">${con.pproduct}</td>
	<td style="text-align: center;">${con.pcode} </td>
	<td style="text-align: right;"><fmt:formatNumber value="${con.ocount}" pattern="#,###" ></fmt:formatNumber><input type="hidden" value="${con.ocount}" class="ocount"></td>
	<td style="text-align: right;"><fmt:formatNumber value="${con.pprice}" pattern="#,###" ></fmt:formatNumber><input type="hidden" value="${con.pprice}" id="pprice${a.index}"></td>
	<td style="text-align: right;"><fmt:formatNumber value="${con.pprice * con.ocount}" pattern="#,###" ></fmt:formatNumber> </td>
	<td></td>
	</tr>
	</c:forEach>
	<tr>
	<td colspan="3" style="text-align: center;">합 계</td>
	<td id="tocount" style="text-align: right;"></td> 
	<td id="tpprice" style="text-align: right;"></td>
	<td style="text-align: right;" id="osum_psum1"></td>
	<td></td>
	</tr>
	</table>
	</div>
	</div>
</div>
<script>

let osum = 0;
let psum = 0;
let osum_psum = 0;
	for(let i = 0; i < ${connection[0].pcount}; i++){
	 osum += parseInt($(".ocount").val());
	 psum += parseInt($("#pprice"+i).val());
	 
	 osum_psum +=  osum * psum 
}
	$("#tpprice").html(psum.toLocaleString("ko-KR"));
	$("#tocount").html(osum.toLocaleString("ko-KR"));
	$("#osum_psum1").html(osum_psum.toLocaleString("ko-KR"));
	$("#osum_psum2").html(osum_psum.toLocaleString("ko-KR"));


issuance()



</script>
</body>
</html>