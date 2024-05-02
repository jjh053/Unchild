package com.mes.project.ktw.staff.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mes.project.ktw.staff.dto.AbsentDTO;
import com.mes.project.ktw.staff.dto.JsonResponse;
import com.mes.project.ktw.staff.service.StaffService;

@Controller
public class AbsentController {

	@Autowired
	private StaffService staffService;
	private final Logger log = LoggerFactory.getLogger(AbsentController.class);

	@RequestMapping("/absent/home")
	public String absentForm() {
		return "vacation";
	}

	// 휴가신청 승인 페이지
//	@RequestMapping("/absent/list")
//	@ResponseBody
//	public List<AbsentDTO> absentList() throws Exception {
//		int nomalList = 1;
//		return staffService.listAbsent(nomalList);
//	}

	// 휴가신청 승인 페이지
	@RequestMapping("/absent/list")
	@ResponseBody
	public List<AbsentDTO> absentList() throws Exception {
		int nomalList = 1;
		return staffService.listAbsent(nomalList);
	}

	@RequestMapping("/mypage/list")
	@ResponseBody
	public List<AbsentDTO> absentList(HttpServletRequest request) throws Exception {
		int sessionStaffno = (Integer) request.getSession().getAttribute("empno");
		return staffService.listAbsent(sessionStaffno);
	}

	@RequestMapping("/absent/insert")
	@ResponseBody
	public void insertAbsent(HttpServletRequest request, HttpServletResponse response, @RequestBody AbsentDTO absent)
			throws IOException {
		int staffno = (Integer) request.getSession().getAttribute("empno");
		PrintWriter out = response.getWriter();
		if (staffno < 3000) {
			writeJsonResponse(out, true, "로그인 세션이 만료되었습니다 다시 로그인 해주세요.");
		}
		absent.setStaffno(staffno);
		boolean isSuccess = staffService.insertAbsent(absent);
		log.debug("시작일:" + absent.getStart_date());
		log.debug("사유 확인" + absent.getReason());

		if (isSuccess) {
			writeJsonResponse(out, true, "휴가 상태가 성공적으로 등록되었습니다.");
		} else {
			writeJsonResponse(out, false, "휴가 상태 등록에 실패하였습니다. 다시 시도해주세요.");
		}

	}

	@RequestMapping("/absent/update")
	@ResponseBody
	public void updateAbsentStatus(@RequestParam("status") String status,
			@RequestParam("absentIds") String jsonAbsentIds, HttpServletResponse response) throws IOException {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		Type type = new TypeToken<List<Integer>>() {
		}.getType();
		List<Integer> absentIds;

		try {
			absentIds = gson.fromJson(jsonAbsentIds, type);
			System.out.println("아이디가 뭐임?: " + absentIds);
			boolean updateSuccess = true;
			for (Integer absentId : absentIds) {
				boolean result = staffService.updateAbsentStatus(absentId, status);
				if (!result) {
					updateSuccess = false;
					break;
				}
			}

			if (updateSuccess) {
				writeJsonResponse(out, true, "휴가 상태가 성공적으로 업데이트되었습니다.");
			} else {
				writeJsonResponse(out, false, "휴가 상태 업데이트에 실패했습니다.");
			}
		} catch (Exception e) {
			writeJsonResponse(out, false, "업데이트 중 오류가 발생했습니다: " + e.getMessage());
		}
	}

	private void writeJsonResponse(PrintWriter out, boolean success, String message) {
		Gson gson = new Gson();
		JsonResponse jsonResponse = new JsonResponse(success, message);
		out.println(gson.toJson(jsonResponse));
	}
}
