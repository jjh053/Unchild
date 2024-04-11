package rodi.jsp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/rd")
public class Rodi_Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		test(request, response);
	}

	void test(HttpServletRequest request, HttpServletResponse response) throws IOException {

//		들어오는 한글 깨짐 방지
		request.setCharacterEncoding("utf-8");

//		내보내는 한글 깨짐 방지
		response.setContentType("text/html; charset=utf-8;");

		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@112.148.46.134:51521:xe";
		String user = "unchild";
		String password = "mesteam";
		
		
		try {
			Class.forName(driver);
			System.out.println("Oracle 드라이버 로딩 성공");

			Connection con = DriverManager.getConnection(url, user, password);
			System.out.println("Connection 생성 성공");

			String itemName = request.getParameter("itemName");
			String itemCount = request.getParameter("itemCount");
			
			String s_number = request.getParameter("s_number");
			String[] s_numbers = request.getParameterValues("s_number");
			
			String[] itemNames = request.getParameterValues("itemName");
			String[] itemCounts = request.getParameterValues("itemCount");
			
			
			
			
			String mesid = request.getParameter("mesid");
			
			for(int i = 0; i < itemNames.length; i++) {
			String query = "";
			query += " delete";
			query += " from";
			query += " declaration";

			query += " where";
			query += " S_NUMBER";
			query += " =";
			query += " ?";

			
			System.out.println("query : " + query);
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, s_numbers[i]);
			int count = ps.executeUpdate();

			ps.close();
			
			
			// 하려는 것 : 불량 신청을 하게 되면 order_rodi는 삭제, mes에 있는 불량 수량은 0으로 초기화
			// 본 mes의 시퀀스번호를 포링키로 order_rodi에 주고
			// 업데이트문 여기서 하나 더 쓴다.
			
			
			}
			
			
			
			con.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

		response.sendRedirect("rodi");

	}

}
