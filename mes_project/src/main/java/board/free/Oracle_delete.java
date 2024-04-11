package board.free;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Connection;
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

@WebServlet("/dod")
public class Oracle_delete extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		
		try {
			deleteTable(request, response);
		} catch (IOException | SQLException e) {
			e.printStackTrace();
		}
	}

	void deleteTable(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		Connection con = getConn();

		String boardType = request.getParameter("boardType");

		String seq = request.getParameter("seq");
		System.out.println(seq);

		String query = "";
		query += " delete";
		query += " from";
		query += " board";
		query += " where";
		query += " b_sequence";
		query += " = ";
		query += seq;
		if ("자유게시판".equals(boardType)) {
			query += " and boardType = '자유게시판'";
		} else if ("QaA게시판".equals(boardType)) {
			query += " and boardType = 'QaA게시판'";
		} else if ("건의게시판".equals(boardType)) {
			query += " and boardType = '건의게시판'";
		}

		System.out.println("query : " + query);
		PreparedStatement ps = con.prepareStatement(query);

		int count = ps.executeUpdate();

		ps.close();
		con.close();
		response.sendRedirect("dot?boardType=" + URLEncoder.encode(boardType, "UTF-8"));
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
