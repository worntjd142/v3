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
<div class="form-group">
	<label>동적테이블 행추가하기</label>
	<button type=button class='btn btn-default' id='btn_add' style='float:right; margin-bottom:5px;'>추가버튼</button>	
</div>

<table id='table_ipaddr'> 	
	<tbody>
	<c:forEach items="${test}" var="test">
	<tr>
		<td>
			<div class="label_group">
			<label for="manager_ipaddr_label">행</label>
			</div>
		</td>
		<td>	
			<div class="form_group" style="margin:5px;">
				<input name="manager_ipaddr" class="form-control" class='ipaddr' 
                	style='width:300px; float:left; margin-right:5px'>
				<button type="button" name="btn_delete" class="btn btn-default btn-sm" style="height:30px">
				<span class="glyphicon glyphicon-minus"></span>
				</button>
			</div>
		</td>
	</tr>
	</c:forEach>
</tbody>
</table>
</body>
</html>