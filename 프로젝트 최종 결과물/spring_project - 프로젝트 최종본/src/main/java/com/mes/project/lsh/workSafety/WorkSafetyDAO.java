package com.mes.project.lsh.workSafety;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WorkSafetyDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 조회
	public List<WorkSafetyDTO> selectWorkSafety() {
		
		return sqlSession.selectList("mapper.workSafety.selectWorkSafety");
	}
	
	// 추가
	public void insertWorkSafety(WorkSafetyDTO workSafetyDTO) {

		sqlSession.selectList("mapper.workSafety.insertWorkSafety", workSafetyDTO);
	}
	
	// 수정
	public void updateWorkSafety(WorkSafetyDTO workSafetyDTO) {
		
		sqlSession.selectList("mapper.workSafety.updateWorkSafety", workSafetyDTO);
	}
	
	// 삭제
	public void deleteWorkSafety(WorkSafetyDTO workSafetyDTO) {

		sqlSession.selectList("mapper.workSafety.deleteWorkSafety", workSafetyDTO);
	}
}
