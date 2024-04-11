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

@WebServlet("/ou")
public class Oracle_Update extends HttpServlet {
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

			String mesid = request.getParameter("mesid");
			System.out.println(mesid);
			
			String record_name = request.getParameter("record_name");
			String record_origin = request.getParameter("record_origin");
			String itemIndex2 = request.getParameter("itemIndex2");
			String itemPrice = request.getParameter("itemPrice");
			String itemGLoc = request.getParameter("itemGLoc");
			String itemGNumber = request.getParameter("itemGNumber");
			String itemBLoc = request.getParameter("itemBLoc");
			String itemBNumber = request.getParameter("itemBNumber");

			String query = "";
			query += " update";
			query += " mes";
			query += " set";
			
			query += " mesName";
			query += " = ";
			query += "?";
			query += ",";
			
			query += " mesGrade";
			query += " = ";
			query += "?";
			query += ",";
			
			query += " mesContent";
			query += " = ";
			query += "?";
			query += ",";	
			
			
			query += " mesPrice";
			query += " = ";
			query += "?";
			query += ",";
			
			query += "gCount";
			query += " = ";
			query += "?";
			query += ",";
			
			query += " gLoc";
			query += " = ";
			query += "?";
			query += ",";
			
			query += " bCount";
			query += " = ";
			query += "?";
			query += ",";
			
			query += " bLoc";
			query += " = ";
			query += "?";
			
			query += " where";
			query += " mesid";
			query += " = ";
			query += "?";

			System.out.println("query : " + query);
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setString(1, record_name);
			ps.setString(2, record_origin);
			ps.setString(3, itemIndex2);
			ps.setString(4, itemPrice);
			ps.setString(5, itemGNumber);
			ps.setString(6, itemGLoc);
			ps.setString(7, itemBNumber);
			ps.setString(8, itemBLoc);
			ps.setString(9, mesid);

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
