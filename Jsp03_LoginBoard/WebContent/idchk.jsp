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
	function confirm(bool) {
		if(bool == "true"){
			opener.document.getElementsByName("mypw")[0].focus();
			opener.document.getElementsByName("myid")[0].title="y";
		}else{
			opener.document.getElementsByName("myid")[0].focus();
		}
		self.close();
	}
	
	window.onload=function(){
		let id = opener.document.getElementsByName("myid")[0].value;
		
		document.getElementsByName("id")[0].value = id;
	}
	
</script>
</head>
<body>
<%
	String idnotused = request.getParameter("idnotused");
%>

<table>
	<tr>
		<td><input type="text" name="id" size = "10" readonly="readonly"></td>
	</tr>
	<tr>
		<td><%=idnotused.equals("true") ? "아이디 생성 가능" : "중복된 아이디 입니다." %></td>
	</tr>
	<tr>
		<td>
			<input type="button" value="확인" onclick="confirm('<%=idnotused%>')">
		</td>
	</tr>
</table>
</body>
</html>