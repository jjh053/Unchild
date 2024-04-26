package com.mes.project.ldy.qr;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mes.project.ldy.dto.Qr_DTO;
import com.mes.project.lsh.file.FileDownload;

@Controller
public class QR_controller {
	@Autowired
    private FileDownload fileDownload;
	
	String fileName;
	

	@RequestMapping("/create")
	@ResponseBody public String qr_create(
			@RequestBody Qr_DTO dto,
			HttpServletResponse resp
	) {
		String base64String = dto.getData();
		int commaIndex = base64String.indexOf(',');
        String base64ImageData = base64String.substring(commaIndex + 1);
		
		decodeAndSaveImage(base64ImageData, "C:\\file_repo/BeforeImg.jpg");
		
		QR qr = new QR();
		qr.create("http://124.58.88.184:8803/mes_project/fileDownload?fileName=BeforeImg.jpg", "AfterImg", "png");
		
		return "";
	}
	
	public void decodeAndSaveImage(String base64String, String filePath) {
        try {
            // Base64 문자열을 바이트 배열로 디코딩
            byte[] imageBytes = Base64.getDecoder().decode(base64String);

            // 파일로 저장
            FileOutputStream outputStream = new FileOutputStream(filePath);
            outputStream.write(imageBytes);
            outputStream.close();

            System.out.println("이미지가 성공적으로 저장되었습니다.");
        } catch (IOException e) {
            System.err.println("이미지 저장 중 오류가 발생했습니다: " + e.getMessage());
        }
    }
	
}
