<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table class="table">
  <thead>
    <tr>
      <th scope="col">제품명</th>
      <th scope="col">제품단가</th>
      <th scope="col">주문수량</th>
      <th scope="col">합계</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><input type="text" name="pproduct" id="auto_product"></td>
      <td><input type="text" name="pprice" id="pprice"></td>
      <td><input type="text" name="ocount" id="ocount" onkeyup="count()"> </td>
      <td><input type="text" name="osum" id="total"></td>
    </tr>
  </tbody>
</table>


</body>
</html>