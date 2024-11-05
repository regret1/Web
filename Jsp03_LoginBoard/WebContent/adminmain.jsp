<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ page import="com.login.dto.MyMemberDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>ADMIN Main</h1>
<%
	MyMemberDto dto = (MyMemberDto)session.getAttribute("dto"); 
	if(dto==null){
		pageContext.forward("index.jsp");
	}
%>
<div> 
	<span><%= dto.getMyname() %> 님 환영합니다. (등급:<%=dto.getMyrole() %>)</span>
	<button onclick="location.href='membercontroller.jsp?command=logout'">로그아웃</button>
</div>

<div>
	<div>
		<h3><a href="membercontroller.jsp?command=userlistall">회원 정보 조회(all)</a></h3>
	</div>
</div>
</body>
</html>