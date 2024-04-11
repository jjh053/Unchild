package test.jsp;

import java.io.IOException;
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

@WebServlet("/ot")
public class Oracle_Select extends HttpServlet {
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

		
		////////////////////////////////// 페이징 구현///////////////////

		// controller :
		// - 요청에 따라서 service 호출
		// - service의 결과물을 어떤 view로 보낼지 결정

		// service :
		// - 계산 등의 일을 한다.
		// - dao 호출 담당

		// dao :
		// - DB 담당

		// jsp :
		// - view 담당
		String name = request.getParameter("name");
		String pageView = request.getParameter("pageView");
		System.out.println("pageView : " + pageView);
		
		int pageView2 = 10;
		if(pageView != null && !pageView.trim().isEmpty()) {
			pageView2 = Integer.parseInt(pageView);
		}
		
		int pageNum = 1; // 현재 페이지를 저장
		int countPerPage = pageView2; // 한 페이지당 표시 수

		// 널이면 정상작동은 하도록, 안되면 작동은 안하지만 위에적은 페이지 넘버가 적용될 수 있게
		// 안받으면 null 유지하고(위에것 유지되면서 작동되게) 받으면 적용되게
		// 오류발생시 초기값을 사용하게 된다.
		try {
			String tmp_pageNum = request.getParameter("pageNum");
			if (tmp_pageNum != null) {
				pageNum = Integer.parseInt(tmp_pageNum);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		PagingService pagingService = new PagingService();
		int totalCount = pagingService.getTotalPaging();

		List listPaging = pagingService.listPaging(pageNum, countPerPage, name);

		System.out.println("pageNum" + pageNum);
		System.out.println("countPerPage" + countPerPage);
		System.out.println("totalCount" + totalCount);

		request.setAttribute("countPerPage", countPerPage); // 현재 페이지에 표시할 품목 수
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("countPerPage", countPerPage);
		request.setAttribute("totalCount", totalCount);
		// list에서 이름 바꿈 불러올 때 주의
		request.setAttribute("listPaging", listPaging);

		//////////////////////// 페이징 구현 //////////////////
		
		
		
		
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@112.148.46.134:51521:xe";
		String user = "unchild";
		String password = "mesteam";
		List list = new ArrayList();
	
		try {
			Class.forName(driver);
			System.out.println("Oracle 드라이버 로딩 성공");

			Connection con = DriverManager.getConnection(url, user, password);
			System.out.println("Connection 생성 성공 OT");

			name = request.getParameter("name");
			String query = "";
			query += " select";
			query += " *";
			query += " from";
			query += " mes";
			
			query += " where lower(mesGrade) like '%' || lower(?) || '%'";
			System.out.println("query : " + query);
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setString(1, name);
			
			
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
				
			
				Mes_DTO DTO = new Mes_DTO();
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
		
		
//		디스패쳐 포워드로 jsp로 보낸다.
		RequestDispatcher dispatch = request.getRequestDispatcher("Stock_Status.jsp");
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
