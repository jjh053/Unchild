package com.mes.project.ldy.dto;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class StockDTO {
	int stockNum;
	List<SD_DTO> stockName;
	int stockCount;
	String stockID;
	String g_grade;
	
	int lineNum;
	Timestamp startTime;
	Timestamp endTime;
	
	int product;
	
	int pass;
	int fail;
	int g_sequence;
	int qualitychk;
}
