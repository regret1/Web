<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ page import="com.login.dto.MyMemberDto" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MyMemberDto dto = (MyMemberDto)session.getAttribute("dto"); 
	if(dto==null){
		pageContext.forward("index.jsp");
	}
%>

<h1>USER Main</h1>
<div> 
	<span><%= dto.getMyname() %> 님 환영합니다. (등급:<%=dto.getMyrole() %>)</span>
	<button onclick="location.href='membercontroller.jsp?command=logout'">로그아웃</button>
	<br>
	<button onclick="location.href='membercontroller.jsp?command=userinfo&myno=<%=dto.getMyno()%>'">내정보보기</button>
</div>
</body>
</html>