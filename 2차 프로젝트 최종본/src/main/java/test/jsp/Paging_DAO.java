package test.jsp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import sec01.ex01.LoggableStatement;

public class Paging_DAO {


	// 목록 조회
	public List<PagingDTO> selectPost(int start, int end, String name) {
		List<PagingDTO> list = new ArrayList<>();

		Connection con = null;
		PreparedStatement ps = null;
		try {
			Context ctx = new InitialContext();
			DataSource dataFactory = (DataSource) ctx.lookup("java:/comp/env/jdbc/teamOne");
			con = dataFactory.getConnection();

			
//			 ROW_NUMBER() OVER (ORDER BY post_seq desc) AS row_num
//			이거 안해주면 순서가 요상해짐
			String query = "";
			query += " SELECT *";
			query += " FROM (";
			query += "    SELECT mesId, mesName, mesGrade, mesContent, mesPrice,";
			query += "    gCount, gLoc, bCount, bLoc,";
			query += "           ROW_NUMBER() OVER (ORDER BY mesId desc) AS row_num";
			query += "    FROM mes";
			query += " where lower(mesGrade) like '%' || lower(?) || '%'";
			query += " )";
			query += " WHERE row_num BETWEEN ? AND ?";
			

//			ps = con.prepareStatement(query);
			ps = new LoggableStatement(con, query);
			ps.setString(1, name);
			ps.setInt(2, start);
			ps.setInt(3, end);
			
			System.out.println(((LoggableStatement) ps).getQueryString());

			// SQL 실행 및 결과 확보
			ResultSet rs = ps.executeQuery();
			
			System.out.println("rs - " + rs);
			
			while (rs.next()) {
				PagingDTO dto = new PagingDTO();
				dto.setMesId(rs.getInt("mesId"));
				dto.setMesName(rs.getString("mesName"));
				dto.setMesGrade(rs.getString("mesGrade"));
				dto.setMesContent(rs.getString("mesContent"));
				dto.setMesPrice(rs.getInt("mesPrice"));
				dto.setGCount(rs.getInt("gCount"));
				dto.setBCount(rs.getInt("bCount"));
				dto.setGLoc(rs.getString("gLoc"));
				dto.setMesGrade(rs.getString("mesGrade"));
				dto.setBLoc(rs.getString("bLoc"));
				dto.setRow_num(rs.getInt("row_num"));

				list.add(dto);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		return list;
	}

	public static int selectTotalEmp() {
		int totalCount = -1;

		Connection con = null;
		PreparedStatement ps = null;
		try {
			Context ctx = new InitialContext();
			DataSource dataFactory = (DataSource) ctx.lookup("java:/comp/env/jdbc/teamOne");
			con = dataFactory.getConnection();

			String query = "";
			query += " select count(*) as cnt";
			query += " from mes";

			ps = con.prepareStatement(query);

			// SQL 실행 및 결과 확보
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				totalCount = rs.getInt("cnt");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		return totalCount;
	}
	
	
	
	
	
	
	
}
