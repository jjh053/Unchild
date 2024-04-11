package board.free;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/vcp")
public class ViewCountPlus extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			viewPlus(request, response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	void viewPlus(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
//		들어오는 한글 깨짐 방지
		request.setCharacterEncoding("utf-8");

//		내보내는 한글 깨짐 방지
		response.setContentType("text/html; charset=utf-8;");
		
		Connection con = getConn();
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		String query = "";
		query += " update";
		query += " board";
		query += " set";

		query += " b_view = ( select b_view from board";

		query += " where b_sequence = ?) + 1";

		query += " where b_sequence = ?";
		
		System.out.println("query : " + query);
		
		PreparedStatement ps = con.prepareStatement(query);
		ps.setInt(1, seq);
		ps.setInt(2, seq);
		
		int count = ps.executeUpdate();
		

		System.out.println("------------------------------------------------------");
		System.out.println("                   조회수 정상 증가");
		System.out.println("------------------------------------------------------");
		
		response.sendRedirect("dot");
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
