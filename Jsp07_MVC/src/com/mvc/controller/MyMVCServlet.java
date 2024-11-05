package com.mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.biz.MyMVCBiz;
import com.mvc.biz.MyMVCBizImpl;
import com.mvc.dto.MyMVCDto;

@WebServlet("/MyMVCServlet")
public class MyMVCServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
	
		MyMVCBiz biz = new MyMVCBizImpl();
		
		if(command.equals("list")) {
			List<MyMVCDto> list =  biz.selectAll();
			request.setAttribute("list", list);
			
			RequestDispatcher dis = request.getRequestDispatcher("boardlist.jsp");
			dis.forward(request, response);
			
		}else if(command.equals("detail")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			MyMVCDto dto = biz.selectOne(seq);
			
			request.setAttribute("dto", dto);
			RequestDispatcher dis = request.getRequestDispatcher("boarddetail.jsp");
			dis.forward(request, response);
			
		}else if(command.equals("writeform")) {
			response.sendRedirect("boardwrite.jsp");
		}else if(command.equals("boardwrite")) {
			String writer = request.getParameter("writer");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			MyMVCDto dto = new MyMVCDto(writer,title,content);
			boolean res = biz.insert(dto);
			
			if(res) {
				request.setAttribute("msg", "글 작성 성공");
				request.setAttribute("url", "controller.do?command=list");
			}else {
				request.setAttribute("msg", "글 작성 실패");
				request.setAttribute("url", "controller.do?command=writeform");
			}
			
			RequestDispatcher dis = request.getRequestDispatcher("result.jsp");
			dis.forward(request, response);
			
		}else if(command.equals("updateform")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			
			MyMVCDto dto = biz.selectOne(seq);
			
			request.setAttribute("dto", dto);
			RequestDispatcher dis = request.getRequestDispatcher("boardupdate.jsp");
			dis.forward(request, response);
		}else if(command.equals("boardupdate")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			MyMVCDto dto = new MyMVCDto();
			dto.setTitle(title);
			dto.setContent(content);
			dto.setSeq(seq);
			
			boolean res = biz.update(dto);
			
			if(res) {
				request.setAttribute("msg", "글 수정 성공");
				request.setAttribute("url", "controller.do?command=detail&seq="+seq);
			}else {
				request.setAttribute("msg", "글 수정 실패");
				request.setAttribute("url", "controller.do?command=updateform");
			}
			
			RequestDispatcher dis = request.getRequestDispatcher("result.jsp");
			dis.forward(request, response);
		}else if(command.equals("delete")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			
			boolean res = biz.delete(seq);
			
			if(res) {
				request.setAttribute("msg", "글 삭제 성공");
				request.setAttribute("url", "controller.do?command=list");
			}else {
				request.setAttribute("msg", "글 삭제 실패");
				request.setAttribute("url", "controller.do?command=detail");
			}
			
			RequestDispatcher dis = request.getRequestDispatcher("result.jsp");
			dis.forward(request, response);
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}


















