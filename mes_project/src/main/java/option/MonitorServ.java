package option;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.free.BoardDTO;
@WebServlet("/monitor")
public class MonitorServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		try {
			playOp(request, response);
		} catch (IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	void playOp(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		Connection con = getConn();
		List list = new ArrayList();
		String query = "";
		query += " select";
		query += " *";
		query += " from";
		query += " equipment";

		System.out.println("query : " + query);
		PreparedStatement ps = con.prepareStatement(query);

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			int seq = rs.getInt("e_sequence");
			String grade = rs.getString("e_grade");
			int count = rs.getInt("e_count");
			String gpu = rs.getString("e_gpu");
			String ssd = rs.getString("e_ssd");
			String ram = rs.getString("e_ram");
			String cpu = rs.getString("e_cpu");
			String cool = rs.getString("e_쿨러");
			String main = rs.getString("e_메인보드");
			String power = rs.getString("e_파워");
			String nDate = rs.getString("nDate");

			List stock = new ArrayList();
			
			stock.add(seq);
			stock.add(grade);
			stock.add(count);
			stock.add(gpu);
			stock.add(ssd);
			stock.add(ram);
			stock.add(cpu);
			stock.add(cool);
			stock.add(main);
			stock.add(power);
			stock.add(nDate);

			list.add(stock);
		}
		rs.close();
		ps.close();
		con.close();

		request.setAttribute("list", list);

		//	디스패쳐 포워드로 jsp로 보낸다.
		RequestDispatcher dispatch = request.getRequestDispatcher("process.jsp");

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
		String user = "scott4_3";
		String password = "tiger";

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
