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
		<td>${dto.boardno }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${dto.writer }</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${dto.date }</td>
	</tr>
	<tr>
		<th>제 목</th>
		<td>${dto.title }</td>
	</tr>
	<tr>
		<th>내 용</th>
		<td> 
			<textarea rows="10" cols="40" readonly="readonly">${dto.content }</textarea>
		</td>
	</tr>
	<tr>
		<td colspan = "2">
			<input type="button" value="수정" onclick="location.href='answer.do?command=updateform&boardno=${dto.boardno}'">
			<input type="button" value="답변글" onclick="location.href='answer.do?command=answerform&parentboardno=${dto.boardno}'">
			<input type="button" value="목록" onclick="location.href='answer.do?command=list'">
		</td>
	</tr>
</table>
</body>
</html>