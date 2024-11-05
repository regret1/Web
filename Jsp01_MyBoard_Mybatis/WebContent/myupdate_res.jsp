<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.my.model.dao.MyBoardDao" %>
<%@ page import="com.my.model.dto.MyBoard" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int myno = Integer.parseInt(request.getParameter("myno"));
	String mytitle = request.getParameter("mytitle");
	String mycontent = request.getParameter("mycontent");
	
	MyBoard dto = new MyBoard();
	dto.setMyno(myno);
	dto.setMytitle(mytitle);
	dto.setMycontent(mycontent);
	
	MyBoardDao dao = new MyBoardDao();
	int res = dao.update(dto);
	
	if(res>0){
%>
	<script type="text/javascript">
		alert("글 수정 성공");
		location.href='selectone.jsp?myno=<%=myno%>';
	</script>
<%
	}else{
%>
	<script type="text/javascript">
		alert("글 수정 실패");
		location.href='update.jsp?myno=<%=myno%>';
	</script>
<%
	}
%>
</body>
</html>