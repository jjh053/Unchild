package com.mes.project.ktw.staff.controller;

import java.io.IOException;
import java.time.Duration;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mes.project.ktw.staff.dao.StaffDAO;
import com.mes.project.ktw.staff.dto.Role;
import com.mes.project.ktw.staff.dto.StaffDTO;

@Controller
public class LoginController {

	@Autowired
	private StaffDAO staffDAO;

	@RequestMapping(value="/login", method = RequestMethod.GET )
	public String loginForm() {
		return "login";
	}
	
	@RequestMapping("/logout")
	public String logOut(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException{
		
		req.getSession().invalidate();
		return "redirect:login";
	}

	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String loginProcess(@RequestParam("userid") String userId, @RequestParam("password") String password,
			HttpSession session, Model model) {
		if (userId.contains(" ") || password.contains(" ")) {
			model.addAttribute("errorMessage", "아이디와 비밀번호에 공백을 포함할 수 없습니다.");
			return "login";
		}

		if (userId.length() > 20 || password.length() > 20) {
			model.addAttribute("errorMessage", "아이디 또는 비밀번호의 길이가 너무 깁니다. 20자 이하로 입력해주세요.");
			return "login";
		}

		Integer failCount = (Integer) session.getAttribute("failCount");
		System.out.println("실패 횟수: "+failCount);
		LocalDateTime lastFailedLoginTime = (LocalDateTime) session.getAttribute("lastFailedLoginTime");
		failCount = failCount == null ? 0 : failCount;

		if (failCount >= 3) {
			if (lastFailedLoginTime == null
					|| Duration.between(lastFailedLoginTime, LocalDateTime.now()).toMinutes() < 30) {
				model.addAttribute("errorMessage", "계정이 잠겼습니다. 30분 후에 다시 시도해주세요.");
				return "login";
			} else {
				session.setAttribute("failCount", 0);
				session.removeAttribute("lastFailedLoginTime");
			}
		}

		StaffDTO staff = staffDAO.findByUserId(userId);
		
		if (staff != null && staff.getPassword().equals(password)) {
			session.setAttribute("user", staff.getUserid());
			if (staff.getRole() != null && staff.getRole() != Role.UNDEFINED) {
				session.setAttribute("role", staff.getRole().name());
			} else {
				model.addAttribute("errorMessage", "권한이 없어 로그인할 수 없습니다.");
				return "login";
			}
			session.setAttribute("name", staff.getSname());
			session.setAttribute("tel", staff.getSphone());
			session.setAttribute("email", staff.getSmail());
			session.setAttribute("empno", staff.getStaffno());
			failCount = 0;
			session.setAttribute("failCount", 0); // 실패 횟수 초기화
			System.out.println("로그인 성공 실패 횟수 초기화");

			if (staff.getRole() == Role.ADMIN) {
				return "redirect:main"; // 관리자용 대시보드 페이지
			} else {
				System.out.println("작업자 로그인 들어옴?");
				return "redirect:main_work"; // 일반 사용자(직원) 대시보드 페이지
			} 
		} else {
			session.setAttribute("failCount", failCount + 1);
			session.setAttribute("lastFailedLoginTime", LocalDateTime.now());
			model.addAttribute("errorMessage", "아이디 혹은 비밀번호가 틀렸습니다.");
			return "login";
		}
		
		
	}
	
}