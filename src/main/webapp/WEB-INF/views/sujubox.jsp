<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>수주서 함</title>
</head>
<body>

<table border="1">
<tr>
<td><input type="checkbox" id="check_all" ></td>
<td>문서상태</td>
<td>수주일자</td>
 <td>전송일자</td><!-- 수주서 발송일자 -->
 <td>주문번호</td>
 <td>사업자번호</td>
 <td>거래처</td>
 <td>품목</td>
 <td>합계</td>
 <td>결제방법</td>
 <td>배송상태</td>
</tr>
<c:forEach begin="1" end="5" varStatus="a">
<tr>
<td><input type="checkbox" id="check_all" id="check_box${a.index}"></td>
<td></td>
 <td></td><!-- 수주서 발송일자 -->
 <td></td>
 <td></td>
 <td></td>
 <td></td>
 <td></td>
 <td></td>
 <td></td>
 <td></td>
</tr>
</c:forEach>
</table>


</body>
</html>