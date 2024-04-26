package com.mes.project.lsh.workQuality;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WorkQualityService {

	@Autowired
	private WorkQualityDAO workQualityDAO;
	
	// 조회
	public Map<String, Object> selectService(int staffno) {
		
		List<WorkQualityDTO> detailList = workQualityDAO.selectWorkQualityDetail();
		List<WorkQualityDTO> facilityList = workQualityDAO.selectWorkQualityFacility();
		WorkQualityDTO workQualityDTO = workQualityDAO.selectWorkQualityStaff(staffno);
		WorkQualityDTO guide = workQualityDAO.selectWorkQualityGuide();
		System.out.println("List : " + facilityList);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("detailList", detailList);
		map.put("facilityList", facilityList);
		map.put("workQualityDTO", workQualityDTO);		
		map.put("guide", guide);		
		
		return map;
	}
	
	// 추가
	public void insertService(WorkQualityDTO workQualityDTO) {

		// 들어온 내용을 엔터키를 \\n 으로 변경
		workQualityDTO.setW_detail( workQualityDTO.getW_detail().replace(System.lineSeparator(), "\\n") );
		workQualityDAO.insertWorkQuality(workQualityDTO);
	}
	
	// 수정
	public void updateService(WorkQualityDTO workQualityDTO) {
		
		// 들어온 내용을 엔터키를 \\n 으로 변경
		workQualityDTO.setW_detail( workQualityDTO.getW_detail().replace(System.lineSeparator(), "\\n") );
		workQualityDAO.updateWorkQuality(workQualityDTO);
	}
	
	// 삭제
	public void deleteService(WorkQualityDTO workQualityDTO) {
		
		workQualityDAO.deleteWorkQuality(workQualityDTO);
	}
	
	// 품질검사 결과
	public void sendService(WorkQualityInfoDTO workQualityInfoDTO) {
		
		// 전송시간 넣어줌
		Timestamp time = new Timestamp(System.currentTimeMillis());
		workQualityInfoDTO.setEnd_time(time);
		
		if(workQualityInfoDTO.getUnclear_num() == 0) {
			workQualityInfoDTO.setStatus(0);
			workQualityInfoDTO.setClear_num( workQualityInfoDTO.getPass() );;
		} else {
			workQualityInfoDTO.setStatus(1);
			
			int pass = workQualityInfoDTO.getPass();
			int unclear = workQualityInfoDTO.getUnclear_num();
			
			workQualityInfoDTO.setClear_num(pass-unclear);
		}
		System.out.println("service dtd : " + workQualityInfoDTO);
		workQualityDAO.sendWorkQuality(workQualityInfoDTO);
		workQualityDAO.updateSendWorkQuality(workQualityInfoDTO);
	}
}
