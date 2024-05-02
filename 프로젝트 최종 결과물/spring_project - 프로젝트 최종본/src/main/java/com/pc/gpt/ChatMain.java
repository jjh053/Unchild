package com.pc.gpt;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pc.gpt.Book_Recommend;

/**
 * Servlet implementation class ChatMain
 */
@WebServlet("/chatmain")
public class ChatMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/main doGet 실행");
		response.sendRedirect("home.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("아작스 들어옴?");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		
		try {
			
			String query = request.getParameter("query");
			
			System.out.println("질문 : " + query);
			
			Book_Recommend brc = new Book_Recommend();
			String result = brc.wrtn_qna(query);
			
			System.out.println("대답 : " + result);
			
			response.getWriter().print(result);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
