package com.mes.project.lsh.workOrder;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mes.project.lsh.file.FileUpload;

@Service
public class WorkOrderService {

	@Autowired
	private WorkOrderDAO workOrderDAO;
	@Autowired
	private FileUpload fileUpload;
	
	// 조회
	public List<WorkOrderDTO> selectService() {
		
		List<WorkOrderDTO> list = workOrderDAO.selectWorkOrder();	
		return list;
	}
	
	// 추가
	public void insertService(WorkOrderDTO workOrderDTO) {
		
		// 이미지 파일 저장후 리턴값 DTO 에 저장
		try {
			workOrderDTO.setW_imgUrl( fileUpload.upload(workOrderDTO.getW_imgFile()) );
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 들어온 내용을 엔터키를 \\n 으로 변경
		workOrderDTO.setW_detail( workOrderDTO.getW_detail().replace(System.lineSeparator(), "\\n") );
		workOrderDAO.insertWorkOrder(workOrderDTO);
	}
	
	// 수정
	public void updateService(WorkOrderDTO workOrderDTO) {
		
		// 이미지 파일 저장후 리턴값 DTO 에 저장
		try {
			workOrderDTO.setW_imgUrl( fileUpload.upload(workOrderDTO.getW_imgFile()) );
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 들어온 내용을 엔터키를 \\n 으로 변경
		workOrderDTO.setW_detail( workOrderDTO.getW_detail().replace(System.lineSeparator(), "\\n") );
		workOrderDAO.updateWorkOrder(workOrderDTO);
	}
	
	// 삭제
	public void deleteService(WorkOrderDTO workOrderDTO) {
		
		workOrderDAO.deleteWorkOrder(workOrderDTO);
	}
}
