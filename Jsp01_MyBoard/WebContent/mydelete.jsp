<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8" ); %>
    
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
	int res = dao.delete(myno);
	
	if(res>0){
%>
	<h1>글 삭제 성공</h1>
	<button onclick="location.href='mylist.jsp'">확인</button>
<%
	}else{
%>
	<h1>글 삭제 실패</h1>
	<button onclick="location.href='selectone.jsp?myno=<%=myno%>'">확인</button>
<%
	}
%>
</body>
</html>