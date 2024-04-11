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

@WebServlet("/oi")
public class Oracle_Insert extends HttpServlet {
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
			System.out.println("Oracle 드라이버 로딩 성공 OI");

			Connection con = DriverManager.getConnection(url, user, password);
			System.out.println("Connection 생성 성공");

//			String itemName = request.getParameter("mesid");
			String itemName = request.getParameter("itemName");
			String itemName2 = request.getParameter("itemName2");
		//	String itemIndex1 = request.getParameter("itemIndex1");
			String itemIndex2 = request.getParameter("itemIndex2");
			String itemPrice = request.getParameter("itemPrice");
			String itemGLoc = request.getParameter("itemGLoc");
			String itemGNumber = request.getParameter("itemGNumber");
			String itemBLoc = request.getParameter("itemBLoc");
			String itemBNumber = request.getParameter("itemBNumber");
			String errorMessage = request.getParameter("errorMessage");

			
			System.out.println(itemName);
			
			
			if (itemName.trim().equals("")) {
				System.out.println("물품 이름을 입력하세요");
			} else if (itemGLoc.trim().equals("")) {
				System.out.println("양품수량을 입력하세요");
			} else if (itemGNumber.trim().equals("")) {
				System.out.println("양품재고위치를 입력하세요");
			} else if (itemBLoc.trim().equals("")) {
				System.out.println("불량수량을 입력하세요");
			} else if (itemBNumber.trim().equals("")) {
				System.out.println("불량재고위치를 입력하세요");
			} else {
				String query = "";
				query += " insert";
				query += " into";
				query += " mes";

				// mesid는 기본 시퀀스라서 어디서 받아오는 값이 아니다.
				query += " (mesId, mesName, mesGrade, mesContent, mesPrice, gCount, gLoc, bCount, bLoc)";
				query += " values";
				query += " (mesId.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";

				System.out.println("query : " + query);
				PreparedStatement ps = con.prepareStatement(query);

				ps.setString(1, itemName);
				ps.setString(2, itemName2);
				//ps.setString(3, itemIndex1);
				ps.setString(3, itemIndex2);
				ps.setString(4, itemPrice);
				ps.setString(5, itemGNumber);
				ps.setString(6, itemGLoc);
				ps.setString(7, itemBNumber);
				ps.setString(8, itemBLoc);

				int count = ps.executeUpdate();

				ps.close();
				con.close();
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // 얘가 오라클을 사용할 수 있게 해줌

//		ot.set품목(품목);
//		ot.set품목(품목);

//		리스트에 담아 
//		리퀘스트에 모든 내용을 담아서

//		디스패쳐 포워드로 jsp로 보낸다.
//		RequestDispatcher dispatch = request.getRequestDispatcher("ot");
		response.sendRedirect("ot");
//		추가물품 설명에 대한 코딩

	}

}
