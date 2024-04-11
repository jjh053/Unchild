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

@WebServlet("/rodi")
public class Rodi_Select extends HttpServlet {
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
		String name = request.getParameter("name");
		List list = new ArrayList();
		List list2 = new ArrayList();
	
		try {
			Class.forName(driver);
			System.out.println("Oracle 드라이버 로딩 성공");

			Connection con = DriverManager.getConnection(url, user, password);
			System.out.println("Connection 생성 성공 OT");

			String query = "";
			query += " select";
			query += " *";
			query += " from";
			query += " mes";
			
			query += " where lower(mesGrade) like '%' || lower(?) || '%'";
			query += " and";
			query += " bCount > 0";
			System.out.println("query : " + query);
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setString(1, name);
		//	System.out.println("///"+name);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				// get타입(getInt, getString, getDate), 전달인자로 컬럼명, 대소문자 구분 없음
				int mesId = rs.getInt("mesId");
				String mesName = rs.getString("mesName");
				String mesGrade = rs.getString("mesGrade");
				String mesContent = rs.getString("mesContent");
				int mesPrice = rs.getInt("mesPrice");
				int gCount = rs.getInt("gCount");
				String gLoc = rs.getString("gLoc");
				int bCount = rs.getInt("bCount");
				String bLoc = rs.getString("bLoc");
				
				
//				oracle_test ot = new oracle_test();
				
			
				Rodi_DTO DTO = new Rodi_DTO();
				DTO.setMesId(mesId);
				DTO.setMesName(mesName);
				DTO.setMesGrade(mesGrade);
				DTO.setMesContent(mesContent);
				DTO.setMesPrice(mesPrice);
				DTO.setGCount(gCount);
				DTO.setGLoc(gLoc);
				DTO.setBCount(bCount);
				DTO.setBLoc(bLoc);
				

				list.add(DTO);

			}

			rs.close();
			ps.close();
			
			
			// 여기에 두번째 리스트

				String query2 = "";
				query2 += " select";
				query2 += " *";
				query2 += " from";
				query2 += " declaration";
				
		//		query += " where lower(품목) like '%' || lower(?) || '%'";
				System.out.println("query : " + query2);
				PreparedStatement ps2 = con.prepareStatement(query2);
				
				//ps.setString(1, name);
			//	System.out.println("///"+name);
				
				ResultSet rs2 = ps2.executeQuery();
				
				while (rs2.next()) {
					// get타입(getInt, getString, getDate), 전달인자로 컬럼명, 대소문자 구분 없음
					int de_number = rs2.getInt("de_number");
					int s_number = rs2.getInt("s_number");
					int co_number = rs2.getInt("co_number");
					int 수량 = rs2.getInt("수량");
					String de_date = rs2.getString("de_date");
					String de_content = rs2.getString("de_content");
					String de_result = rs2.getString("de_result");
					String de_etc = rs2.getString("de_etc");
					String 품목 = rs2.getString("품목");
				
					Rodi_DTO DTO2 = new Rodi_DTO();
					DTO2.setDe_number(de_number);
					DTO2.setS_number(s_number);
					DTO2.setCo_number(co_number);
					DTO2.setDe_date(de_date);
					DTO2.setDe_content(de_content);
					DTO2.setDe_result(de_result);
					DTO2.setDe_etc(de_etc);
					DTO2.set품목(품목);
					DTO2.set수량(수량);

					list2.add(DTO2);

				}

				rs2.close();
				ps2.close();
				
				// 여기까지
			
			con.close();
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // 얘가 오라클을 사용할 수 있게 해줌



		
		
//		ot.set품목(품목);
//		ot.set품목(품목);
		
//		리스트에 담아 
//		리퀘스트에 모든 내용을 담아서
		request.setAttribute("list2", list);
		request.setAttribute("list3", list2);
		request.setAttribute("name", name);
		
		
		
//		디스패쳐 포워드로 jsp로 보낸다.
		RequestDispatcher dispatch = request.getRequestDispatcher("Report_Of_Defective_Inventory.jsp");
		try {
			dispatch.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
//		추가물품 설명에 대한 코딩
		
		
		
		
		
	}

}
