package com.mes.project.ktw.staff.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mes.project.ktw.staff.dao.StaffDAO;
import com.mes.project.ktw.staff.dto.AbsentDTO;
import com.mes.project.ktw.staff.dto.PageResponse;
import com.mes.project.ktw.staff.dto.Role;
import com.mes.project.ktw.staff.dto.StaffDTO;

@Service
public class StaffService {

	@Autowired
	private StaffDAO staffDAO;

	// 직원추가
	public void addStaff(StaffDTO staffDTO) throws Exception {
		staffDAO.addStaff(staffDTO);
	}

	public String checkUserIdStatus(int staffno) {
		return staffDAO.checkUserIdStatus(staffno);
	}

	public boolean insertAbsent(AbsentDTO absent) {
		try {
			staffDAO.addAbsent(absent); // DAO 메소드 호출
			return true; // 성공적으로 처리되면 true 반환
		} catch (Exception e) {
			// 실패할 경우 예외 처리
			return false; // 실패 시 false 반환
		}
	}

	// 휴가 목록 조회
	public List<AbsentDTO> listAbsent(int typeNumber) throws Exception {
		return staffDAO.getAbsentList(typeNumber);
	}
	// 직원 조회
	public StaffDTO getStaff(int staffNo) throws Exception {
		return staffDAO.getStaff(staffNo);
	}
	
	public PageResponse<StaffDTO> getStaffList(int page, int size, String sortField, String sortOrder, String staffno, String sname) {
	    Map<String, Object> countParams = new HashMap<String, Object>();
	    Map<String, Object> params = new HashMap<String, Object>();

	    // staffno 유효성 검사 및 검색 조건 추가
	    if (staffno != null && !staffno.trim().isEmpty()) {
	        if (!staffno.trim().matches("^\\d+$")) {
	            throw new IllegalArgumentException("직원 번호는 숫자만 포함해야 합니다.");
	        }
	        countParams.put("staffno", staffno);
	        params.put("staffno", staffno);
	    }

	    // sname 유효성 검사 및 검색 조건 추가
	    if (sname != null && !sname.trim().isEmpty()) {
	        if (!sname.trim().matches("^[\\w\\s가-힣]+$")) {
	            throw new IllegalArgumentException("직원 이름에는 특수 문자를 포함할 수 없습니다.");
	        }
	        String formattedSname = "%" + sname.trim() + "%";
	        countParams.put("sname", formattedSname);
	        params.put("sname", formattedSname);
	    }

	    // 총 항목 수 및 총 페이지 수 계산
	    int totalItems = staffDAO.countStaff(countParams);
	    int totalPages = (totalItems + size - 1) / size;

	    System.out.println("총 페이지 수: " + totalPages);
	    System.out.println("총 로우 수: " + totalItems);

	    // 요청한 페이지 번호 조정
	    if (page > totalPages) {
	        page = Math.max(1, totalPages);
	    }

	    // 페이지네이션을 위한 파라미터 설정
	    int start = (page - 1) * size;
	    int end = page * size;
	    params.put("start", start);
	    params.put("end", end);
	    params.put("sortField", sortField);
	    params.put("sortOrder", sortOrder);

	    // 조건에 맞는 직원 목록 가져오기
	    List<StaffDTO> items = staffDAO.getStaffList(params);
	    return new PageResponse<StaffDTO>(items, totalItems, totalPages);
	}

	
	// 권한 목록
	public PageResponse<StaffDTO> getRoleList(int page, int size, String sortField, String sortOrder, String staffno, String sname) {
		 Map<String, Object> countParams = new HashMap<String, Object>();
		    Map<String, Object> params = new HashMap<String, Object>();

		    // staffno 유효성 검사 및 검색 조건 추가
		    if (staffno != null && !staffno.trim().isEmpty()) {
		        if (!staffno.trim().matches("^\\d+$")) {
		            throw new IllegalArgumentException("직원 번호는 숫자만 포함해야 합니다.");
		        }
		        countParams.put("staffno", staffno);
		        params.put("staffno", staffno);
		    }

		    // sname 유효성 검사 및 검색 조건 추가
		    if (sname != null && !sname.trim().isEmpty()) {
		        if (!sname.trim().matches("^[\\w\\s가-힣]+$")) {
		            throw new IllegalArgumentException("직원 이름에는 특수 문자를 포함할 수 없습니다.");
		        }
		        String formattedSname = "%" + sname.trim() + "%";
		        countParams.put("sname", formattedSname);
		        params.put("sname", formattedSname);
		    }

		    // 총 항목 수 및 총 페이지 수 계산
		    int totalItems = staffDAO.countRole(countParams);
		    int totalPages = (totalItems + size - 1) / size;

		    System.out.println("총 페이지 수: " + totalPages);
		    System.out.println("총 로우 수: " + totalItems);

		    // 요청한 페이지 번호 조정
		    if (page > totalPages) {
		        page = Math.max(1, totalPages);
		    }

		    // 페이지네이션을 위한 파라미터 설정
		    int start = (page - 1) * size;
		    int end = page * size;
		    params.put("start", start);
		    params.put("end", end);
		    params.put("sortField", sortField);
		    params.put("sortOrder", sortOrder);

		    // 조건에 맞는 직원 목록 가져오기
		    List<StaffDTO> items = staffDAO.getRoleList(params);
		    return new PageResponse<StaffDTO>(items, totalItems, totalPages);
    }
	
	
	// 직원 정보 수정
	public boolean updateStaff(StaffDTO staffDTO) throws Exception {
		StaffDTO currentStaff = staffDAO.getStaff(staffDTO.getStaffno());
		if (currentStaff == null) {
			throw new Exception("해당 직원을 찾을 수 없습니다.");
		}

		// 업데이트 유무 체크
		boolean isUpdated = false;

		if (staffDTO.getSname() != null && !staffDTO.getSname().equals(currentStaff.getSname())) {
			currentStaff.setSname(staffDTO.getSname());
			isUpdated = true;
		}

		if (staffDTO.getSduty() != null && !staffDTO.getSduty().equals(currentStaff.getSduty())) {
			currentStaff.setSduty(staffDTO.getSduty());
			isUpdated = true;
		}

		if (staffDTO.getSal() != 0 && staffDTO.getSal() != currentStaff.getSal()) {
			currentStaff.setSal(staffDTO.getSal());
			isUpdated = true;
		}

		if (staffDTO.getOffino() != 0 && staffDTO.getOffino() != currentStaff.getOffino()) {
			currentStaff.setOffino(staffDTO.getOffino());
			isUpdated = true;
		}

		if (isUpdated) {
			staffDAO.updateStaff(currentStaff);
		}

		return isUpdated;
	}

