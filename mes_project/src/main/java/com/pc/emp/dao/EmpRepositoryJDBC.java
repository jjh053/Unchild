package com.pc.emp.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.pc.emp.dto.Absent;
import com.pc.emp.dto.Account;
import com.pc.emp.dto.Employee;
import com.pc.emp.dto.Role;

public class EmpRepositoryJDBC implements EmpRepository {
	public EmpRepositoryJDBC() {
	}

	@Override // 로그인
	public Account findByUserId(String userId) {
		Account acct = null;
		EmpDAO empDAO = new EmpDAO();
		Connection con = empDAO.getConn();
		String sql = "SELECT * FROM staff WHERE userId = ?";
		System.out.println(sql);
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			System.out.println("userId: " + userId);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				acct = new Account();
				acct.setUserId(rs.getString("userId"));
				acct.setPassword(rs.getString("password"));
				System.out.println("rs.getString(password): " + rs.getString("password"));
				acct.setName(rs.getString("sname"));
				acct.setTel(rs.getString("sphone"));
				acct.setEMail(rs.getString("smail"));
				acct.setEmpno(rs.getInt("staffno"));
				String roleStr = rs.getString("role");
				Role role = Role.fromString(roleStr);
				acct.setRole(role);
			}
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return acct;
	}
	
	public Account findByEmpno(int empno) {
		Account acct = null;
		EmpDAO empDAO = new EmpDAO();
		Connection con = empDAO.getConn();
		String sql = "SELECT * FROM staff WHERE staffno = ?";
		System.out.println(sql);
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, empno);
			System.out.println("empno: " + empno);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				acct = new Account();
				acct.setUserId(rs.getString("userId"));
				acct.setPassword(rs.getString("password"));
				System.out.println("rs.getString(password): " + rs.getString("password"));
				acct.setName(rs.getString("sname"));
				acct.setTel(rs.getString("sphone"));
				acct.setEMail(rs.getString("smail"));
				acct.setEmpno(rs.getInt("staffno"));
				String roleStr = rs.getString("role");
				Role role = Role.fromString(roleStr);
				acct.setRole(role);
			}
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return acct;
	}

	public boolean existsByUserId(String userId) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean exists = false;

		try {
			EmpDAO empDAO = new EmpDAO();
			con = empDAO.getConn();
			String sql = "SELECT COUNT(*) FROM staff WHERE userId = ?";

			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();

			if (rs.next()) {
				exists = rs.getInt(1) > 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return exists;
	}

	// 권한 조회 메소드
	public Role getRole(int empno) {
		EmpDAO empDAO = new EmpDAO();
		Connection con = empDAO.getConn();
		Role role = null; // Role Enum으로 선언
		String sql = "SELECT role FROM staff WHERE staffno = ?"; // 쿼리 수정: role 열 조회
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, empno);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				String roleStr = rs.getString("role"); // 데이터베이스에서 조회한 역할 문자열
				role = Role.fromString(roleStr); // 문자열을 Role Enum으로 변환
			}

			rs.close();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return role; // Role Enum 반환
	}

	// 권한을 업데이트하는 메서드
	public boolean updateRole(int empno, String newRole) {
		EmpDAO empDAO = new EmpDAO();
		Connection con = empDAO.getConn();
		PreparedStatement ps = null;
		boolean updateSuccess = false;

		try {
			con.setAutoCommit(false); // 수동 커밋 모드 설정
			String sql = "UPDATE staff SET role = ? WHERE staffno = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, newRole);
			ps.setInt(2, empno);

			int rowsAffected = ps.executeUpdate();
			if (rowsAffected > 0) {
				updateSuccess = true;
			}

			con.commit(); // 변경사항 커밋
		} catch (Exception e) {
			try {
				con.rollback(); // 예외 발생 시 롤백
			} catch (SQLException se) {
				se.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return updateSuccess;
	}

	@Override
	public List<Account> getAccountList() {
		EmpDAO empDAO = new EmpDAO();
		Connection con = empDAO.getConn();
		List<Account> acctList = new ArrayList<Account>();
		String sql = "SELECT staffno, sname, userId, role FROM staff ORDER BY staffno DESC";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				String userId = rs.getString("userId");
				if (userId == null || userId.trim().isEmpty()) {
					continue;
				}

				Account acct = new Account();
				acct.setEmpno(rs.getInt("staffno"));
				acct.setName(rs.getString("sname"));
				acct.setUserId(rs.getString("userId"));
				String roleStr = rs.getString("role");
				Role role = Role.fromString(roleStr);
				acct.setRole(role);
				// 수정된 부분: 각 행의 정보를 acctList에 추가
				acctList.add(acct);

			}
			rs.close();
			ps.close();
			con.close();

			System.out.println("AcctList contents: " + acctList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return acctList;
	}

	// 계정조회
	public Account getAcct(int empno) {
		EmpDAO empDAO = new EmpDAO();
		Connection con = empDAO.getConn();
		Account acct = null;
		String sql = "SELECT * FROM staff WHERE staffno = ?";
		System.out.println(sql);
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, empno);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				acct = new Account();
				acct.setEmpno(rs.getInt("staffno"));
				acct.setName(rs.getString("sname"));
			}
			rs.close();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return acct;
	}

	public boolean isAccountInfoEmpty(int empno) {
		boolean isEmpty = false;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			EmpDAO empDAO = new EmpDAO();
			con = empDAO.getConn();
			String query = "SELECT userId, password, sphone, smail FROM staff WHERE staffno = ?";
			ps = con.prepareStatement(query);
			ps.setInt(1, empno);
			rs = ps.executeQuery();
			if (rs.next()) {
				isEmpty = (rs.getString("userId") == null || rs.getString("userId").trim().isEmpty())
						&& (rs.getString("password") == null || rs.getString("password").trim().isEmpty())
						&& (rs.getString("sphone") == null || rs.getString("sphone").trim().isEmpty())
						&& (rs.getString("smail") == null || rs.getString("smail").trim().isEmpty());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return isEmpty;
	}

	public boolean updateAccount2(Account acct) {
		Connection con = null;
		PreparedStatement ps = null;
		boolean updateSuccess = false;
		try {
			// 데이터베이스 연결 및 SQL 쿼리 준비
			EmpDAO empDAO = new EmpDAO();
			con = empDAO.getConn();

			System.out.println("User ID: " + acct.getUserId());
			System.out.println("Password: " + acct.getPassword());
			System.out.println("Telephone: " + acct.getTel());
			System.out.println("Email: " + acct.getEMail());
			System.out.println("Employee Number: " + acct.getEmpno());

			// 업데이트할 필드가 없으면 바로 업데이트 실패로 반환
			if ((acct.getUserId() == null && acct.getUserId().isEmpty())
					&& (acct.getPassword() == null && acct.getPassword().isEmpty())
					&& (acct.getTel() == null && acct.getTel().isEmpty())
					&& (acct.getEMail() == null && acct.getEMail().isEmpty())) {
				System.out.println("업데이트 실패: 업데이트할 필드가 없습니다.");
				return false;
			}

			// 필수 필드만 업데이트하는 SQL 쿼리 생성
			StringBuilder sqlBuilder = new StringBuilder("UPDATE staff SET");
			List<Object> params = new ArrayList<>();

			if (acct.getUserId() != null && !acct.getUserId().isEmpty()) {
				sqlBuilder.append(" userId = ?,");
				params.add(acct.getUserId());
			}

			if (acct.getPassword() != null && !acct.getPassword().isEmpty()) {
				sqlBuilder.append(" password = ?,");
				params.add(acct.getPassword());
			}

			if (acct.getTel() != null && !acct.getTel().isEmpty()) {
				sqlBuilder.append(" sphone = ?,");
				params.add(acct.getTel());
			}

			if (acct.getEMail() != null && !acct.getEMail().isEmpty()) {
				sqlBuilder.append(" smail = ?,");
				params.add(acct.getEMail());
			}

			// 마지막 쉼표 제거
			if (sqlBuilder.charAt(sqlBuilder.length() - 1) == ',') {
				sqlBuilder.deleteCharAt(sqlBuilder.length() - 1);
			}

			// WHERE 조건 추가
			sqlBuilder.append(" WHERE staffno = ?");
			String sql = sqlBuilder.toString();
			System.out.println(sql);

			// PreparedStatement 생성 및 파라미터 설정
			ps = con.prepareStatement(sql);
			int paramIndex = 1;
			for (Object param : params) {
				ps.setObject(paramIndex++, param);
			}
			ps.setInt(paramIndex, acct.getEmpno());

			// SQL 쿼리 실행
			int affectedRows = ps.executeUpdate();
			if (affectedRows > 0) {
				updateSuccess = true; // 업데이트 성공
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 해제
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return updateSuccess;
	}

	public boolean updateAccount(Account acct) {
		Connection con = null;
		PreparedStatement ps = null;
		boolean updateSuccess = false;
		try {
			// 데이터베이스 연결 및 SQL 쿼리 준비
			EmpDAO empDAO = new EmpDAO();
			con = empDAO.getConn();

			if (existsByUserId(acct.getUserId())) {
				System.out.println("업데이트 실패: userId가 이미 존재합니다.");
				return false;
			}
			String sql = "UPDATE staff SET userId = ?, password = ?, sphone = ?, smail = ? WHERE staffno = ?";
			System.out.println(sql);

			ps = con.prepareStatement(sql);
			ps.setString(1, acct.getUserId());
			ps.setString(2, acct.getPassword());
			ps.setString(3, acct.getTel());
			ps.setString(4, acct.getEMail());
			ps.setInt(5, acct.getEmpno());

			// 콘솔창 확인 코드 뭉치
			System.out.println("User ID: " + acct.getUserId());
			System.out.println("Password: " + acct.getPassword());
			System.out.println("Telephone: " + acct.getTel());
			System.out.println("Email: " + acct.getEMail());
			System.out.println("Employee Number: " + acct.getEmpno());
			//

			// SQL 쿼리 실행
			int affectedRows = ps.executeUpdate();
			if (affectedRows > 0) {
				updateSuccess = true; // 업데이트 성공
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 해제
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return updateSuccess;
	}

	// 휴가신청
	public boolean updateAbsent(Absent absent) {
		Connection con = null;
		PreparedStatement ps = null;
		boolean updateSuccess = false;
		try {
			// 데이터베이스 연결 및 SQL 쿼리 준비
			EmpDAO empDAO = new EmpDAO();
			con = empDAO.getConn();

			// Absent 업데이트 쿼리
			String sql = "INSERT INTO absent (start_date, end_date, reason, staffno) VALUES (?, ?, ?, ?)";
			ps = con.prepareStatement(sql);

			// Absent 객체의 startDate와 endDate는 이미 java.sql.Date 타입이므로 직접 설정
			ps.setDate(1, absent.getStartDate());
			ps.setDate(2, absent.getEndDate());
			ps.setString(3, absent.getReason());
			ps.setInt(4, absent.getEmpno());

			// 콘솔창 확인 코드
			System.out.println("Start Date: " + absent.getStartDate());
			System.out.println("End Date: " + absent.getEndDate());
			System.out.println("Reason: " + absent.getReason());
			System.out.println("Employee Number: " + absent.getEmpno());

			// SQL 쿼리 실행
			int affectedRows = ps.executeUpdate();
			if (affectedRows > 0) {
				updateSuccess = true; // 업데이트 성공
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 해제
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return updateSuccess;
	}

	// 휴가 신청 리스트
	public List<Absent> getAbsentList() {
		List<Absent> absentList = new ArrayList<>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			EmpDAO empDAO = new EmpDAO();
			con = empDAO.getConn(); // 데이터베이스 연결
			String sql = "SELECT id, staffno, start_date, end_date, reason, status FROM absent ORDER BY id DESC";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				Absent absent = new Absent();
				absent.setId(rs.getInt("id"));
				absent.setEmpno(rs.getInt("staffno"));
				absent.setStartDate(rs.getDate("start_date"));
				absent.setEndDate(rs.getDate("end_date"));
				absent.setReason(rs.getString("reason"));
				absent.setStatus(rs.getString("status"));
				absentList.add(absent);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 해제
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return absentList;
	}

	// 휴가 신청 리스트 마이페이지용
	public List<Absent> getAbsentList(int empno) {
		List<Absent> absentList = new ArrayList<>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			EmpDAO empDAO = new EmpDAO();
			con = empDAO.getConn(); // 데이터베이스 연결
			// empno를 기준으로 필터링하는 조건을 WHERE 절에 추가
			String sql = "SELECT id, staffno, start_date, end_date, reason, status FROM absent WHERE staffno = ? ORDER BY id DESC";
			ps = con.prepareStatement(sql);
			ps.setInt(1, empno); // 첫 번째 물음표(?)에 empno 값 할당
			rs = ps.executeQuery();

			while (rs.next()) {
				Absent absent = new Absent();
				absent.setId(rs.getInt("id"));
				absent.setEmpno(rs.getInt("staffno"));
				absent.setStartDate(rs.getDate("start_date"));
				absent.setEndDate(rs.getDate("end_date"));
				absent.setReason(rs.getString("reason"));
				absent.setStatus(rs.getString("status"));
				absentList.add(absent);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 해제
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return absentList;
	}

	// 휴가 신청 승인 반려 메소드
	public boolean updateAbsentStatus(int absentId, String newStatus) {
		Connection con = null;
		PreparedStatement ps = null;
		boolean updateSuccess = false;
		try {
			// 데이터베이스 연결 및 SQL 쿼리 준비
			EmpDAO empDAO = new EmpDAO();
			con = empDAO.getConn();

			// 상태 업데이트 쿼리
			String sql = "UPDATE absent SET status = ? WHERE id = ?";
			ps = con.prepareStatement(sql);

			// 쿼리 파라미터 설정
			ps.setString(1, newStatus);
			ps.setInt(2, absentId);

			// 콘솔창 확인 코드
			System.out.println("Updating status of absent ID: " + absentId + " to " + newStatus);

			// SQL 쿼리 실행
			int affectedRows = ps.executeUpdate();
			if (affectedRows > 0) {
				updateSuccess = true; // 업데이트 성공
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 해제
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return updateSuccess;
	}

	@Override // 직원 목록 조회 메소드
	public List<Employee> getEmpList(Employee employee) {
		// DB 호출
		EmpDAO empDAO = new EmpDAO();
		Connection con = empDAO.getConn();
		List<Employee> empList = new ArrayList<Employee>();
		// sql문 작성
		String sql = "SELECT * FROM staff WHERE lower(sname) LIKE '%' || lower(?) || '%' ORDER BY staffno ASC";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, employee.getName());
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Employee emp = new Employee();
				emp.setEmpno(rs.getInt("staffno"));
				emp.setName(rs.getString("sname"));
				emp.setHiredate(rs.getDate("hiredate"));
				emp.setDuty(rs.getString("sduty"));
				emp.setSal(rs.getInt("sal"));
				emp.setDeptno(rs.getInt("offino"));
				empList.add(emp);
			}

			rs.close();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return empList;
	}

	// 직원 정보 조회
	public Employee getEmp(int empno) {
		// DB 호출
		EmpDAO empDAO = new EmpDAO();
		Connection con = empDAO.getConn();
		Employee emp = null;
		// sql문 작성
		String sql = "SELECT * FROM staff WHERE staffno = ?";
		System.out.println(sql);
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, empno);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				emp = new Employee();
				emp.setEmpno(rs.getInt("staffno"));
				emp.setName(rs.getString("sname"));
				emp.setDuty(rs.getString("sduty"));
				emp.setSal(rs.getInt("sal"));
				emp.setDeptno(rs.getInt("offino"));

			}

			rs.close();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return emp;
	}

	// 직원 추가
	public boolean addEmp(Employee emp) {
		EmpDAO empDAO = new EmpDAO();
		Connection con = empDAO.getConn();
		// SQL INSERT 문
		String sql = "INSERT INTO staff (sname, hiredate, sduty, sal, offino) VALUES (?, ?, ?, ?, ?)";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, emp.getName());
			ps.setDate(2, new Date(emp.getHiredate().getTime())); // java.util.Date를 java.sql.Date로 변환
			ps.setString(3, emp.getDuty());
			ps.setInt(4, emp.getSal());
			ps.setInt(5, emp.getDeptno());

			int result = ps.executeUpdate(); // SQL 실행

			ps.close();
			con.close();

			return result > 0; // 삽입 성공 여부 반환 (성공하면 true, 실패하면 false)
		} catch (SQLException e) {
			e.printStackTrace();
			return false; // 예외 발생 시 실패로 처리
		}
	}

	// 직원 수정
	public boolean updateEmp(Employee employee) {
		try {
			EmpDAO empDAO = new EmpDAO();
			Connection con = empDAO.getConn();
			String sql = "UPDATE staff SET sname=?, sduty=?, sal=?, offino=? WHERE staffno=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, employee.getName());
			ps.setString(2, employee.getDuty());
			ps.setInt(3, employee.getSal());
			ps.setInt(4, employee.getDeptno());
			ps.setInt(5, employee.getEmpno());
			int result = ps.executeUpdate();
			ps.close();
			con.close();
			return result > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	// 직원 삭제
	public boolean deleteEmp(int empno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean isDeleted = false;

		try {
			EmpDAO empDAO = new EmpDAO();
			conn = empDAO.getConn();
			String sql = "DELETE FROM staff WHERE staffno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, empno);

			int rowsAffected = pstmt.executeUpdate();
			isDeleted = rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return isDeleted;
	}

	// 직원 번호 중복체크
	public boolean isEmpNumberExist(int empNumber) {
		EmpDAO empDAO = new EmpDAO();
		Connection con = empDAO.getConn();
		String sql = "SELECT COUNT(staffno) FROM staff WHERE staffno = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, empNumber);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				int count = rs.getInt(1);
				return count > 0;
			}
			rs.close();
			ps.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}
