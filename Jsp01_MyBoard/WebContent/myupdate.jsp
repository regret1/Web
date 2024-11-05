<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.my.model.dto.MyBoard" %>
<%@ page import="com.my.model.dao.MyBoardDao" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int myno = Integer.parseInt(request.getParameter("myno"));
	
	MyBoardDao dao = new MyBoardDao();
	MyBoard dto = dao.selectOne(myno);
%>

<form action="myupdate_res.jsp" method="post">
	<input type="hidden" name="myno" value="<%=dto.getMyno()%>">
	<table>
		<tr>
			<th>NAME</th>
			<td><%=dto.getMyname() %></td>
		</tr>
		<tr>
			<th>TITLE</th>
			<td><input type="text" name="mytitle" value="<%=dto.getMytitle() %>"></td>
		</tr>
		<tr>
			<th>DATE</th>
			<td><%=dto.getMydate() %></td>
		</tr>
		<tr>
			<th>CONTENT</th>
			<td><textarea rows="10" cols="40" 
			name="mycontent"><%= dto.getMycontent() %></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="update">
				<input type="button" value="cancel" onclick="history.back();">
			</td>
		</tr>
	</table>
</form>



</body>
</html>