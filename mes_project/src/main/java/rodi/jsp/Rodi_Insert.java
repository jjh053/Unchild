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

@WebServlet("/ri")
public class Rodi_Insert extends HttpServlet {
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
			System.out.println("Oracle 드라이버 로딩 성공 SI");

			Connection con = DriverManager.getConnection(url, user, password);
			System.out.println("Connection 생성 성공");

			String itemName = request.getParameter("itemName");
			String itemCount = request.getParameter("itemCount");
			String text_rr1 = request.getParameter("text_rr1");
			String text_rr2 = request.getParameter("text_rr2");

			String text_company = request.getParameter("text_company");
			String text_mesId = request.getParameter("text_mesId");
			String[] text_companys = request.getParameterValues("text_company");
			String[] text_mesIds = request.getParameterValues("text_mesId");

			String[] itemNames = request.getParameterValues("itemName");
			String[] itemCounts = request.getParameterValues("itemCount");
			String[] text_rr1s = request.getParameterValues("text_rr1");
			String[] text_rr2s = request.getParameterValues("text_rr2");

			for (int i = 0; i < itemNames.length; i++) {

				String query = "";
				query += " insert";
				query += " into";
				query += " declaration";

				// mesid는 기본 시퀀스라서 어디서 받아오는 값이 아니다.
				query += " (de_number, s_number, co_number, de_date, de_content, de_result, de_etc, 품목, 수량)";
				query += " values";
				query += " (de_number.nextval, '" + text_mesIds[i] + "', " + text_companys[i] + ", NULL , '" + text_rr1s[i] + "' ,'" + "요청완료" + "', '"+ text_rr2s[i] +"', '"+itemNames[i]+"', '"+ itemCounts[i]+"')";

				System.out.println("query : " + query);
				PreparedStatement ps = con.prepareStatement(query);
				int count = ps.executeUpdate();
				ps.close();
			}

			con.close();

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
		response.sendRedirect("rodi");
//		추가물품 설명에 대한 코딩

	}

}
