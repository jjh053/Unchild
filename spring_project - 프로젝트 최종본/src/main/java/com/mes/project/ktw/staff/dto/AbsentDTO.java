package com.mes.project.ktw.staff.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class AbsentDTO {
	int staffno;
	
	@JsonFormat(pattern="yyyy-MM-dd")
	Date start_date;
	
	@JsonFormat(pattern="yyyy-MM-dd")
	Date end_date;
	
	String reason;
	String status;
	String sortOrder = "ASC";
	String sortField = "staffno";
	int typeNumber = 1;
	int size = 10;
	int page = 1;
	int id;
	int start;
	int end;
	int rnum;

}
