package com.answer.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.answer.dao.AnswerDao;
import com.answer.dto.AnswerDto;

@WebServlet("/answer.do")
public class AnswerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("{"+command+"}");
		
		AnswerDao dao = new AnswerDao();
		
		if(command.equals("list")) {
			List<AnswerDto> list = dao.selectAll();
			request.setAttribute("list", list);
			RequestDispatcher dis = request.getRequestDispatcher("boardlist.jsp");
			dis.forward(request, response);
			
		}else if(command.equals("writeform")) {
			response.sendRedirect("boardwrite.jsp");
		}else if(command.equals("boardwrite")) {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String writer = request.getParameter("writer");
			
			AnswerDto dto = new AnswerDto();
			dto.setTitle(title);
			dto.setContent(content);
			dto.setWriter(writer);
			
			int res = dao.insert(dto);	
			
			if(res>0) {
				request.setAttribute("msg", "글 작성 성공");
				request.setAttribute("url", "answer.do?command=list");
			}else {
				request.setAttribute("msg", "글 작성 실패");
				request.setAttribute("url", "answer.do?command=writeform");
			}
			
			RequestDispatcher dis = request.getRequestDispatcher("result.jsp");
			dis.forward(request, response);
		}else if(command.equals("detail")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			
			AnswerDto dto = dao.selectOne(boardno);
			request.setAttribute("dto", dto);
			RequestDispatcher dis = request.getRequestDispatcher("boarddetail.jsp");
			dis.forward(request, response);
		}else if(command.equals("updateform")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			
			AnswerDto dto = dao.selectOne(boardno);
			request.setAttribute("dto", dto);
			RequestDispatcher dis = request.getRequestDispatcher("boardupdate.jsp");
			dis.forward(request, response);
		}else if(command.equals("boardupdate")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			AnswerDto dto = new AnswerDto();
			dto.setTitle(title);
			dto.setContent(content);
			dto.setBoardno(boardno);
			
			int res = dao.update(dto);
			if(res>0) {
				request.setAttribute("msg", "글 수정 성공");
				request.setAttribute("url", "answer.do?command=detail&boardno="+boardno);
			}else {
				request.setAttribute("msg", "글 수정 실패");
				request.setAttribute("url", "answer.do?command=updateform");
			}
			
			RequestDispatcher dis = request.getRequestDispatcher("result.jsp");
			dis.forward(request, response);
		}else if(command.equals("answerform")) {
			int parentboardno = Integer.parseInt(request.getParameter("parentboardno"));
			
			AnswerDto dto = dao.selectOne(parentboardno);
			
			request.setAttribute("parent", dto);
			RequestDispatcher dis = request.getRequestDispatcher("answerwrite.jsp");
			dis.forward(request, response);
		}else if(command.equals("answerwrite")) {
			int parentboardno = Integer.parseInt(request.getParameter("parentboardno"));
			
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String writer = request.getParameter("writer");
			
			//update groupsq
			AnswerDto parent = dao.selectOne(parentboardno);
			
			int parentgroupno= parent.getGroupno();
			int parentgroupsq = parent.getGroupsq();
			int parenttitletab = parent.getTitletab();
			
			int updateRes = dao.updateAnswer(parentgroupno,parentgroupsq);
			if(updateRes>0) {
				System.out.println("순서 변경 성공");
			}else {
				System.out.println("순서변경실패 or 변경할 글 없음");
			}
			
			AnswerDto dto = new AnswerDto(0,parentgroupno,parentgroupsq+1,parenttitletab+2,title,content,writer,null);
			
			int res = dao.insertAnswer(dto);
			if(res>0) {
				request.setAttribute("msg", "답변글 작성 성공");
				request.setAttribute("url", "answer.do?command=list");
			}else {
				request.setAttribute("msg", "답변글 작성 실패");
				request.setAttribute("url", "answer.do?command=detail*boardno=" + parent.getBoardno());
			}
			
			RequestDispatcher dis = request.getRequestDispatcher("result.jsp");
			dis.forward(request, response);
		}
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		
	}

}
