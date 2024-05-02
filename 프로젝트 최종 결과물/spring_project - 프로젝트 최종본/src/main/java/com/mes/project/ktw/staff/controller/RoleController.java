package com.mes.project.ktw.staff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mes.project.ktw.staff.service.StaffService;

@Controller
public class RoleController {
	
	@Autowired
	private StaffService staffService;
	
	@RequestMapping(value = "/role/home", method = RequestMethod.GET)
	public String RoleControlForm() {
		return "acctmgmt";
	}
	
	// 권한 수정
	@RequestMapping(value = "/role/update", method = RequestMethod.POST)
    @ResponseBody
    public String updateStaffRole(@RequestParam("staffno") String staffNumber, @RequestParam("newRole") String newRole) {
        try {
            boolean success = staffService.updateRole(staffNumber, newRole);
            return success ? "Success" : "Fail";
        } catch (Exception e) {
            return "Fail: " + e.getMessage();  // 예외 발생 시 실패 메시지와 예외 메시지 반환
        }
    }
	
	
}
