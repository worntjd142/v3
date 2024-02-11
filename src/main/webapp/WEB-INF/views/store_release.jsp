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
					<tr class="table-dark">
						<th class="title_th"></th>
						<th class="title_th">요청일자</th>
						<th class="title_th">수주번호</th>
						<th class="title_th">진행상태</th>
						<th class="title_th">거래처</th>
						<th class="title_th">품목코드</th>
						<th class="title_th">품목명</th>
						<th class="title_th">요청수량</th>
						<th class="title_th">발행창</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${stroe}" var="stroeList" varStatus="a">
					<tr>
					<td>${a.count}</td>
					<td>${stroeList.oday}</td>
					<td>${stroeList.uuid}</td>
					<td>${stroeList.osuju}</td>
					<td>${stroeList.cname}</td>
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
					<td>${stroeList.tcount}</td>
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
				<tr>
					<th scope="col" class="table-dark"></th>
					<th scope="col" class="table-dark">출하일자</th>
					<th scope="col" class="table-dark">수주번호</th>
					<th scope="col" class="table-dark">진행상태</th>
					<th scope="col" class="table-dark">품목코드</th>
					<th scope="col" class="table-dark"> 품목명 </th>
					<th scope="col" class="table-dark">기준단위</th>
					<th scope="col" class="table-dark">요청수량</th>
					<th scope="col" class="table-dark">출하수량</th>
					<th scope="col" class="table-dark">요청잔량</th>
					<th scope="col" class="table-dark">마감상황</th>
					<th scope="col" class="table-dark">출하서</th>
					<th scope="col" class="table-dark">비고</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${Management}" var="ManagementList" varStatus="a">
					<tr>
						<td>${a.count}</td>
						<td>${ManagementList.oday}</td>
						<td>${ManagementList.uuid}</td>
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
						<td>EA</td>
						<td>${ManagementList.tcount}</td>
						<td>${ManagementList.scount}</td>
						<td>${ManagementList.amount}</td>
						
						<td id="sdel${a.index}">
						<c:choose>
						
						<c:when test="${ManagementList.sdel == '출고 중'}">
						<img src="resources/image/적재.png">
						 <script>
						 $("#sdel" + ${a.index}).append("출고 중");
						 </script>		
						 </c:when> 
						
						<c:when test="${ManagementList.sdel == '배송 중'}">
						<img src ="resources/image/배달.png">
						<script>
						$("#sdel" + ${a.index}).append("배송 중");.
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
</div>


</body>
</html>