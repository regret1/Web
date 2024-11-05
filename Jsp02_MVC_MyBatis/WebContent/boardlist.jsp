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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript">
	$(function(){
	    $("#muldelform").submit(function(){
	        if($("#muldelform input:checked").length == 0) { // Added closing parenthesis here
	            alert("하나 이상 체크해 주세요!");
	            return false;
	        }
	    });
	});
</script>
</head>
<body>
<% List<MVCBoardDto> list = (List<MVCBoardDto>)request.getAttribute("allList"); %>

<h1>LIST</h1>
<form action="mycontroller.jsp" method="post" id="muldelform">
<input type="hidden" name="command" value="muldel">
<table border="1">
	<col width="50px">
	<col width="100px">
	<col width="300px">
	<col width="100px">
	<tr>
		<th>&nbsp;&nbsp;</th>
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
				<td><input type="checkbox" name="chk" value="<%=dto.getSeq() %>"></td>
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
		<td colspan="5">
		<input type="submit" value="삭제">
			<input type="button" value="write" onclick="location.href='mycontroller.jsp?command=boardinsertform'">
		</td>
	</tr>
</table>




</form>
</body>
</html>