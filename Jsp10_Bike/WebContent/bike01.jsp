<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="js/bike01.js"></script>
</head>
<body>
<h1>bike01</h1>
<form action="bike" method="post">
	<input type="hidden" name="command" value="first_db">
	<input type="submit" value="db에 저장하기">
	
	<table>
		<thead></thead>
		<tbody></tbody>
	</table>
</form>

</body>
</html>