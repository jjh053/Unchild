package com.pc.emp.controller;

import java.io.IOException;
import java.time.Duration;
import java.time.LocalDateTime;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pc.emp.dao.EmpRepository;
import com.pc.emp.dao.EmpRepositoryJDBC;
import com.pc.emp.dto.Account;
import com.pc.emp.dto.Employee;
import com.pc.emp.dto.Role;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private EmpRepository userRepository;

	public void init() {
		userRepository = new EmpRepositoryJDBC();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    // login.jsp 페이지로 요청을 포워딩
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/login.jsp");
	    dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 폼에서 전송된 아이디와 비밀번호를 받아옴
		String userId = request.getParameter("userid");
		String password = request.getParameter("password");
		System.out.println(password);
		HttpSession session = request.getSession();

		// 공백 검증
		if (userId.contains(" ") || password.contains(" ")) {
			request.setAttribute("errorMessage", "아이디와 비밀번호에 공백을 포함할 수 없습니다.");
			request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
			return;
		}

		// 길이 검증
		if (userId.length() > 20 || password.length() > 20) {
			request.setAttribute("errorMessage", "아이디 또는 비밀번호의 길이가 너무 깁니다. 20자 이하로 입력해주세요.");
			request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
			return;
		}

		// 실패 횟수 검증
		Integer failCount = (Integer) session.getAttribute("failCount");
		LocalDateTime lastFailedLoginTime = (LocalDateTime) session.getAttribute("lastFailedLoginTime");

		if (failCount == null)
			failCount = 0;

		if (failCount >= 3) {
			if (lastFailedLoginTime == null) {
				lastFailedLoginTime = LocalDateTime.now();
				session.setAttribute("lastFailedLoginTime", lastFailedLoginTime);
			}

			long minsSinceFail = Duration.between(lastFailedLoginTime, LocalDateTime.now()).toMinutes();

			if (minsSinceFail < 30) {
				request.setAttribute("errorMessage", "계정이 잠겼습니다. 30분 후에 다시 시도해주세요.");
				request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
				return;
			} else {
				session.setAttribute("failCount", 0);
				session.removeAttribute("lastFailedLoginTime");
			}
		}

		// 데이터베이스에서 사용자 정보 조회
		Account user = userRepository.findByUserId(userId);

		// 로그인 체크
		if (user != null && user.getPassword().equals(password)) {
			// 로그인 성공: 사용자 정보와 권한을 세션에 저장
			session.setAttribute("user", user.getUserId()); // 아이디 저장
			session.setAttribute("role", user.getRole().name()); // 권한 정보 저장
			session.setAttribute("name", user.getName()); // 이름 저장
			session.setAttribute("tel", user.getTel());
			session.setAttribute("email", user.getEMail());
			session.setAttribute("empno", user.getEmpno());
			System.out.println("user.getRole(): " + user.getRole());

			// 메인 페이지 또는 권한에 따른 페이지로 리다이렉트
			if (user.getRole() == Role.ADMIN) {
				// 나중에 관리자용 대시보드 페이지 구현예정
				response.sendRedirect("main");
			} else if (user.getRole() == Role.WORKER) {
			    // 일반 사용자(직원)를 위한 메인 페이지로 리다이렉트
			    response.sendRedirect("main");
			} else {
				request.setAttribute("errorMessage", "권한이 없어 로그인할 수 없습니다.");
			    request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
			    return;
			}
		} else {
			// 로그인 실패 카운트 증가
			session.setAttribute("failCount", failCount + 1);
			System.out.println("failCount" + failCount);
			session.setAttribute("lastFailedLoginTime", LocalDateTime.now());
			request.setAttribute("errorMessage", "아이디 혹은 비밀번호가 틀렸습니다.");
			request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
		}
	}
}