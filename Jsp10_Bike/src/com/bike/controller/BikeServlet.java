package com.bike.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bike.dao.BikeDao;
import com.bike.dto.BikeDto;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
@WebServlet("/bike")
public class BikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("command:"+command);
		
		BikeDao dao = new BikeDao();
		
		if(command.equals("first")) {
			response.sendRedirect("bike01.jsp");
		}else if(command.equals("first_db")) {
			
			int deleteres = dao.delete();
			if(deleteres>0) {
				System.out.println("\n delete 성공\n");
			}else {
				System.out.println("\n delete 실패\n");
			}
			
			String[] bikeList = request.getParameterValues("bike");
			
			List<BikeDto> dtos = new ArrayList<BikeDto>();
			for(int i=0; i<bikeList.length; i++) {
				String[] tmp = bikeList[i].split("/");
				BikeDto dto = new BikeDto(tmp[0],
										  Integer.parseInt(tmp[1]),
										  tmp[2],
										  tmp[3],
										  Integer.parseInt(tmp[4]),
										  Double.parseDouble(tmp[5]), 
										  Double.parseDouble(tmp[6]));
				dtos.add(dto);
			}
			
			
			int res = dao.insert(dtos);
			
			if(res>0) {
				System.out.println("\ninsert 성공!\n");
				response.sendRedirect("index.html");
			}else {
				System.out.println("\ninsert 실패...\n");
				response.sendRedirect("bike01.jsp");
			}
			
		}else if(command.equals("second")) {
			response.sendRedirect("bike02.jsp");
		}else if(command.equals("second_db")) {
			
			int res = dao.delete();
			if(res>0) {
				System.out.println("삭제 성공");
			}else {
				System.out.println("삭제 실패");
			}
			
			String obj = request.getParameter("obj");
			//System.out.println(obj);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(obj);
			
			List<BikeDto> dtos = new ArrayList<>();
			
			for(int i=0; i<element.getAsJsonObject().get("DATA").getAsJsonArray().size(); i++) {
				JsonObject tmp = element.getAsJsonObject().get("DATA").getAsJsonArray().get(i).getAsJsonObject();
				
				String addr_gu = tmp.get("addr_gu").getAsString();
				int content_id = tmp.get("content_id").getAsInt();
				String content_nm = tmp.get("content_nm").getAsString();
				String new_addr = tmp.get("new_addr").getAsString();
				int cradle_count = tmp.get("cradle_count").getAsInt();
				double longitude = tmp.get("longitude").getAsDouble();
				double latitude = tmp.get("latitude").getAsDouble();
				
				BikeDto dto = new BikeDto(addr_gu,content_id,content_nm,new_addr,cradle_count,longitude,latitude);
				dtos.add(dto);
			}
			
			int result = dao.insert(dtos);
			if(result>0) {
				System.out.println("\ninsert 성공\n");
			}else {
				System.out.println("\ninsert 실패\n");
			}
			
			PrintWriter out = response.getWriter();
			out.println(result);
		}
		
		
	}
	
	
	
	
	
	
	
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
