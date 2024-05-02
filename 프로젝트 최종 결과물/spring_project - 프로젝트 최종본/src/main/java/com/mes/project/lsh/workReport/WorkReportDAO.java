package com.mes.project.lsh.workReport;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WorkReportDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 조회
	public List<WorkReportDTO> selectWorkReport(PagingDTO pagingDTO) {
		
		return sqlSession.selectList("mapper.workReport.selectWorkReport", pagingDTO);
	}
	
	// 페이지 정보
	public PagingDTO selectPageNum(PagingDTO pagingDTO) {
		
		return sqlSession.selectOne("mapper.workReport.selectPageNum", pagingDTO);
	}
}
