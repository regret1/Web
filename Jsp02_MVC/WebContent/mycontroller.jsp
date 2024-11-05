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
<%
	String command = request.getParameter("command");
	
	System.out.println("[command: " +command + "]");
	MVCBoardDao dao = new MVCBoardDao();
	
	if(command.equals("boardlist")){
		List<MVCBoardDto> list = dao.selectAll();
		
		request.setAttribute("allList", list);
		
		pageContext.forward("boardlist.jsp");
		//페이지 이동
		/*
			1.forward()
			request에 담긴 값이 유효(유지).
			req,res객체가 유지.
			:pageContext.forward(), <jsp:forward>, requestDispatcher
			
			2. redirect
			새로운 페이지 요청한것과 같은 방식으로 이동.
			req,res객체가 유지되지 않는다.
			: response.sendRedirect(),
		*/
	}else if(command.equals("boardinsertform")){
		response.sendRedirect("boardinsert.jsp");
	}else if(command.equals("boardinsert")){
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		MVCBoardDto dto = new MVCBoardDto();
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content);
		
		int res = dao.insert(dto);
		
		if(res>0){
			request.setAttribute("msg", "글 작성 성공");
			request.setAttribute("url", "mycontroller.jsp?command=boardlist");
		}else{
			request.setAttribute("msg", "글 작성 실패");
			request.setAttribute("url", "mycontroller.jsp?command=boardinsertform");
		}
		
		pageContext.forward("result.jsp");
	}else if(command.equals("boarddetail")){
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		MVCBoardDto dto = dao.selectOne(seq);
		
		request.setAttribute("dto", dto);
		pageContext.forward("boarddetail.jsp");
		
	}else if(command.equals("boardupdateform")){
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		MVCBoardDto dto = dao.selectOne(seq);
		
		request.setAttribute("dto", dto);
		pageContext.forward("boardupdate.jsp");
	}else if(command.equals("boardupdate")){
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		MVCBoardDto dto = new MVCBoardDto();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setSeq(seq);
		
		int res = dao.update(dto);
		
		if(res>0){
			request.setAttribute("msg", "글 수정 성공");
			request.setAttribute("url","mycontroller.jsp?command=boarddetail&seq="+seq);
		}else{
			request.setAttribute("msg", "글 수정 실패");
			request.setAttribute("url","mycontroller.jsp?command=boarddetail&seq="+seq);
		}
		pageContext.forward("result.jsp");
	}else if(command.equals("boarddelete")){
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		int res = dao.delete(seq);

		if(res>0){
			request.setAttribute("msg", "글 삭제 성공");
			request.setAttribute("url", "mycontroller.jsp?command=boardlist");
		}else{
			request.setAttribute("msg", "글 삭제 실패");
			request.setAttribute("url","mycontroller.jsp?command=boarddetail&seq="+seq);
		}
		pageContext.forward("result.jsp");
	}
%>
</body>
</html>