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

import com.mes.project.jjh.dto.Sr_DTO;

@Repository
public class Sr_DAO {

	
	@Autowired
	private SqlSession sqlSession;
	
	// 셀렉트
	public List select1(Sr_DTO sr_DTO) {
//		System.out.println("select1 sr_dto : " + sr_DTO);
		List result = sqlSession.selectList("mapper.sr.selectSr1", sr_DTO);
//		System.out.println("select1 DAO: " + result.size());
		return result;
	}
	// 셀렉트
	public List select2(Sr_DTO sr_DTO) {
		System.out.println("select3 sr_dto : " + sr_DTO);
		List result = sqlSession.selectList("mapper.sr.selectSr2", sr_DTO);
		System.out.println("select2 DAO: " + result.size());
		return result;
	}
	// 셀렉트
	public List select3(Sr_DTO sr_DTO) {
		System.out.println("select3 sr_dto : " + sr_DTO);
		List result = sqlSession.selectList("mapper.sr.selectSr3", sr_DTO);
		System.out.println("select3 DAO: " + result.size());
		return result;
	}
	
	// - 작업자 - 관리자에게 재고요청 인설트
	public int insert1(Sr_DTO sr_DTO) {
		System.out.println("갈 때 insert1 DAO (Requisition, quantity) : " + sr_DTO);
		int insert1 = sqlSession.insert("mapper.sr.insertSr1", sr_DTO);
		System.out.println("돌아올 때 insert1 DAO: " + insert1);
		return insert1;
	}
	
	//  - 관리자 - 반려버튼 딜리트
	public int delete(Sr_DTO sr_DTO) {
		System.out.println("갈 때 delete DAO : " + sr_DTO);
		int delete = sqlSession.delete("mapper.sr.deleteSr1", sr_DTO);
		System.out.println("돌아올 때 delete DAO: " + delete);
		return delete;
	}
	
	// - 관리자 - 업체주문내역 insert
	public int orderingInsert(Sr_DTO sr_DTO) {
		System.out.println("갈 때 orderingInsert DAO : " + sr_DTO);
		int orderingInsert = sqlSession.insert("mapper.sr.orderingInsert", sr_DTO);
		System.out.println("돌아올 때 delete DAO: " + orderingInsert);
		return orderingInsert;
	}
	
	// - 관리자 - 업체주문내역 delete
	public int orderingDelete(Sr_DTO sr_DTO) {
		System.out.println("갈 때 orderingDelete DAO : " + sr_DTO);
		int orderingDelete = sqlSession.delete("mapper.sr.orderingDelete", sr_DTO);
		System.out.println("돌아올 때 delete DAO: " + orderingDelete);
		return orderingDelete;
	}
	
	
}
