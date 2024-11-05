<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.mvc.dao.MVCBoardDao" %>
<%@ page import="com.mvc.dto.MVCBoardDto" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% List<MVCBoardDto> list = (List<MVCBoardDto>)request.getAttribute("allList"); %>

<h1>LIST</h1>
<table border="1">
	<col width="50px">
	<col width="100px">
	<col width="300px">
	<col width="100px">
	<tr>
		<th>SEQ</th>
		<th>WRITER</th>
		<th>TITLE</th>
		<th>DATE</th>
	</tr>
<%
	if(list.size()==0){
%>
	<tr>
		<td colspan="4">-----글이 존재하지 않습니다----</td>
	</tr>
<%
	} else{
		for(MVCBoardDto dto:list){
%>
			<tr>
				<td><%=dto.getSeq() %></td>
				<td><%=dto.getWriter() %></td>
				<td><a href="mycontroller.jsp?command=boarddetail&seq=<%=dto.getSeq()%>"><%=dto.getTitle() %></a></td>
				<td><%=dto.getRegdate() %></td>
			</tr>
<%
		}
	}
%>
	<tr>
		<td colspan="4">
			<input type="button" value="write" onclick="location.href='mycontroller.jsp?command=boardinsertform'">
		</td>
	</tr>
</table>





</body>
</html>