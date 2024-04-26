package com.mes.project.lsh.workSafety;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mes.project.lsh.file.FileUpload;

@Service
public class WorkSafetyService {

	@Autowired
	private WorkSafetyDAO workSafetyDAO;
	@Autowired
	private FileUpload fileUpload;
	
	// 조회
	public List<WorkSafetyDTO> selectService() {
		
		List<WorkSafetyDTO> list = workSafetyDAO.selectWorkSafety();	
		return list;
	}
	
	// 추가
	public void insertService(WorkSafetyDTO workSafetyDTO) {
		
		// 이미지 파일 저장후 리턴값 DTO 에 저장
		try {
			workSafetyDTO.setW_imgUrl( fileUpload.upload(workSafetyDTO.getW_imgFile()) );
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 들어온 내용을 엔터키를 \\n 으로 변경
		workSafetyDTO.setW_detail( workSafetyDTO.getW_detail().replace(System.lineSeparator(), "\\n") );
		workSafetyDAO.insertWorkSafety(workSafetyDTO);
	}
	
	// 수정
	public void updateService(WorkSafetyDTO workSafetyDTO) {
		
		// 이미지 파일 저장후 리턴값 DTO 에 저장
		try {
			workSafetyDTO.setW_imgUrl( fileUpload.upload(workSafetyDTO.getW_imgFile()) );
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 들어온 내용을 엔터키를 \\n 으로 변경
		workSafetyDTO.setW_detail( workSafetyDTO.getW_detail().replace(System.lineSeparator(), "\\n") );
		workSafetyDAO.updateWorkSafety(workSafetyDTO);
	}
	
	// 삭제
	public void deleteService(WorkSafetyDTO workSafetyDTO) {
		
		workSafetyDAO.deleteWorkSafety(workSafetyDTO);
	}
}
