<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ page import="com.login.dto.MyMemberDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function registForm(){
		location.href="membercontroller.jsp?command=registform";
	}
</script>
</head>
<body>
<div style="width:300px;">
	<h1 style="text-align:center">LOGIN</h1>
	<form action="membercontroller.jsp">
		<input type="hidden" name="command" value="login">
		<table>
			<col width="100"><col width="100">
			<tr>
				<th>I D</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>P W</th>
				<td><input type="text" name="pw"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="login">
					<input type="button" value="regist" onclick="registForm()">
				</td>
			</tr>
		</table>	
	</form>

</div>
</body>
</html>