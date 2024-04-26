package com.mes.project.lsh.workOrder;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WorkOrderDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 조회
	public List<WorkOrderDTO> selectWorkOrder() {
		
		return sqlSession.selectList("mapper.workOrder.selectWorkOrder");
	}
	
	// 추가
	public void insertWorkOrder(WorkOrderDTO workOrderDTO) {

		sqlSession.selectList("mapper.workOrder.insertWorkOrder", workOrderDTO);
	}
	
	// 수정
	public void updateWorkOrder(WorkOrderDTO workOrderDTO) {
		
		sqlSession.selectList("mapper.workOrder.updateWorkOrder", workOrderDTO);
	}
	
	// 삭제
	public void deleteWorkOrder(WorkOrderDTO workOrderDTO) {
		
		sqlSession.selectList("mapper.workOrder.deleteWorkOrder", workOrderDTO);
	}
}
