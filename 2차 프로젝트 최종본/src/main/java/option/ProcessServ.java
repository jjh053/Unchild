package option;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/proc")
public class ProcessServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			proInsert(request, response);
	}

	void proInsert(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//		들어오는 한글 깨짐 방지
		request.setCharacterEncoding("utf-8");

//		내보내는 한글 깨짐 방지
		response.setContentType("text/html; charset=utf-8;");

		List list = new ArrayList();

		try {
			Connection con = getConn();

			String lineNum = request.getParameter("lineNum");
			String[] lineNums = request.getParameterValues("lineNum");

			String[] grades = new String[lineNums.length];
			for (int i = 0; i < grades.length; i++) {
				if (request.getParameter("grade" + i) != null) {
					grades[i] = request.getParameter("grade" + i);
				}
			}

			LocalDateTime[] date = new LocalDateTime[lineNums.length];
			for (int i = 0; i < grades.length; i++) {
				if (request.getParameter("endProTime" + i) != null) {

					String dateTimeString = request.getParameter("endProTime" + i);
					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

					LocalDateTime dateTime = LocalDateTime.parse(dateTimeString, formatter);

					date[i] = dateTime;
				}
			}

			int[] pass = new int[lineNums.length];
			for (int i = 0; i < grades.length; i++) {
				if (request.getParameter("pass" + i) != null) {
					pass[i] = Integer.parseInt(request.getParameter("pass" + i));
				}
			}

			int[] fail = new int[lineNums.length];
			for (int i = 0; i < grades.length; i++) {
				if (request.getParameter("fail" + i) != null) {
					fail[i] = Integer.parseInt(request.getParameter("fail" + i));
				}
			}

			for (int i = 0; i < lineNums.length; i++) {
				try {
					String query = "";
					query += "update equipment set endtime = ?, pass = ?, fail = ? where lineNum = ?";

					System.out.println("query : " + query);
					PreparedStatement ps = con.prepareStatement(query);

					Timestamp timestamp = Timestamp.valueOf(date[i]);
					ps.setTimestamp(1, timestamp);
					
					ps.setInt(2, pass[i]);
					ps.setInt(3, fail[i]);
					ps.setString(4, lineNums[i]);

					int count = ps.executeUpdate();

					ps.close();
					
					list.add(timestamp);
					list.add(pass[i]);
					list.add(fail[i]);
					list.add(lineNums[i]);
					
				} catch (Exception e) {
					System.out.println("NULL");
				}
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("grade");
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
