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
	<tr>
		<td colspan="2">
			<input type="button" value="수정" onclick="location.href='controller.do?command=updateform&seq=${dto.seq}'">
			<input type="button" value="삭제" onclick="deleteChk(${dto.seq });">
			<input type="button" value="목록" onclick="location.href='controller.do?command=list'">
		</td>
	</tr>
</table>
<script type="text/javascript">
	function deleteChk(seq){
		if(window.confirm("삭제 하시겠습니까?")){
			location.href="controller.do?command=delete&seq="+seq;
		}
	}
</script>
</body>
</html>