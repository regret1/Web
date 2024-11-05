<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>답변 글 작성</h1>
<form action="answer.do" method="post">
<input type="hidden" name="command" value="answerwrite">
<input type="hidden" name="parentboardno" value="${parent.boardno }">
<table>
	<tr>
		<th>작성자</th>
		<td><input type="text" name="writer"></td>
	</tr>
	<tr>
		<th>제 목</th>
		<td><input type="text" name="title" value="RE:${parent.title }"></td>
	</tr>
	<tr>
		<th>내 용</th>
		<td><textarea rows="10" cols="40" name="content"></textarea></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="작성"> 
			<input type="button" value="취소" onclick="location.href='answer.do?command=detail&boardno=${parent.boardno}'">
		</td>
	</tr>
</table>
</form>
</body>
</html>