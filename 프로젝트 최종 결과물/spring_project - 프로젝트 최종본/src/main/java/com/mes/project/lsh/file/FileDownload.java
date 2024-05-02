package com.mes.project.lsh.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

@Service
public class FileDownload {

	public void download(String fileName, HttpServletResponse response) {
		
		try {
			// 파일저장 시스템 경로
			String file_rep = "C:\\file_repo";
//			System.out.println("fileName : " + fileName);
			
			// 시스템 환경에 따라 폴더를 구분해줌(윈도우/리눅스/맥)
//			System.out.println("폴더 구분자 1 : " + System.getProperty("file.separator"));
//			System.out.println("폴더 구분자 2 : " + File.separator);
			
			// file full path: 파일 전체 경로
			String downFile = file_rep + File.separator + fileName;
			
			// 지정한 파일 그자체
			File f = new File(downFile);
			
			// 파일을 읽을 흐름 stream 을 열어서 준비
			FileInputStream in = new FileInputStream(f);
			
			
			// 브라우저 캐시를 사용하지 않도록
			// 브라우저는 같은 파일은 두번 안받으려고 노력함
			response.setHeader("Cache-Control", "no-cache");
			response.addHeader("Content-disposition", "attachment; fileName=" + fileName);
			
			// 브라우저로 내보낼 수 있는 흐름을 열어서 준비
			OutputStream os = response.getOutputStream();
			
			
			// 흐름에서 java 메모리로 퍼 올릴 바가지의 크기
			byte[] buf = new byte[1024 * 1];	// 보통은 8KB 정도로 쓴다
			
			while(true) {
				// in.read(buf) : buf 만큼 흐름에서 읽어서 java 메모리에 올린다
				// 읽은 양 byte 만큼 돌려준다
				// 단, 더 읽을 내용이 없으면 -1을 돌려준다
				int count = in.read(buf);
//				System.out.println("읽은 크기 : count : " + count);
				
				// 더이상 읽을 내용이 없으면 퍼나르기 종료
				if(count == -1) {
					break;
				}
				
				// 응답의 내보내는 흐름에 바가지의 내용을 보낸다
				// 0 : 바가지의 처음 값부터
				// count : 읽은 만큼
				os.write(buf, 0, count);
			}
			
			// Stream 계열은 사용후 close 를 해줘야 한다
			in.close();
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
