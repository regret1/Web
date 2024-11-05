<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 상세 글 보기</h1>
<table>
	<tr>
		<th>번호</th>
		<td>${dto.seq }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${dto.writer }</td>
	</tr>
	<tr>
		<th>제 목</th>
		<td> 
			<textarea rows="10" cols="40" readonly="readonly">${dto.content }</textarea>
		</td>
	</tr>
</table>
</body>
</html>