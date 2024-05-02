package com.mes.project.ktw.staff.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.mes.project.ktw.staff.dto.JsonResponse;
import com.mes.project.ktw.staff.dto.PageResponse;
import com.mes.project.ktw.staff.dto.StaffDTO;
import com.mes.project.ktw.staff.service.StaffService;

@Controller
public class StaffController {

	@Autowired
	private StaffService staffService;
	private final Logger log = LoggerFactory.getLogger(StaffController.class);

	// 직원 목록 페이지 요청
	@RequestMapping(value = "/staffmgmt/home", method = RequestMethod.GET)
	public String staffForm() {
		return "empmgmt";
	}

	// 계정 등록 페이지 요청
	@RequestMapping(value = "/signup")
	public String signUpForm() {
		return "signup";
	}

	@RequestMapping("/staffmgmt/list")
	@ResponseBody
	public PageResponse<StaffDTO> staffList(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "size", defaultValue = "10") int size,
			@RequestParam(value = "sortField", defaultValue = "staffno") String sortField,
			@RequestParam(value = "sortOrder", defaultValue = "ASC") String sortOrder,
			@RequestParam(value = "staffno", required = false) String staffno,
			@RequestParam(value = "sname", required = false) String sname) {

		PageResponse<StaffDTO> pageResponse = staffService.getStaffList(page, size, sortField, sortOrder, staffno,
				sname);
		return pageResponse;
	}

	@RequestMapping("/staffacat/list")
	@ResponseBody
	public PageResponse<StaffDTO> roleList(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "size", defaultValue = "10") int size,
			@RequestParam(value = "sortField", defaultValue = "staffno") String sortField,
			@RequestParam(value = "sortOrder", defaultValue = "ASC") String sortOrder,
			@RequestParam(value = "staffno", required = false) String staffno,
			@RequestParam(value = "sname", required = false) String sname) {

		PageResponse<StaffDTO> pageResponse = staffService.getRoleList(page, size, sortField, sortOrder, staffno,
				sname);
		return new PageResponse<StaffDTO>(pageResponse.getItems(), pageResponse.getTotalItems(),
				pageResponse.getTotalPages());
	}

	@RequestMapping("/staffmgmt/add") // 직원 정보 추가
	public String addStaff(StaffDTO staffDTO, RedirectAttributes redirectAttributes) {
		try {
			staffService.addStaff(staffDTO);
			redirectAttributes.addFlashAttribute("successMessage", "직원이 성공적으로 추가되었습니다.");
			return "redirect:/staffmgmt/home";
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("errorMessage", "직원 추가에 실패했습니다: " + e.getMessage());
			return "redirect:/staffmgmt/home";
		}
	}

	@RequestMapping(value = "/staffmgmt/search", method = RequestMethod.GET)
	@ResponseBody // 직원 정보 검색
	public void searchStaff(@RequestParam("empno") String empno, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		try {
			StaffDTO staffDTO = staffService.getStaff(Integer.parseInt(empno));
			if (staffDTO != null) {
				System.out.println("직원 번호응답함");
				writeResponse(response, staffDTO, HttpServletResponse.SC_OK);
			} else {
				writeJsonResponse(out, false, "해당 직원을 찾을 수 없습니다.");
			}
		} catch (NumberFormatException e) {
			writeJsonResponse(out, false, "유효하지 않은 요청입니다. 숫자만 입력해주세요.");
		} catch (Exception e) {
			writeJsonResponse(out, false, "서버 오류가 발생했습니다: " + e.getMessage());
		}
	}

	@RequestMapping(value = "/mypage/userInfo")
	@ResponseBody
	public void searchUserInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		try {
			int sessionStaffno = (Integer) request.getSession().getAttribute("empno");
			StaffDTO staffDTO = staffService.getStaff(sessionStaffno);
			if (staffDTO != null) {
				System.out.println("직원 번호응답함");
				writeResponse(response, staffDTO, HttpServletResponse.SC_OK);
			} else {
				writeJsonResponse(out, false, "해당 직원을 찾을 수 없습니다.");
			}
		} catch (NumberFormatException e) {
			writeJsonResponse(out, false, "유효하지 않은 요청입니다. 숫자만 입력해주세요.");
		} catch (Exception e) {
			writeJsonResponse(out, false, "서버 오류가 발생했습니다: " + e.getMessage());
		}
	}

	@RequestMapping(value = "/signup/search", method = RequestMethod.GET)
	@ResponseBody // 직원 정보 검색
	public void accountExist(@RequestParam("empno") String empno, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		StaffDTO staffDTO;
		try {
			staffDTO = staffService.getStaff(Integer.parseInt(empno)); // 직원 번호 조회
			if (staffDTO == null) {
				writeJsonResponse(out, false, "해당 직원을 찾을 수 없습니다.");
			} else {
				String userIdStatus = staffService.checkUserIdStatus(staffDTO.getStaffno());
				if (!"NULL".equals(userIdStatus)) {
					writeJsonResponse(out, false, "이미 정보가 등록된 직원입니다."); // 직원 아이디 조회
					return;
				} else {
					writeResponse(response, staffDTO, HttpServletResponse.SC_OK);
				}
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			writeJsonResponse(out, false, "유효하지 않은 요청입니다. 숫자만 입력해주세요.");
		} catch (Exception e) {
			e.printStackTrace();
			writeJsonResponse(out, false, "서버 오류가 발생했습니다: " + e.getMessage());
		}

	}

	@RequestMapping("/staffmgmt/update") // 직원 정보 수정 // 이름, 연봉, 부서번호, 직책
	public void updateStaff(@RequestBody StaffDTO staffDTO, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		try {
			boolean isUpdated = staffService.updateStaff(staffDTO);
			if (isUpdated) {
				writeJsonResponse(out, true, "직원 정보가 성공적으로 수정되었습니다.");
			} else {
				writeJsonResponse(out, false, "변경된 사항이 없습니다.");
			}
		} catch (Exception e) {
			writeJsonResponse(out, false, "직원 정보 수정에 실패했습니다: " + e.getMessage());
		}
	}

	@RequestMapping("/signup/update")
	@ResponseBody // 직원 계정 정보 업데이트
	public void AccountRegister(@RequestBody StaffDTO staff, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
//		System.out.println("클라이언트 응답 확인 아이디임?"+staff.getUserid());

		if (staff != null) {
			Map<String, Object> validation = staffService.accountFormCheck(staff);
			boolean isValid = (Boolean) validation.get("isValid");
			String message = (String) validation.get("message");
			// 계정 등록 형식 체크
			if (!isValid) {
				writeJsonResponse(out, false, message);
				return;
			}
			try {
				StaffDTO currentStaff = staffService.getStaff(staff.getStaffno());
				if (currentStaff != null) {
					// 이미 등록된 계정인지 확인
					String userIdStatus = staffService.checkUserIdStatus(staff.getStaffno());
					if (!"NULL".equals(userIdStatus)) {
						writeJsonResponse(out, false, "계정 정보 등록에 실패했습니다. 이미 정보가 저장된 사용자입니다.");
						return;
					}
				}
				// 아이디 중복확인
				int updateResult = staffService.registerAccount(staff);
				log.debug("입력값 확인" + updateResult);
				if (updateResult == -1) {
					writeJsonResponse(out, false, "중복된 아이디 입니다.");
					return;
				}
				writeJsonResponse(out, true, "계정 등록이 완료되었으며, 관리자 승인까지 영업일 기준 2~3일 소요됩니다.");
			} catch (Exception e) {
				e.printStackTrace();
				writeJsonResponse(out, false, "계정 정보 등록 중 서버 오류가 발생했습니다.");
			}
		} else {
			writeJsonResponse(out, false, "제공된 계정 정보가 유효하지 않습니다.");
		}

	}

	@RequestMapping("/mypage/updateAccount")
	@ResponseBody // 직원 계정 정보 업데이트
	public void AccountUpdate(@RequestBody StaffDTO staff, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		PrintWriter out = response.getWriter();
//		System.out.println("클라이언트 응답 확인 아이디임?"+staff.getUserid());

		if (staff != null) {
			Map<String, Object> validation = staffService.accountFormCheck(staff);
			boolean isValid = (Boolean) validation.get("isValid");
			String message = (String) validation.get("message");
			// 계정 등록 형식 체크
			if (!isValid) {
				writeJsonResponse(out, false, message);
				return;
			}
			int staffno = (Integer) request.getSession().getAttribute("empno");
			if (staffno < 3000) {
				writeJsonResponse(out, false, "세션 만료.");
			}
			staff.setStaffno(staffno);
			try {
				// 아이디 중복확인
				int updateResult = staffService.registerAccount(staff);
				log.debug("입력값 확인" + updateResult);
				if (updateResult == -1) {
					writeJsonResponse(out, false, "중복된 아이디 입니다.");
					return;
				}
				writeJsonResponse(out, true, "계정 정보 수정이 완료 되었습니다.");
			} catch (Exception e) {
				e.printStackTrace();
				writeJsonResponse(out, false, "정보 수정에 실패 했습니다");
			}
		} else {
			writeJsonResponse(out, false, "유효하지 않은 요청");
		}

	}

	@RequestMapping("/staffmgmt/delete")
	@ResponseBody // 직원 삭제
	public void deleteStaff(@RequestParam String empno, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		try {
			staffService.deleteStaff(Integer.parseInt(empno));
			writeJsonResponse(out, true, "직원번호: " + empno + "의 직원을 목록에서 삭제했습니다.");
		} catch (Exception e) {
			writeJsonResponse(out, false, "직원 삭제에 실패했습니다: " + e.getMessage());
		}
	}

	private void writeResponse(HttpServletResponse response, Object responseObject, int status) throws IOException {
		response.setStatus(status);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.writeValue(response.getWriter(), responseObject);
	}

	private void writeJsonResponse(PrintWriter out, boolean success, String message) {
		Gson gson = new Gson();
		JsonResponse jsonResponse = new JsonResponse(success, message);
		out.println(gson.toJson(jsonResponse));
	}

	@ExceptionHandler(IllegalArgumentException.class)
	public void handleIllegalArgumentException(IllegalArgumentException e, HttpServletResponse response) {
		response.setContentType("application/json");
		response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		try  {
			PrintWriter out = response.getWriter();
			writeJsonResponse(out, false, e.getMessage());
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
