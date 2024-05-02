package com.mes.project.lsh.file;

import java.io.File;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUpload {

	private static final String IMAGE_PATH = "C:\\file_repo";
	
	public String upload(MultipartFile multipartFile) throws Exception {

		String fileName = null;
		
		try {
			// 저장할 파일이름 가져옴
			fileName = multipartFile.getOriginalFilename();
			// 저장할 파일경로 설정
			File uploadFile = new File(IMAGE_PATH, fileName);
			// 파일을 지정한 경로에 저장
			multipartFile.transferTo(uploadFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fileName;
	}
}
