package com.pc.emp.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.pc.emp.dto.Main_DTO;

import board.free.BoardDTO;

@WebServlet("/main")
public class Main_Select extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 정장훈
		test(request, response);
		// 이도연
		try {
			showSuggestBoard(request, response);
		} catch (IOException | SQLException e) {
			e.printStackTrace();
			System.out.println("건의게시판 못들어감");
		}
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
		List list = new ArrayList();
		List list2 = new ArrayList();
		List list3 = new ArrayList();

		try {
			Class.forName(driver);
			System.out.println("Oracle 드라이버 로딩 성공");

			Connection con = DriverManager.getConnection(url, user, password);
			System.out.println("Connection 생성 성공 OT");

			String name = request.getParameter("name");
			String query = "";
			query += " select";
			query += " *";
			query += " from";
			query += " mes";

			query += " where lower(품목) like '%' || lower(?) || '%'";
			System.out.println("query : " + query);
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				// get타입(getInt, getString, getDate), 전달인자로 컬럼명, 대소문자 구분 없음
				int mesid = rs.getInt("mesid");
				String 품목명 = rs.getString("품목명");
				String 품목 = rs.getString("품목");
				String 물품설명1 = rs.getString("물품설명1");
				String 물품설명2 = rs.getString("물품설명2");
				int 가격 = rs.getInt("가격");
				int 양품수량 = rs.getInt("양품수량");
				String 양품재고위치 = rs.getString("양품재고위치");
				int 불량수량 = rs.getInt("불량수량");
				String 불량재고위치 = rs.getString("불량재고위치");

//				oracle_test ot = new oracle_test();

				Main_DTO DTO = new Main_DTO();
				DTO.setMesid(mesid);
				DTO.set물품설명1(물품설명1);
				DTO.set물품설명2(물품설명2);
				DTO.set품목명(품목명);
				DTO.set품목(품목);
				DTO.set가격(가격);
				DTO.set양품수량(양품수량);
				DTO.set양품재고위치(양품재고위치);
				DTO.set불량수량(불량수량);
				DTO.set불량재고위치(불량재고위치);

				list.add(DTO);

			}
			rs.close();
			ps.close();
			
			
			
			String query2 = "";
			query2 += " select";
			query2 += " *";
			query2 += " from";
			query2 += " cpm";
			
		//	query2 += " where lower(품목) like '%' || lower(?) || '%'";
			System.out.println("query2 : " + query2);
			PreparedStatement ps2 = con.prepareStatement(query2);
			
			//ps2.setString(1, name);
			
			
			ResultSet rs2 = ps2.executeQuery();
			
			while (rs2.next()) {
				// get타입(getInt, getString, getDate), 전달인자로 컬럼명, 대소문자 구분 없음
				int 월간번호 = rs2.getInt("월간번호");
				String 월간등급 = rs2.getString("월간등급");
				String 월간완제품 = rs2.getString("월간완제품");
				String 월간불량품 = rs2.getString("월간불량품");
				
				Main_DTO DTO2 = new Main_DTO();
				DTO2.set월간번호(월간번호);
				DTO2.set월간등급(월간등급);
				DTO2.set월간완제품(월간완제품);
				DTO2.set월간불량품(월간불량품);

				list2.add(DTO2);


			}

			rs2.close();
			ps2.close();
			
			
			String query3 = "";
			query3 += " select";
			query3 += " *";
			query3 += " from";
			query3 += " cpd";
			
		//	query2 += " where lower(품목) like '%' || lower(?) || '%'";
			System.out.println("query3 : " + query3);
			PreparedStatement ps3 = con.prepareStatement(query3);
			
			//ps2.setString(1, name);
			
			
			ResultSet rs3 = ps3.executeQuery();
			
			while (rs3.next()) {
				// get타입(getInt, getString, getDate), 전달인자로 컬럼명, 대소문자 구분 없음
				int 일일번호 = rs3.getInt("일일번호");
				String 일일등급 = rs3.getString("일일등급");
				String 일일완제품 = rs3.getString("일일완제품");
				String 일일불량품 = rs3.getString("일일불량품");
				
				Main_DTO DTO3 = new Main_DTO();
				DTO3.set일일번호(일일번호);
				DTO3.set일일등급(일일등급);
				DTO3.set일일완제품(일일완제품);
				DTO3.set일일불량품(일일불량품);

				list3.add(DTO3);


			}

			rs3.close();
			ps3.close();
			

			con.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // 얘가 오라클을 사용할 수 있게 해줌

		request.setAttribute("list2", list);
		request.setAttribute("list3", list2);
		request.setAttribute("list4", list3);

//		디스패쳐 포워드로 jsp로 보낸다.
//		RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/main.jsp");
//		try {
//			dispatch.forward(request, response);
//		} catch (ServletException e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}

	}

	void showSuggestBoard(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		Connection con = getConn();
		List listt = new ArrayList();
		String queryy = "";
		queryy += " select";
		queryy += " *";
		queryy += " from";
		queryy += " board";
		queryy += " where boardType = '건의게시판'";

		System.out.println("queryy : " + queryy);
		PreparedStatement pss = con.prepareStatement(queryy);

//		ps.setString(1, name);
		ResultSet rss = pss.executeQuery();

		while (rss.next()) {
			int seq = rss.getInt("b_sequence");
			String title = rss.getString("b_title");
			String content = rss.getString("b_content");
			String writer = rss.getString("staffno");
			Date wDate = rss.getDate("b_date");
			int hits = rss.getInt("b_view");
			String boardType = rss.getString("boardType");

			BoardDTO dto = new BoardDTO();
			dto.setSeq(seq);
			dto.setTitle(title);
			dto.setContent(content);
			dto.setWriter(writer);
			dto.setWdate(wDate);
			dto.setHits(hits);
			dto.setBoardType(boardType);

			listt.add(dto);
		}
		rss.close();
		pss.close();
		con.close();

		request.setAttribute("list", listt);

		// 디스패쳐 포워드로 jsp로 보낸다.
		RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/main.jsp");

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
