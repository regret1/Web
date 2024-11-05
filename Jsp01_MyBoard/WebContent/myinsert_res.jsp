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
	//1. parameter로 넘어오는 데이터를 받는다.
	String myname = request.getParameter("myname");
	String mytitle = request.getParameter("mytitle");
	String mycontent = request.getParameter("mycontent");
	
	MyBoard dto = new MyBoard(myname,mytitle,mycontent);
	
	//2.db에 저장
	MyBoardDao dao = new MyBoardDao();
	int res = dao.insert(dto);
	
	if(res>0){
%>
		<script type="text/javascript">
			alert("글 등록 성공");
			location.href="mylist.jsp";
		</script>
<%
	}else{
%>
		<script type="text/javascript">
			alert("글 등록 실패");
			location.href="mylist.jsp";
		</script>
		
<%
	}
%>
</body>
</html>