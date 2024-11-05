<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>글 수정</h1>
<form action="controller.do" method="post">
	<input type="hidden" name="command" value="boardupdate">
	<input type="hidden" name="seq" value="${dto.seq }">
	<table>
		<tr>
			<th>번호</th>
			<td>${dto.seq }</td>
		</tr>	
		<tr>
			<th>작성일</th>
			<td>${dto.regdate }</td>
		</tr>	
		<tr>
			<th>작성자</th>
			<td>${dto.writer }</td>
		</tr>	
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" value="${dto.title }"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="40" name="content" >${dto.content }</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="수정">
				<input type="button" value="취소" onclick="history.back();">
			</td>
		</tr>
	</table>
</form>
</body>
</html>