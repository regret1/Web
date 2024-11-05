<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.my.model.dto.MyBoard" %>
<%@ page import="com.my.model.dao.MyBoardDao" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MyBoardDao dao = new MyBoardDao();
	List<MyBoard> list = dao.selectAll();
	
%>	
<h1>LIST PAGE</h1>	
<table border = "1">
	<col width="50px">
	<col width="100px">
	<col width="200px">
	<col width="100px">
	<tr>
		<th>NO</th>
		<th>NAME</th>
		<th>TITLE</th>
		<th>DATE</th>
	</tr>
<%
	for(int i=0;i<list.size();i++){
%>		
		<tr>
			<td><%=list.get(i).getMyno() %></td>	
			<td><%=list.get(i).getMyname() %></td>	
			<td><a href="selectone.jsp?myno=<%=list.get(i).getMyno()%>"><%=list.get(i).getMytitle() %></a></td>	
			<td><%=list.get(i).getMydate() %></td>	
		</tr>
<%
	}
%>
	<tr>
		<td>
			<button onclick="location.href='myinsert.jsp'">
			WRITE</button>
		</td>
	</tr>
</table>
	
	
</body>
</html>