package com.mes.project.ktw.staff.dto;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class StaffDTO {
	private Role role;
	private String userid;
	private String password;
	private String sname;
	private int staffno;
	private int offino;
	private int sal;
	private int rnum;

	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date hiredate;

	private String sduty;
	private String smail;
	private String sphone;
	
	public void setRole(Role role) {
		if (role == null) {
			this.role = Role.UNDEFINED;
		} else {
			this.role = role;
		}

	}
	
	public void setHireDate(String hireDate) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			java.util.Date parsedDate = dateFormat.parse(hireDate);
			this.hiredate = new Date(parsedDate.getTime());
		} catch (ParseException e) {
			throw new IllegalArgumentException("Invalid date format provided, expected yyyy-MM-dd", e);
		}
	}

}
