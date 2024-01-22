<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<!-- CDN -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- 외부 JS -->
<script type="text/javascript" src="/resources/js/order.js"></script>

<meta charset="UTF-8">
<title>수주</title>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="include/header.jsp"></jsp:include>

	<div class="container">
  <div class="row justify-content-md-center">
    <div class="col col-lg-6">
      <form action="search_day" method="get">
        <table class="table table-striped table-hover table-bordered">
          <thead>
            <tr>
              <th scope="col" class="table-dark">입고기간</th>
              <th scope="col" class="table-dark">거래처명</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><input type="date" name="startday"> ~ <input type="date" name="endday"></td>
              <td><input type="text" name="companyname">거래처명</td>
            </tr>
            <tr>
            <td><input type="submit" value="날짜검색" class="btn btn-outline-secondary btn-sm"></td>
            </tr>
          </tbody>
        </table>
        </form>
    </div>
    
   <div class="col col-lg-6">
      <button type="button" class="btn btn-outline-secondary btn-sm">오름차순 정렬</button>
					<button type="button" class="btn btn-outline-secondary btn-sm">내림차순 정렬</button>
					<button type="button" class="btn btn-outline-secondary btn-sm">모두보기</button>
					<button type="button" id="check_button" class="btn btn-outline-secondary btn-sm">일괄체크</button>
					<button type="button" class="btn btn-outline-secondary btn-sm">일괄수주</button>
    </div>
    

    <div class="col-auto">
      <table class="table table-striped table-hover table-bordered">
        <thead>
          <tr>
            <td><input type="checkbox" id="check_all" ></td>
            <th scope="col" class="table-dark">주문번호</th>
            <!-- 발주 데이터 -->
            <th scope="col" class="table-dark">발주 일자</th>								
            <th scope="col" class="table-dark">수주 일자</th>								
            <th scope="col" class="table-dark">사업자번호</th>
            <th scope="col" class="table-dark">거래처</th>
            <th scope="col" class="table-dark">제품명</th>
            <th scope="col" class="table-dark">단가</th>
            <th scope="col" class="table-dark">수량</th>
            <!-- 수주 데이터 -->
            <th scope="col" class="table-dark">합계액</th>
            <th scope="col" class="table-dark">결제상태</th>
            <th scope="col" class="table-dark">배송상태</th>
            <th scope="col" class="table-dark">수주서 발행</th>
            <th scope="col" class="table-dark">수주서</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${baljulist}" var="balju" varStatus="a"> 
          <tr>
            <td><c:if test="${balju.sujubox.equals('미발행')}"><input type="checkbox" id="check_all" id="check_box${a.index}">	</c:if></td>
            <td scope="row">${balju.uuid}</td>
            <td>${balju.baljuday}</td>
            <td>${balju.sujuday}</td>
            <td>${balju.bnumber}</td>
            <td>${balju.bname}</td>
            <td>${balju.bproduct}</td>
            <td><fmt:formatNumber value="${balju.pprice}" pattern="#,###" ></fmt:formatNumber></td>
            <td><fmt:formatNumber value="${balju.bcount}" pattern="#,###" ></fmt:formatNumber></td>
            <td><fmt:formatNumber value="${balju.bsum}" pattern="#,###" ></fmt:formatNumber></td>
            <td>${balju.spayment}</td>
            <td>${balju.sdelivery}</td>
            <td>${balju.sujubox}</td>
              <td><button id="sujuletter" onclick="sujuletter('${balju.bno}', '${balju.baljuday}', '${balju.uuid}', '${balju.bname}', '${balju.bcount}','${balju.bsum}','${balju.bproduct}', '${balju.pprice}','${balju.bnumber}','${balju.pcode}', '${ balju.sujubox}')">확인</button></td>					
          </tr>
          </c:forEach>
          <!-- 반복문으로 데이터 가져오기 -->
        </tbody>
      </table>

    </div>

    
  </div>
</div>


</body>
</html>