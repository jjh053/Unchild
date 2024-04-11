package com.pc.emp.dao;

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
import java.text.SimpleDateFormat;


// Data Access Object
public class EmpDAO {

	protected Connection getConn() {
		// DB 접속준비
		String driver = "oracle.jdbc.driver.OracleDriver"; // 오라클에 접속할때 필요.
		String url = "jdbc:oracle:thin:@112.148.46.134:51521:xe";
		String user = "unchild";
		String password = "mesteam";

		Connection con = null;

		try {
			// 드라이버 로딩
			Class.forName(driver);
			System.out.println("Oracle 드라이버 로딩 성공");
			// DB 접속
			con = DriverManager.getConnection(url, user, password);
			System.out.println("Connection 생성 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	
	// update
	public int updateEmp2() {

		int result = -1; // 업데이트 실패 여부 체크가능
		// db접속
		Connection con = getConn();
		// UPDATE SQL start
		String sql = "	UPDATE emp2	SET ename = ?	WHERE empno = ?	";
		// UPDATE SQL end
		System.out.println("sql" + sql);

		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// 결과 활용

		return result;
	}
	// insert
	// delete

}