package fpm.jsp;

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

@WebServlet("/fs")
public class Fpm_Select extends HttpServlet {
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
		String user = "scott4_2";
		String password = "tiger";
		String name = request.getParameter("name");
		List list = new ArrayList();
		List list2 = new ArrayList();
		List list3 = new ArrayList();

		try {
			Class.forName(driver);
			System.out.println("Oracle 드라이버 로딩 성공");

			Connection con = DriverManager.getConnection(url, user, password);
			System.out.println("Connection 생성 성공 FPM");

			String query = "";
			query += " select";
			query += " *";
			query += " from";
			query += " cpd";

			System.out.println("query : " + query);
			PreparedStatement ps = con.prepareStatement(query);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				// get타입(getInt, getString, getDate), 전달인자로 컬럼명, 대소문자 구분 없음
				int 일일번호 = rs.getInt("일일번호");
				String 일일등급 = rs.getString("일일등급");
				int 일일완제품 = rs.getInt("일일완제품");
				int 일일불량품 = rs.getInt("일일불량품");

				Fpm_DTO DTO = new Fpm_DTO();
				DTO.set일일번호(일일번호);
				DTO.set일일등급(일일등급);
				DTO.set일일완제품(일일완제품);
				DTO.set일일불량품(일일불량품);

				list.add(DTO);

			}

			rs.close();
			ps.close();

			// 여기에 두번째 리스트

			String query2 = "";
			query2 += " select";
			query2 += " *";
			query2 += " from";
			query2 += " cpw";

			System.out.println("query2 : " + query2);
			PreparedStatement ps2 = con.prepareStatement(query2);

			ResultSet rs2 = ps2.executeQuery();

			while (rs2.next()) {
				// get타입(getInt, getString, getDate), 전달인자로 컬럼명, 대소문자 구분 없음
				int 주간번호 = rs2.getInt("주간번호");
				String 주간등급 = rs2.getString("주간등급");
				int 주간완제품 = rs2.getInt("주간완제품");
				int 주간불량품 = rs2.getInt("주간불량품");
				
				Fpm_DTO DTO2 = new Fpm_DTO();
				DTO2.set주간번호(주간번호);
				DTO2.set주간등급(주간등급);
				DTO2.set주간완제품(주간완제품);
				DTO2.set주간불량품(주간불량품);

				list2.add(DTO2);

			}

			rs2.close();
			ps2.close();

			// 세번째 리스트

			String query3 = "";
			query3 += " select";
			query3 += " *";
			query3 += " from";
			query3 += " cpm";

			System.out.println("query3 : " + query3);
			PreparedStatement ps3 = con.prepareStatement(query3);

			ResultSet rs3 = ps3.executeQuery();
			
			while (rs3.next()) {
				int 월간번호 = rs3.getInt("월간번호");
				String 월간등급 = rs3.getString("월간등급");
				int 월간완제품 = rs3.getInt("월간완제품");
				int 월간불량품 = rs3.getInt("월간불량품");
				Fpm_DTO DTO3 = new Fpm_DTO();
				DTO3.set월간번호(월간번호);
				DTO3.set월간등급(월간등급);
				DTO3.set월간완제품(월간완제품);
				DTO3.set월간불량품(월간불량품);

				list3.add(DTO3);

			}

			rs3.close();
			ps3.close();

			con.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // 얘가 오라클을 사용할 수 있게 해줌

		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("name", name);

//		디스패쳐 포워드로 jsp로 보낸다.
		RequestDispatcher dispatch = request.getRequestDispatcher("Finished_product_management.jsp");
		try {
			dispatch.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

}
