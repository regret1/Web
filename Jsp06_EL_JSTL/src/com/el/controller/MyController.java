package com.el.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/controller.do")
public class MyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		
		if(command.equals("elpage")) {
			response.sendRedirect("basic.jsp");
		}else if(command.equals("eltest")) {
			Score sc = new Score("이창진",100,66,83);
			
			request.setAttribute("sc", sc);
			
			RequestDispatcher dis = request.getRequestDispatcher("eltest.jsp");
			dis.forward(request, response);
			
		}else if(command.equals("jstlpage")) {
			List<Score> res = new ArrayList<Score>();
			for(int i=1;i<6;i++) {
				Score sc = new Score("이름"+i,70+i,80+i,90+i);
				res.add(sc);
			}
			
			request.setAttribute("list", res);
			RequestDispatcher dis = request.getRequestDispatcher("jstlpage.jsp");
			dis.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
