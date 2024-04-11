package com.pc.emp.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.pc.emp.dao.EmpRepositoryJDBC;
import com.pc.emp.dto.Account;
import com.pc.emp.dto.Employee;
import com.pc.emp.dto.JsonResponse;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if ("search".equals(action)) {
			searchAccount(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/signup.jsp");
			dispatcher.forward(request, response);
		}
	}

	// get name
	private void searchAccount(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		try {
			int empno = Integer.parseInt(request.getParameter("empno"));
			EmpRepositoryJDBC acctRepo = new EmpRepositoryJDBC();
			Account account = acctRepo.getAcct(empno);
			
			 // 직원 정보 탐색
			 if (account == null) {
			        writeJsonResponse(out, false, "해당 직원을 찾을 수 없습니다.");
			    } else if (!acctRepo.isAccountInfoEmpty(account.getEmpno())) {
			        writeJsonResponse(out, false, "이미 계정 정보가 등록된 직원입니다.");
			    } else {
			        writeJsonResponse(out, true, new Gson().toJson(account));
			    }
			
		} catch (NumberFormatException e) {
			writeJsonResponse(out, false, "잘못된 직원 번호 형식입니다.");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		PrintWriter out = response.getWriter();

		if ("update".equals(action)) {
			StringBuilder jsonBuilder = new StringBuilder();
			String line;
			try (BufferedReader reader = request.getReader()) {
				while ((line = reader.readLine()) != null) {
					jsonBuilder.append(line);
				}
			}

			String json = jsonBuilder.toString();
			Gson gson = new Gson();

			Map<String, Object> accountData = gson.fromJson(json, new TypeToken<Map<String, Object>>() {
			}.getType());

			String password = accountData.get("password").toString();
			String confirmPassword = accountData.get("confirmPassword").toString();

			// 비밀번호 일치 여부 검증
			if (!password.equals(confirmPassword)) {
				writeJsonResponse(out, false, "비밀번호가 일치하지 않습니다.");
				return;
			}

			Account account = gson.fromJson(json, Account.class);

			EmpRepositoryJDBC empRepository = new EmpRepositoryJDBC();
			
			// 공백 체크
			if (account.getEmpno() == 0 || account.getUserId() == null || account.getUserId().trim().isEmpty()
					|| account.getPassword() == null || account.getPassword().trim().isEmpty()
					|| account.getEMail() == null || account.getEMail().trim().isEmpty() || account.getTel() == null
					|| account.getTel().trim().isEmpty()) {

				writeJsonResponse(out, false, "계정 정보 업데이트에 실패했습니다. 필수 정보가 누락되었습니다.");
				return;
			}
			
			// 계정 등록 체크
			if (!empRepository.isAccountInfoEmpty(account.getEmpno())) {
				writeJsonResponse(out, false, "계정 정보 등록에 실패했습니다. 이미 정보가 저장된 사용자입니다.");
				return;
			}
			
			// 아이디 중복 체크
			if (empRepository.existsByUserId(account.getUserId())) {
				writeJsonResponse(out, false, "이미 존재하는 아이디 입니다.");
				return;
			}
			
			// 계정 등록
			boolean updateSuccess = empRepository.updateAccount(account);
			
			// 성공 여부에 따른 응답
			if (updateSuccess) {
				writeJsonResponse(out, true, "계정 등록이 완료되었으며, 관리자 승인까지 영업일 기준 2~3일 소요된 후 로그인 가능합니다.");
			} else {
				writeJsonResponse(out, false, "계정 정보 등록에 실패했습니다.");
			}
		}
	}
	
	// 서버 응답 형식
	private void writeJsonResponse(PrintWriter out, boolean success, String message) {
		JsonResponse jsonResponse = new JsonResponse(success, message);
		out.println(new Gson().toJson(jsonResponse));
		out.flush();
	}
	
}
