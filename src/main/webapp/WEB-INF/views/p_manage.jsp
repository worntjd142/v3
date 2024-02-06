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
<script type="text/javascript" src = "resources/js/p_manage.js"></script>
<link rel = "stylesheet" href = "resources/css/p_manage.css">

<meta charset="UTF-8">
<title>거래처 목록</title>
</head>

<body>

	<!-- 헤더 -->
	<jsp:include page="include/header.jsp"></jsp:include>

	<div class = "left1">
		<form action="p_insert" method="post">
		<c:set var="now" value="<%=new java.util.Date()%>"/>
		<input type = "hidden" name = "pcode" id = "randomcode">
			<table
				class="table table-striped table-secondary table-hover table-bordered table-responsive">
				<thead>
					<tr class="table-dark">
						<th colspan="6" class="title_th">제품 등록</th>
					</tr>
					<tr>					
						<th scope="col" class = "pppp">제품명</th>
						<td class = "pppp2"><input type="text" name="pname"></td>								
						<th scope="col" class = "pppp">제품단가</th>
						<td class = "pppp2"><input type="text" name="pprice"></td>
						<th scope="col" class = "pppp">제조사</th>
						<td class = "pppp2"><input type="text" name="pmc"></td>
						
					</tr>
					<tr>
						<th scope="col" class = "pppp">입고수량</th>
						<td class = "pppp2"><input type="text" name="pstock"> </td>
						<th scope="col" class = "pppp">제품설명</th>
						<td class = "pppp2"><input type="text" name="pmi"></td>
						<th scope="col" class = "pppp">유통기한</th>
						<td class = "pppp2"><input type="text" name="exd"></td>
					</tr>
					<tr>
						<th scope="col" class = "pppp">제품 이미지</th>
						<td colspan = "3" class = "pppp2"><input type="file" name="pimage"></td>
						<td colspan = "2"><input type="submit" value="등록"></td>
					</tr>
				</thead>
			</table>
		</form>
	</div>
<!-- 제품 리스트 div -->
	<div class = "right">
		<table class = "table table-striped table-hover table-bordered table-responsive">
			<thead>
				<tr>
					<th class = "table-dark" colspan = "4">제품목록</th>
					<th class = "table-dark" id = temple>제품창고 온도 :<label id = wtemple></label>℃</th>
				</tr>
				<tr>
					<th scope="col" class="table-dark">제품코드</th>
					<th scope="col" class="table-dark">제품명</th>
					<th scope="col" class="table-dark">제품단가</th>
					<th scope="col" class="table-dark">재고 수</th>
					<th scope="col" class="table-dark">제품 관리</th>
				</tr>
			</thead>
			<tbody>
		<c:forEach items = "${p_list}" var = "pro" varStatus="a">
				<tr onclick = "insert_info('${pro.pimage}','${pro.pmc}','${pro.pmi}','${pro.pname}','${pro.exd}','${pro.houseld}','${pro.housed}')">
					<td>${pro.pcode}</td>
					<td><span  class = "hovertext" data-html = "true" data-hover = "resources/image/product/${pro.pimage}">${pro.pname}</span></td>
					<td>${pro.pprice}</td>
					<td>${pro.pstock}</td>
					<td><button onclick="togb('${a.index}')">추가입고</button>
					<div class = "pluss" id = "pluss${a.index}">
						<input type = "number" name = "stockplus" id = "plus5${a.index}">
						<button onclick = "stockplus('${pro.pcode}','${pro.pstock}','${a.index}','<fmt:formatDate value="${now}" pattern = 'yyyy-MM-dd'/>')">확인</button>
					</div>
					</td>
				</tr>
		</c:forEach>
			</tbody>
		</table>
	</div>
<!-- 상세내역 div -->
	<div class = "left2">
		<table class="table table-striped table-secondary table-hover table-bordered table-responsive">
			<thead>
				<tr class="table-dark">
					<th colspan="5" class="title_th">제품 상세 정보</th>
				</tr>
				<tr class = "imagetr">
					<td style = "background-color : white;" class = "imagetd" colspan = "3" rowspan = "6" id = "pimagei"></td>
					<th class = "p_width">제품 이름</th>
					<td class = "p_width2" style = "background-color : #FFFFFF" id = "pnamei"></td>
				</tr>
				<tr>
					<th class = "p_width">입고날짜</th>
					<td class = "p_width2" style = "background-color : #FFFFFF" id = "housedi"></td>
				</tr>
				<tr>
					<th class = "p_width">유통기한</th>
					<td class = "p_width2" style = "background-color : #FFFFFF" id = "exdi"></td>
				</tr>
				<tr>
					<th class = "p_width">제조사</th>
					<td class = "p_width2" style = "background-color : #FFFFFF" id = "pmci"></td>
				</tr>
				<tr>
					<th class = "p_width">제품설명</th>
					<td class = "p_width2" style = "background-color : #FFFFFF" id = "pmii"></td>
				</tr>
				<tr>
					<th class = "p_width">최종입고</th>
					<td class = "p_width2" style = "background-color : #FFFFFF" id = "houseldi"></td>
				</tr>
			<thead>
		</table>
	</div>
</body>
</html>