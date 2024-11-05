<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>WRITE</h1>
<form action="myinsert_res.jsp" method="post">
	<table>
		<tr>
			<th>NAME</th>
			<td><input type="text" name = "myname"></td>
		</tr>
		<tr>
			<th>TITLE</th>
			<td><input type="text" name = "mytitle"></td>
		</tr>
		<tr>
			<th>CONTENT</th>
			<td><textarea rows="10" cols="60" name = "mycontent"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="write">
				<input type="button" value="cancel" 
				onclick="location.href='mylist.jsp'">	
			</td>
		</tr>
	</table>
</form>
</body>
</html>