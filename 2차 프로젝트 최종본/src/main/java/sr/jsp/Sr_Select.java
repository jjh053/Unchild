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

import test.jsp.Mes_DTO;

@WebServlet("/SS")
public class Sr_Select extends HttpServlet {
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
		String orderingName = request.getParameter("orderingName");
		List list = new ArrayList();
		List list2 = new ArrayList();
		List list3 = new ArrayList();
	
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
				
			
				Sr_DTO DTO = new Sr_DTO();
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
				// 날짜 사용하고 싶으면 import된 클레스명이 같이 때문에
				// java.util.Date 형태로 써야한다.
//				System.out.println("품목 : " + 품목);
//				System.out.println("양품수량 : " + 양품수량);
//				System.out.println("양품재고위치 : " + 양품재고위치);
//				System.out.println("불량수량 : " + 불량수량);
//				System.out.println("불량재고위치 : " + 불량재고위치);
//				System.out.println("---------------------------------------");

//				PrintWriter out = response.getWriter();
//				out.println("<div>품목 : " + 품목 + "</div>");
//				out.println("<div>양품수량 : " + 양품수량 + "</div>");
//				out.println("<div>양품재고위치 : " + 양품재고위치 + "</div>");
//				out.println("<div>불량수량 : " + 불량수량 + "</div>");
//				out.println("<div>불량재고위치 : " + 불량재고위치 + "</div>");
//				out.println("<div>" + "</div>");
//				out.println("<hr>");


			}

			rs.close();
			ps.close();
			
			// 이 위 정상
			// 여기에 두번째 리스트
	
			

			String query2 = "";
			query2 += " select";
			query2 += " *";
			query2 += " from";
			query2 += " order_SS";
			
			
			//query2 += " ordering o, mes m";
			//query2 += " where o.mesId = m.mesId";
			
	//		query += " where lower(품목) like '%' || lower(?) || '%'";
			System.out.println("query : " + query2);
			PreparedStatement ps2 = con.prepareStatement(query2);
			
			//ps.setString(1, name);
		//	System.out.println("///"+name);
			
			ResultSet rs2 = ps2.executeQuery();
			
			while (rs2.next()) {
				// get타입(getInt, getString, getDate), 전달인자로 컬럼명, 대소문자 구분 없음
				int mesId = rs2.getInt("mesId");
				String 재고신청내역 = rs2.getString("재고신청내역");
				int 수량 = rs2.getInt("수량");
				
				
//				oracle_test ot = new oracle_test();
				
			
				Sr_DTO DTO2 = new Sr_DTO();
				DTO2.setMesid(mesId);
				DTO2.setMesGrade(재고신청내역);
				DTO2.setOrderQuantity(수량);
				
				

				list2.add(DTO2);

			}

			rs2.close();
			ps2.close();
			
			// 여기까지
		
			
			
			
			
			// 업체 주문 내역
			
			String query3 = "";
			query3 += " select";
			query3 += " *";
			query3 += " from";
			//query3 += " ordering";
			
			query3 += " ordering";
			query3 += " where lower(mesGrade) like '%' || lower(?) || '%'";
			//query3 += " where o.mesId = m.mesId";
			
			
		//	query3 += " where lower(품목) like '%' || lower(?) || '%'"; 웨어절 두번 못 씀
			System.out.println("query3 : " + query3);
			PreparedStatement ps3 = con.prepareStatement(query3);
			ps3.setString(1, orderingName);
		//	System.out.println("///"+name);
			
			ResultSet rs3 = ps3.executeQuery();
			
			while (rs3.next()) {
				// get타입(getInt, getString, getDate), 전달인자로 컬럼명, 대소문자 구분 없음
				int orderNumber = rs3.getInt("orderNumber");
				System.out.println("됨2");
				System.out.println("orderNumber : "+orderNumber);
				String mesGrade = rs3.getString("mesGrade");
				System.out.println("mesGrade : "+mesGrade);
				int orderQuantity = rs3.getInt("orderQuantity");
				System.out.println("orderQuantity : " + orderQuantity);
				int co_Number = rs3.getInt("co_Number");
				System.out.println("co_Number : " + co_Number);
				String orderStatus = rs3.getString("orderStatus");
				System.out.println("됨?");
				
				
//				oracle_test ot = new oracle_test();
				
			
				Sr_DTO DTO3 = new Sr_DTO();
				DTO3.setOrderNumber(orderNumber);
				DTO3.setMesGrade(mesGrade);
				DTO3.setOrderQuantity(orderQuantity);
				DTO3.setCo_Number(co_Number);
				DTO3.setOrderStatus(orderStatus);
				
				

				list3.add(DTO3);

			}

			rs3.close();
			ps3.close();
			
			
		
			
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
		request.setAttribute("list4", list3);
		request.setAttribute("name", name);
	//	request.setAttribute("orderingName", orderingName);
		
		
		
//		디스패쳐 포워드로 jsp로 보낸다.
		RequestDispatcher dispatch = request.getRequestDispatcher("Stock_Request.jsp");
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
