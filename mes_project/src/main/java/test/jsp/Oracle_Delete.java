package test.jsp;

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

@WebServlet("/od")
public class Oracle_Delete extends HttpServlet {

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
			System.out.println("OD Oracle 드라이버 로딩 성공");

			Connection con = DriverManager.getConnection(url, user, password);
			System.out.println("OD Connection 생성 성공");

			String mesid = request.getParameter("mesid");
			System.out.println(mesid);
			
			
			String query = "";
			query += " delete";
			query += " from";
			query += " mes";

			query += " where";
			query += " mesid";
			query += " =";
			query += mesid;

			System.out.println("query : " + query);
			PreparedStatement ps = con.prepareStatement(query);

			int count = ps.executeUpdate();

			ps.close();
			con.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

		response.sendRedirect("ot");

	}

}
