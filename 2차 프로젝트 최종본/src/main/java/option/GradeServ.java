package option;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import option.GradeDTO;

@WebServlet("/grade")
public class GradeServ extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		
		try {
			tableView(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("아무것도 못들어감");
		}
	}
	

	private void tableView(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		Connection con = getConn();

		List<GradeDTO> list = new ArrayList<>();
		String query = "";
		query += " select";
		query += " *";
		query += " from";
		query += " grade";

		System.out.println("query : " + query);
		PreparedStatement ps = con.prepareStatement(query);

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			int gradeNum = rs.getInt("g_sequence");
			String gradeName = rs.getString("g_grade");

			GradeDTO dto = new GradeDTO();
			dto.setGradeNum(gradeNum);
			dto.setGradeName(gradeName);

			list.add(dto);
		}

		rs.close();
		ps.close();
		
		List<StockDTO> list2 = new ArrayList<>();
		String query2 = "";
		query2 += " select";
		query2 += " *";
		query2 += " from";
		query2 += " mes";

		System.out.println("query2 : " + query2);
		PreparedStatement ps2 = con.prepareStatement(query2);

		ResultSet rs2 = ps2.executeQuery();

		while (rs2.next()) {
			int stockNum = rs2.getInt("mesid");
			String stockName = rs2.getString("mesname");
			int stockCount = rs2.getInt("gcount");
			String stockID = rs2.getString("mesgrade");

			StockDTO dto = new StockDTO();
			dto.setStockNum(stockNum);
			dto.setStockName(stockName);
			dto.setStockCount(stockCount);
			dto.setStockID(stockID);

			list2.add(dto);
		}
		rs2.close();
		ps2.close();
		con.close();

		request.setAttribute("list", list);

		request.setAttribute("list2", list2);

		RequestDispatcher dispatch = request.getRequestDispatcher("facilitiespage.jsp");

		try {
			dispatch.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private Connection getConn() {
		// DB 접속
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@112.148.46.134:51521:xe";
		String user = "unchild";
		String password = "mesteam";

		Connection con = null;

		try {
			// 드라이버 로딩
			// Class.forName : String 변수로 class 생성
			Class.forName(driver);

			// DB 접속
			con = DriverManager.getConnection(url, user, password);
			System.out.println("Connection 생성 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("예외");
		}
		return con;
	}
}
