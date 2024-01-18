<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주 메일</title>
</head>
<body>
<form method="post" action="mailsend">
받는 사람<input type="text" name="to"> 
제목 <input type="text" name="Subject">
내용 <textarea name="Text"></textarea>
<input type="submit" value="발송">

</form>

</body>
</html>