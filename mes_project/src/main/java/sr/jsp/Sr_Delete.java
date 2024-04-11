package sr.jsp;

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

@WebServlet("/sd")
public class Sr_Delete extends HttpServlet {
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
			System.out.println("---------------------^----------------------");

			String tableName = request.getParameter("tableName");

			String seq = request.getParameter("seq");

			String itemName = request.getParameter("itemName");
			String itemCount = request.getParameter("itemCount");
			String comNum1 = request.getParameter("comNum1");
			String[] itemNames = request.getParameterValues("itemName");
			String[] itemCounts = request.getParameterValues("itemCount");
			String[] comNum1s = request.getParameterValues("comNum1");
			System.out.println("SD " + comNum1);

			if (itemName != null && seq == null) {
			for (int i = 0; i < itemNames.length; i++) {
				System.out.println("SI 랭스" + itemNames.length);

				String query = "";
				query += " insert";
				query += " into";
				query += " ordering";

				// mesid는 기본 시퀀스라서 어디서 받아오는 값이 아니다.
				query += " (orderNumber, mesGrade, co_Number, orderQuantity, orderStatus, userRole)";
				query += " values";
				query += " (orderNumber.nextval, '" + itemNames[i] + "', " +  comNum1s[i] + ", '" +itemCounts[i] + "' , '주문신청중', '관리자')";

				System.out.println("query : " + query);
				PreparedStatement ps = con.prepareStatement(query);
				int count = ps.executeUpdate();
				ps.close();

			}

			System.out.println("---------------------^----------------------");

				String mesid = request.getParameter("mesid");
				System.out.println("반려버튼 mesid :" + mesid);

				for (int i = 0; i < itemNames.length; i++) {
					System.out.println("SI 랭스" + itemNames.length);
					String query = "";
					query += " delete";
					query += " from";

					query += " order_SS";

					query += " where";

					query += " 재고신청내역";
					query += " =";
					query += "?";

					System.out.println("query : " + query);
					PreparedStatement ps = con.prepareStatement(query);
					ps.setString(1, itemNames[i]);
					int count = ps.executeUpdate();

					ps.close();
				}
			} else {

					String query = "";
					query += " delete";
					query += " from";
					query += " order_SS";

					query += " where";
					query += " MESID";
					query += " = ";
					query += " ?";

					System.out.println("query : " + query);
					PreparedStatement ps = con.prepareStatement(query);
					ps.setString(1, seq);
					int count = ps.executeUpdate();

					ps.close();
				}
			

			con.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		response.sendRedirect("SS");

	}

}
