package com.mes.project.jjh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mes.project.jjh.dto.Ss_DTO;

@Repository
public class Ss_DAO {

	
	@Autowired
	private SqlSession sqlSession;
	
	// 셀렉트
	public List selectPost(Ss_DTO ss_DTO) {
		System.out.println("selectPost ss_dto : " + ss_DTO);
		List result = sqlSession.selectList("mapper.ss.selectSs", ss_DTO);
		System.out.println("Ss_DAO > selectFromMes : " + result.size());
		return result;
	}
	
	// 인설트
	public int insertIntoMes(Ss_DTO ss_DTO) {
		int result = sqlSession.insert("mapper.ss.insertSs", ss_DTO);
		System.out.println("insertDAO result : " + result);
		return result;
	}
	
	// 딜리트
	public int deleteMesSeq(Ss_DTO ss_DTO) {
		int result = sqlSession.delete("mapper.ss.deleteSs", ss_DTO);
	
		return result;
	}
	
	// 업데이트
	public int updateMesSet(Ss_DTO ss_DTO) {
		System.out.println("ss_DTO DAO : " + ss_DTO);
		int result = sqlSession.update("mapper.ss.updateSs", ss_DTO);
		
		return result;
	}
	
	// ldy select
	public List selectLDY() {
		return sqlSession.selectList("mapper.ss.selectLDY");
	}
	// ldy select
	public List selectMesLdy() {
		return sqlSession.selectList("mapper.ss.select_MES");
	}
	


	public int selectTotalEmp(Ss_DTO ss_DTO) {
		int totalCount = -1;

		totalCount = sqlSession.selectOne("mapper.ss.selectCountSs", ss_DTO);
		return totalCount;
	}
	
}
