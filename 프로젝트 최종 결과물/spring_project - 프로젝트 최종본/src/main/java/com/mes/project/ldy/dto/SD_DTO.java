package com.mes.project.ldy.dto;


import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class SD_DTO {
	int lineNum;
	String stockType;
	String stockName;
	int stockCount;
}
