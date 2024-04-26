package com.mes.project.jjh.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mes.project.jjh.dao.Ss_DAO;
import com.mes.project.jjh.dto.Ss_DTO;
import com.mes.project.ldy.dto.SD_DTO;
import com.mes.project.lsh.file.FileUpload;

@Service
public class Ss_Service {
	@Autowired
	Ss_DAO pagingDAO;
	
	@Autowired
	private FileUpload fileUpload;

	public List<Ss_DTO> listPaging(Ss_DTO ss_dto) {
		int start = 0;
		int end = 0;
		
		if(!(ss_dto.getStart() > 0 && ss_dto.getEnd() > 0 )) {
			// start : ( ( 2 - 1 ) * 5 ) + 1
			// end : 2 * 5
			
			start = ((ss_dto.getPageNum() - 1) * ss_dto.getCountPerPage()) + 1;
			end = ss_dto.getPageNum() * ss_dto.getCountPerPage();
			ss_dto.setStart(start);
			ss_dto.setEnd(end);
		}

		System.out.println("Ss_Service >> start : " + ss_dto.getStart());
		System.out.println("end : " + end);

		List list = pagingDAO.selectPost(ss_dto);

		return list;

	}
	
	public List<Ss_DTO> listLDY() {
		List<Ss_DTO> list = pagingDAO.selectLDY();
		return list;
	}
	
	public List listMesLDY() {
		List list = pagingDAO.selectMesLdy();
		return list;
	}

	public int getTotalPaging(Ss_DTO ss_dto) {
		return pagingDAO.selectTotalEmp(ss_dto);
	}
	
	// 업데이트
		public Map updateMes(Ss_DTO dto) {
			Map m = new HashMap();
			try {
				dto.setItemImg( fileUpload.upload(dto.getImgFileName()));
				
				System.out.println("dto.getItemImg() >> ?? : " + dto.getItemImg());
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			int result = pagingDAO.updateMesSet(dto);
			
			m.put("result", result);
			
			return m;
		}

	// 인설트
	public int insertMes(Ss_DTO dto) {
		try {
			dto.setItemImg( fileUpload.upload(dto.getImgFileName()));
			
			System.out.println("dto.getItemImg() >> ?? : " + dto.getItemImg());
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return pagingDAO.insertIntoMes(dto);
	}

	public void download(String fileName, HttpServletResponse response) {

		/////////////////////////////////////////////////////////////////////////////////
		try {
			String file_rep = "c:\\file_repo";

			System.out.println("fileName : " + fileName);

			System.out.println("폴더 구분자 1 : " + System.getProperty("file.separator"));
			System.out.println("폴더 구분자 2 : " + File.separator);

			// 경로를 String으로 만들어줌 (file full path : 파일전체 경로)
			String downFile = file_rep + System.getProperty("file.separator") + fileName;

			// 파일에다가 경로를 넣어줌(지정한 파일 그 자체)
			File f = new File(downFile);

			// 파일을 읽을 흐름(stream)을 열어서 준비 (FileInputStream : 들어오는 흐름, 수도꼭지를 여는 것과 같다고 하심)
			FileInputStream in;

			in = new FileInputStream(f);

			////////////////////////////////////////////////////////////////////////////////////

			// cache:임시저장, no-cache: 임시저장하지 마라
			// 해석 : 브라우저 캐시를 사용하지 않도록
			// 브라우저는 같은 파일은 두번 안받으려고 노력함.
			response.setHeader("Cache-Control", "no-cache");
			response.addHeader("Content-disposition", "attachment; fileName=" + fileName);

			// 아래처럼 바꾸면 "a.txt"라는 이름으로 파일이 저장됨
//	response.addHeader("Content-disposition", "attachment; fileName=" + "a.txt");

			// 브라우저로 내보낼 수 있는 흐름을 열어서 준비
			OutputStream out;

			out = response.getOutputStream();

			/////////////////////////////////////////////////////////////////////////////////////

//	(1024 * 1 : 1KB)
//	흐름에서 java 메모리로 퍼 올릴 바가지의 크기
			byte[] buf = new byte[1024 * 1]; // 보통은 8KB정도로 쓴다.

			while (true) {

				// in.read(buf) : buf만큼 흐름에서 읽어서 java메모리에 올린다.
				// 읽은 양(byte)만큼 돌려준다.
				// 단, 더 읽을 내용이 없으면 -1을 돌려준다. (-1 될 때까지 퍼나른다.(더 읽을 내용이 없을 때까지 퍼나른다.))

				int count = in.read(buf);
				System.out.println("파일에서 읽은 크기 : count : " + count);

				// 더이상 읽을 내용이 없으면 퍼나르기 종료하기 위한 조건문
				if (count == -1) {
					break;
				}

				// 응답의 내보내는 흐름(out)에 바가지의 내용을 보낸다.
				// 0 : 바가지의 처음 값부터
				// count : 읽은 만큼
				// 0, count면 바가지에 있는 거 전부다 라는 뜻이래
				out.write(buf, 0, count);

			}

			// Stream은 무조건 닫아줘야한다고 함. 안닫아주면 계속 사용중이 되는데 이러면 지우거나 이름을 바꾸거나 못함(계속 사용중이라서)
			in.close();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 딜리트
	public int deleteMes(Ss_DTO ss_dto) {
		int result = pagingDAO.deleteMesSeq(ss_dto);
		System.out.println("result : " + result);
		return result;
	}

	
}
