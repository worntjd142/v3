<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!-- CDN -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- 외부 JS, CSS -->
<script type="text/javascript" src="/resources/js/store_release.js"></script>
<link href="../resources/css/order.css" rel="stylesheet">
<link rel = "stylesheet" href = "resources/css/store_release.css" />
<meta charset="UTF-8">
<title>출고</title>
</head>
<body>
 	<!-- 헤더 -->
 	<input type="hidden" value="${count}" id="count">
 	<jsp:include page="include/header.jsp"></jsp:include>

	<div id="release">
		<h3 id="Breleased_Request">수주서 및 출고서 발행</h3>
		<div id="release_check" class="tableData thead tr th">
			<table
				class="table table-striped table-hover table-bordered table-responsive">
				<thead>
					<tr class="table-dark" style="text-align: center;" >
						<th class="title_th" style="width: 30px;"></th>
						<th class="title_th" style="width: 115px;">요청일자</th>
						<th class="title_th" style="width: 180px;">수주번호</th>
						<th class="title_th" style="width: 80px;">진행상태</th>
						<th class="title_th" style="width: 200px;">거래처</th>
						<th class="title_th" style="width: 80px;">품목코드</th>
						<th class="title_th" style="width: 170px;">품목명</th>
						<th class="title_th" style="width: 90px; ">요청수량</th>
						<th class="title_th" style="width: 60px;">발행창</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${stroe}" var="stroeList" varStatus="a">
					<tr>
					<td>${a.count}</td>
					<td>${stroeList.oday}</td>
					<td>${stroeList.uuid}</td>
					<td>${stroeList.osuju}</td>
					<td style = "text-align: center;">${stroeList.cname}</td>
					<td>${stroeList.pcode}</td>
					<td>
					<c:choose>
					<c:when test="${stroeList.pcount ge 2 }">
					${stroeList.pproduct} 외  ${stroeList.pcount - 1}개
					</c:when>
					<c:otherwise>
					${stroeList.pproduct}
					</c:otherwise>
					</c:choose>
					</td>
					<td style = "text-align: right;">${stroeList.tcount}</td>
					<td>	<input type="button" value="발행" onclick="issuance(${stroeList.ono})"> </td>
					</tr>
					
					</c:forEach>
				</tbody>
			</table>
			</div>
				<div id="buttons">
	<a href = "store"><input type="button" value="출하" class="btn btn-outline-light me-2" id="culha"></a>
	<a href = "store_release"><input type="button" value="출고" class="btn btn-outline-light me-2" id="culgo"></a>
		</div>
			<h3 id="aa">관리</h3>
		<div id="change" class="tableData thead tr th">
		<table class="table table-striped table-hover table-bordered table-responsive">
			<thead>
				<tr style="text-align: center;">
					<th scope="col" class="table-dark" style="width: 30px;"></th>
					<th scope="col" class="table-dark" style="width: 115px;">출하일자</th>
					<th scope="col" class="table-dark" style="width: 180px;">수주번호</th>
					<th scope="col" class="table-dark" style="width: 200px;">거래처</th>
					<th scope="col" class="table-dark" style="width: 95px;">진행상태</th>
					<th scope="col" class="table-dark" style="width: 80px;">품목코드</th>
					<th scope="col" class="table-dark" style="width: 180px;"> 품목명 </th>
					<th scope="col" class="table-dark">기준단위</th>
					<th scope="col" class="table-dark" style="width: 90px;">요청수량</th>
					<th scope="col" class="table-dark" style="width: 90px;">출하수량</th>
					<th scope="col" class="table-dark"style="width: 90px;">요청잔량</th>
					<th scope="col" class="table-dark" style="width: 110px;">마감상황</th>
					<th scope="col" class="table-dark" style="width: 60px;">출하서</th>
					<th scope="col" class="table-dark" style="width: 400px;">비고</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${Management}" var="ManagementList" varStatus="a">
					<tr >
						<td>${a.count}</td>
						<td>${ManagementList.rday}</td>
						<td>${ManagementList.uuid}</td>
						<td style = "text-align: center;">${ManagementList.cname}</td>
						<td>${ManagementList.osuju}</td>
						<td>${ManagementList.pcode}</td>
						<td>
						<c:choose>
					<c:when test="${ManagementList.pcount ge 2 }">
					${ManagementList.pproduct} 외  ${ManagementList.pcount - 1}개
					</c:when>
					<c:otherwise>
					${ManagementList.pproduct}
					</c:otherwise>
					</c:choose>
					</td>
						<td style = "text-align: center;">EA</td>
						<td style = "text-align: right;">${ManagementList.tcount}</td>
						<td style = "text-align: right;">${ManagementList.tscount}</td>
						<td style = "text-align: right;">${ManagementList.tamount}</td>
						
						<td class="sdel${a.index}">
						<c:choose>
						
						<c:when test="${ManagementList.sdel == '출고 중'}">
						<img src="resources/image/적재.png"> <label>출고 중</label>
						 </c:when> 
						
						<c:when test="${ManagementList.sdel == '배송 중'}">
						<img src ="resources/image/배달.png"> <label class="sdel${a.index}"> 배송 중</label>
						<script>
						$(".sdel${a.index}").css("cursor", "pointer");
						$(".sdel${a.index}").on("click", function(){
							del(${ManagementList.x},${ManagementList.y},'${ManagementList.cname}');
						})
						</script>
						</c:when>	
						</c:choose>
						</td>
						
						<td><input type="button" value="출력" onclick="delivery('${ManagementList.ono}')"></td>
						<td>${ManagementList.otext}</td>
						
					</tr>
					</c:forEach>
			</tbody>
		</table>
	</div>
	
	
	<h3 id="po">위치</h3>
	<div class="time"><b style= "color: #4682B4;">도착까지:<label id="time"></label></b></div>
	<div id = "map">
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e53e51300b84c3acadbd93d20d9fea8"></script>
	<script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(35.5421094, 129.3382413), //지도의 중심좌표.
		level: 1 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); 
	</script>
	</div> 
</div> 


</body>
</html>