	// 직원 정보 삭제
	public void deleteStaff(int staffno) throws Exception {
		StaffDTO staff = staffDAO.getStaff(staffno);
		if (staff != null && staffno >= 3000) {
			staffDAO.deleteStaff(staffno);
		} else {
			throw new Exception("삭제할 직원 번호가 잘못 되었습니다.");
		}
	}

	// 권한 수정
	public boolean updateRole(String staffnoStr, String newRoleStr) throws Exception {
		int staffno = Integer.parseInt(staffnoStr);
		StaffDTO staff = staffDAO.getStaff(staffno);
		if (staff == null) {
			throw new Exception("해당 직원을 찾을 수 없습니다.");
		}

		Role newRole = Role.fromString(newRoleStr);
		staff.setRole(newRole); // 열거형으로 설정
		staffDAO.updateStaffRole(staffno, newRole);
		return true;
	}

	// 휴가 목록 수정
	public boolean updateAbsentStatus(int absentIds, String newStatus) {
		staffDAO.updateAbsent(absentIds, newStatus);
		return true;
	}

	public Map<String, Object> accountFormCheck(StaffDTO staff) {
		Map<String, Object> result = new HashMap<String, Object>();
		boolean isValid = true;
		StringBuilder errorMessage = new StringBuilder();

		if (!staff.getUserid().isEmpty() && (staff.getUserid().length() < 5 || staff.getUserid().length() > 20)) {
			isValid = false;
			errorMessage.append("아이디는 5자 이상 20자 이하로 입력해야 합니다. ");
		}

		if (!staff.getPassword().isEmpty() && staff.getPassword().length() < 8) {
			isValid = false;
			errorMessage.append("비밀번호는 8자 이상으로 설정해야 합니다. ");
		}

		if (!staff.getSmail().isEmpty()
				&& !staff.getSmail().matches("[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}")) {
			isValid = false;
			errorMessage.append("유효하지 않은 이메일 주소입니다. ");
		}

		if (!staff.getSphone().isEmpty() && !staff.getSphone().matches("\\d{3}-\\d{4}-\\d{4}")) {
			isValid = false;
			errorMessage.append("전화번호는 010-1234-5678 형식으로 입력해야 합니다. ");
		}

		if (!isValid) {
			result.put("isValid", Boolean.FALSE);
			result.put("message", errorMessage.toString());
		} else {
			result.put("isValid", Boolean.TRUE);
			result.put("message", "검증 성공");
		}
		return result;
	}

	// 계정 정보 등록
	public int registerAccount(StaffDTO staff) {

		StaffDTO idCheck = staffDAO.findByUserId(staff.getUserid());
		if (idCheck == null) {
			return staffDAO.updateAccount(staff);
		} else {
			return -1;
		}
	}

}
