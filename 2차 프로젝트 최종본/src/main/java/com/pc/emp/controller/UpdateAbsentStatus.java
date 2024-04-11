package com.pc.emp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;
import com.google.gson.reflect.TypeToken;
import com.pc.emp.dao.EmpRepositoryJDBC;
import com.pc.emp.dto.Absent;

import java.lang.reflect.Type;

/**
 * Servlet implementation class UpdateAbsentStatus
 */
@WebServlet("/updateabsent")
public class UpdateAbsentStatus extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		if ("list".equals(action)) {
			// 휴가 신청 리스트 조회 및 JSON으로 변환 후 반환하는 로직
			EmpRepositoryJDBC empRepository = new EmpRepositoryJDBC();
			List<Absent> absentList = empRepository.getAbsentList();

			Gson gson = new GsonBuilder().setDateFormat("yyyy.MM.dd").create();

			String jsonAbsentList = gson.toJson(absentList);

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonAbsentList);

		} else if ("empnolist".equals(action)) {
			HttpSession session = request.getSession();
			Integer empno = (Integer) session.getAttribute("empno");

			// absentList를 빈 리스트로 초기화
			List<Absent> absentList = new ArrayList<>();

			if (empno != null) {
				EmpRepositoryJDBC empRepository = new EmpRepositoryJDBC();
				absentList = empRepository.getAbsentList(empno); // empno에 해당하는 리스트 조회
			}
			Gson gson = new GsonBuilder().setDateFormat("yyyy.MM.dd").create();
			String jsonAbsentList = gson.toJson(absentList); // 빈 리스트 또는 조회된 리스트를 JSON으로 변환

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonAbsentList);
		} else {
			EmpRepositoryJDBC empRepository = new EmpRepositoryJDBC();
			List<Absent> absentList = empRepository.getAbsentList(); // 예시 메소드 호출

			// 조회된 데이터를 request 속성에 추가
			request.setAttribute("absentList", absentList);

			// vacation.jsp로 포워딩
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/vacation.jsp");
			dispatcher.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		try {
			// 요청 파라미터에서 액션과 휴가 신청 ID 목록(JSON 문자열)을 추출
			String action = request.getParameter("action");
			String jsonAbsentIds = request.getParameter("absentIds");

			// JSON 문자열을 Java 객체로 변환
			Gson gson = new Gson();
			Type type = new TypeToken<List<Integer>>() {
			}.getType();
			List<Integer> absentIds = gson.fromJson(jsonAbsentIds, type);

			// EmpRepositoryJDBC 인스턴스 생성 및 초기화
			EmpRepositoryJDBC empRepository = new EmpRepositoryJDBC();

			// 업데이트 성공 여부 플래그
			boolean updateSuccess = true;

			// 각 ID에 대해 상태 업데이트 수행
			for (Integer absentId : absentIds) {
				boolean result = empRepository.updateAbsentStatus(absentId, action);
				if (!result) {
					updateSuccess = false; // 하나라도 실패 시 실패로 표시
					break;
				}
			}

			// 업데이트 결과에 따라 JSON 응답 생성 및 반환
			if (updateSuccess) {
				out.println("{\"success\": true, \"message\": \"휴가 상태가 성공적으로 업데이트되었습니다.\"}");
			} else {
				out.println("{\"success\": false, \"message\": \"휴가 상태 업데이트에 실패했습니다.\"}");
			}
		} catch (JsonSyntaxException e) {
			out.println("{\"success\": false, \"message\": \"입력된 데이터 형식이 잘못되었습니다.\"}");
		} catch (Exception e) {
			out.println("{\"success\": false, \"message\": \"업데이트 과정에서 예외가 발생했습니다.\"}");
		} finally {
			out.flush();
		}
	}
}
