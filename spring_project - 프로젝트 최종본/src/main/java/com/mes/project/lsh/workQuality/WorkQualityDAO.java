package com.mes.project.lsh.workQuality;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WorkQualityDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 조회
	public List<WorkQualityDTO> selectWorkQualityDetail() {
		
		return sqlSession.selectList("mapper.workQuality.selectWorkQualityDetail");
	}
	
	public List<WorkQualityDTO> selectWorkQualityFacility() {
		
		return sqlSession.selectList("mapper.workQuality.selectWorkQualityFacility");
	}
	
	public WorkQualityDTO selectWorkQualityGuide() {
		
		return sqlSession.selectOne("mapper.workQuality.selectWorkQualityGuide");
	}
	
	public WorkQualityDTO selectWorkQualityStaff(int staffno) {
		
		return sqlSession.selectOne("mapper.workQuality.selectWorkQualityStaff", staffno);
	}
	
	// 추가
	public void insertWorkQuality(WorkQualityDTO workQualityDTO) {

		sqlSession.selectList("mapper.workQuality.insertWorkQuality", workQualityDTO);
	}
	
	// 수정
	public void updateWorkQuality(WorkQualityDTO workQualityDTO) {
		
		sqlSession.selectList("mapper.workQuality.updateWorkQuality", workQualityDTO);
	}
	
	// 삭제
	public void deleteWorkQuality(WorkQualityDTO workQualityDTO) {

		sqlSession.selectList("mapper.workQuality.deleteWorkQuality", workQualityDTO);
	}
	
	// 품질검사 결과
	public void sendWorkQuality(WorkQualityInfoDTO workQualityInfoDTO) {
		
		sqlSession.selectList("mapper.workQuality.sendWorkQuality", workQualityInfoDTO);
	}
	
	// 품질검사 반영
	public void updateSendWorkQuality(WorkQualityInfoDTO workQualityInfoDTO) {
		
		sqlSession.selectList("mapper.workQuality.updateSendWorkQuality", workQualityInfoDTO);
	}
}
