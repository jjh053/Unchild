package com.mes.project.ldy.dto;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Component
@Data
public class BoardDTO {

	int b_sequence;
	String b_title;
	String b_content;
	int staffno;
	Timestamp b_date;
	int b_view;
	String boardType;
	String fileName;
	int replyId;
	
	
	String sname;
	MultipartFile imgFileName;

	int pageNum;
	int countPerPage;
	
	int startColumn;
	int endColumn;
	
	int LEVEL;
}
