package com.pc.emp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.sql.Date;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;
import com.google.gson.reflect.TypeToken;
import com.pc.emp.dao.EmpRepositoryJDBC;
import com.pc.emp.dto.Employee;
import com.pc.emp.dto.Role;

@WebServlet("/emp")
public class EmpServlet extends HttpServlet {
	private Gson gson = new Gson();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession(false);
		String role = null;
		if (session != null) {
			role = (String) session.getAttribute("role");
		}

		if (!"ADMIN".equals(role)) {
			response.sendRedirect("main.jsp");
			return;
		}

		String action = request.getParameter("action");
		if ("search".equals(action)) {
			searchEmployee(request, response);
		} else if ("list".equals(action)) {
			listEmployees(request, response); // AJAX를 통한 조회 요청 처리
		} else if ("edit".equals(action)) {
			editEmployeeGet(request, response); // 수정된 메서드 이름으로 변경
		} else if ("delete".equals(action)) {
			deleteEmployee(request, response);
		} else {
			request.getRequestDispatcher("/WEB-INF/empmgmt.jsp").forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String ename = request.getParameter("ename");
		String hireDateStr = request.getParameter("hireDate");
		String job = request.getParameter("job");
		String salStr = request.getParameter("sal");
		String deptnoStr = request.getParameter("deptno");

		if (ename == null || ename.trim().isEmpty() || hireDateStr == null || hireDateStr.trim().isEmpty()
				|| job == null || job.trim().isEmpty() || salStr == null || salStr.trim().isEmpty() || deptnoStr == null
				|| deptnoStr.trim().isEmpty()) {

			response.sendRedirect("empmgmt.jsp?error=잘못된 입력 입니다.");
			return;
		}

		try {
			int sal = Integer.parseInt(salStr);
			int deptno = Integer.parseInt(deptnoStr);
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date parsedDate = dateFormat.parse(hireDateStr);
			Date hireDate = new Date(parsedDate.getTime());

			Employee employee = new Employee();
			employee.setName(ename);
			employee.setDuty(job);
			employee.setSal(sal);
			employee.setDeptno(deptno);
			employee.setHiredate(hireDate);

			EmpRepositoryJDBC empRepo = new EmpRepositoryJDBC();

			boolean result = empRepo.addEmp(employee);
			if (result) {
				response.sendRedirect("emp");
			} else {
				response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "데이터 삽입 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "잘못된 요청 데이터");
		}

	}

	private void editEmployeeGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		// 쿼리 파라미터에서 정보 추출
		try {
			int empno = Integer.parseInt(request.getParameter("empno"));
			String name = request.getParameter("name");
			String duty = request.getParameter("duty");
			int sal = Integer.parseInt(request.getParameter("sal"));
			int deptno = Integer.parseInt(request.getParameter("deptno"));

			// JDBC를 사용하여 직원 정보 가져오기 및 수정
			EmpRepositoryJDBC repository = new EmpRepositoryJDBC();
			Employee currentEmployee = repository.getEmp(empno);

			// 수정된 필드가 있는 경우에만 업데이트
			if (name != null)
				currentEmployee.setName(name);
			if (duty != null)
				currentEmployee.setDuty(duty);
			if (sal > 0)
				currentEmployee.setSal(sal);
			if (deptno > 0)
				currentEmployee.setDeptno(deptno);

			boolean success = repository.updateEmp(currentEmployee);

			PrintWriter out = response.getWriter();
			if (success) {
				out.print("{\"success\":true, \"message\":\"직원 정보가 성공적으로 수정되었습니다.\"}");
			} else {
				out.print("{\"success\":false, \"message\":\"직원 정보 수정에 실패했습니다.\"}");
			}
		} catch (NumberFormatException e) {
			response.getWriter().print("{\"success\":false, \"message\":\"잘못된 형식의 입력입니다.\"}");
		} catch (Exception e) {
			response.getWriter().print("{\"success\":false, \"message\":\"서버 내부 오류가 발생했습니다.\"}");
		}
		response.getWriter().flush();
	}

	private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();

		try {
			int empno = Integer.parseInt(request.getParameter("empno"));
			EmpRepositoryJDBC repository = new EmpRepositoryJDBC();

//			 관리자 삭제 방지 나중에 살릴것
//			 먼저 직원의 역할 확인
			Role role = repository.getRole(empno);

			// ADMIN 역할을 가진 사용자는 삭제 불가
			if (role == Role.ADMIN) {
				out.print("{\"success\": false, \"message\": \"삭제할 수 없는 직원 입니다.\"}");
				return;
			}

			// 먼저 직원 정보 조회
			Employee employee = repository.getEmp(empno);

			if (employee == null) {
				// 직원 정보가 데이터베이스에 존재하지 않는 경우
				out.print("{\"success\": false, \"message\": \"삭제할 직원 번호가 잘못되었습니다.\"}");
			} else {
				// 직원 정보가 존재하는 경우, 삭제 진행
				boolean isDeleted = repository.deleteEmp(empno);

				if (isDeleted) {
					// 삭제 성공 응답
					out.print("{\"success\": true, \"message\": \"직원을 삭제 했습니다.\"}");
				} else {
					// 삭제 실패 응답
					out.print("{\"success\": false, \"message\": \"직원 삭제에 실패했습니다.\"}");
				}
			}
		} catch (NumberFormatException e) {
			// 잘못된 파라미터 형식으로 인한 예외 처리
			out.print("{\"success\": false, \"message\": \"잘못된 직원 번호 형식.\"}");
		} catch (Exception e) {
			// 기타 예외 처리
			out.print("{\"success\": false, \"message\": \"삭제 중에 오류가 발생했습니다.\"}");
		} finally {
			out.flush();
		}
	}

	private void searchEmployee(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		try {
			int empno = Integer.parseInt(request.getParameter("empno"));
			EmpRepositoryJDBC empRepo = new EmpRepositoryJDBC();
			Employee employee = empRepo.getEmp(empno); // 데이터베이스에서 직원 정보 조회

			PrintWriter out = response.getWriter();

			if (employee != null) {
				// 직원 정보를 JSON 형태로 변환
				String json = new Gson().toJson(employee);
				out.print(json);
			} else {
				// 직원 정보가 없는 경우, 오류 메시지를 포함한 JSON 응답
				out.print("{\"success\":false, \"message\":\"해당 직원을 찾을 수 없습니다.\"}");
			}
			out.flush();
		} catch (NumberFormatException e) {
			response.getWriter().print("{\"success\":false, \"message\":\"잘못된 직원 번호 형식입니다.\"}");
			response.getWriter().flush();
		}
	}

	private void listEmployees(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null && "ADMIN".equals(session.getAttribute("role"))) {
			EmpRepositoryJDBC empRepo = new EmpRepositoryJDBC();
			List<Employee> empList = empRepo.getEmpList(new Employee());

			// 날짜 형식을 '년-월-일'로 설정하는 Gson 인스턴스 생성
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

			String json = gson.toJson(empList);
			response.getWriter().print(json);
		} else {
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			response.getWriter().print(gson.toJson("로그인이 필요합니다."));
		}
	}
}