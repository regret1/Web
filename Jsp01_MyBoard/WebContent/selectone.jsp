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
	//1. 파라미터로 넘어오는 myno 받기
	int myno = Integer.parseInt(request.getParameter("myno"));
	
	MyBoardDao dao = new MyBoardDao();
	MyBoard dto = dao.selectOne(myno);

%>
<table>
	<tr>
		<th>NAME</th>
		<td><%=dto.getMyname() %></td>		
	</tr>
	<tr>
		<th>TITLE</th>
		<td><%=dto.getMytitle() %></td>		
	</tr>
	<tr>
		<th>DATE</th>
		<td><%=dto.getMydate() %></td>		
	</tr>
	<tr>
		<th>CONTENT</th>
		<td>
			<textarea rows="10" cols="40"
			readonly="readonly"><%=dto.getMycontent() %></textarea>
		</td>		
	</tr>
	<tr>
		<td colspan="2">
			<button onclick="location.href='myupdate.jsp?myno=<%=dto.getMyno()%>'">update</button>&nbsp;
			<button onclick="location.href='mydelete.jsp?myno=<%=dto.getMyno()%>'">delete</button>&nbsp;
			<button onclick="location.href='mylist.jsp'">list</button>&nbsp;
		</td>
	</tr>	
</table>


</body>
</html>