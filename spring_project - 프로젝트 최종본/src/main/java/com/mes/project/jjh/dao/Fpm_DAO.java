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

import com.mes.project.jjh.dto.Fpm_DTO;

@Repository
public class Fpm_DAO {

	@Autowired
	private SqlSession sqlSession;

	// - 작업자 - 품목선택페이지 셀렉트
	public List select1(Fpm_DTO fpm_DTO) {
		System.out.println("갈 때 select1 fpm_DAO : " + fpm_DTO);
		List result = sqlSession.selectList("mapper.fpm.selectfpm1", fpm_DTO);
		System.out.println("올 때 select1 fpm_DAO: " + result);
		return result;
	}

	public List select2(Fpm_DTO fpm_DTO) {
		System.out.println("갈 때 select2 fpm_DAO : " + fpm_DTO);
		List result = sqlSession.selectList("mapper.fpm.selectfpm2", fpm_DTO);
		System.out.println("올 때 select2 fpm_DAO: " + result);
		return result;
	}

	public List select3(Fpm_DTO fpm_DTO) {
		System.out.println("갈 때 select3 fpm_DAO : " + fpm_DTO);
		List result = sqlSession.selectList("mapper.fpm.selectfpm3", fpm_DTO);
		System.out.println("올 때 select3 fpm_DAO: " + result);
		return result;
	}

	public List select4(Fpm_DTO fpm_DTO) {
		System.out.println("갈 때 select4 fpm_DAO : " + fpm_DTO);
		List result = sqlSession.selectList("mapper.fpm.selectfpm4", fpm_DTO);
		System.out.println("올 때 select4 fpm_DAO: " + result);
		return result;
	}

	public List monthSelect1(Fpm_DTO fpm_DTO) {
		System.out.println("갈 때 monthSelect1 fpm_DAO : " + fpm_DTO);
		List result = sqlSession.selectList("mapper.fpm.monthSelect1", fpm_DTO);
		System.out.println("올 때 monthSelect1 fpm_DAO: " + result);
		return result;
	}

	public List monthSelect2(Fpm_DTO fpm_DTO) {
		System.out.println("갈 때 monthSelect2 fpm_DAO : " + fpm_DTO);
		List result = sqlSession.selectList("mapper.fpm.monthSelect2", fpm_DTO);
		System.out.println("올 때 monthSelect2 fpm_DAO: " + result);
		return result;
	}

	public List monthSelect3(Fpm_DTO fpm_DTO) {
		System.out.println("갈 때 monthSelect3 fpm_DAO : " + fpm_DTO);
		List result = sqlSession.selectList("mapper.fpm.monthSelect3", fpm_DTO);
		System.out.println("올 때 monthSelect3 fpm_DAO: " + result);
		return result;
	}

	public List monthSelect4(Fpm_DTO fpm_DTO) {
		System.out.println("갈 때 monthSelect4 fpm_DAO : " + fpm_DTO);
		List result = sqlSession.selectList("mapper.fpm.monthSelect4", fpm_DTO);
		System.out.println("올 때 monthSelect4 fpm_DAO: " + result);
		return result;
	}

	public List monthSalsList1(Fpm_DTO fpm_DTO) {
		System.out.println("갈 때 monthSalsList1 fpm_DAO : " + fpm_DTO);
		List result = sqlSession.selectList("mapper.fpm.monthSalsList1", fpm_DTO);
		System.out.println("올 때 monthSalsList1 fpm_DAO: " + result);
		return result;
	}

	public List monthSalsList2(Fpm_DTO fpm_DTO) {
		System.out.println("갈 때 monthSalsList1 fpm_DAO : " + fpm_DTO);
		List result = sqlSession.selectList("mapper.fpm.monthSalsList2", fpm_DTO);
		System.out.println("올 때 monthSalsList1 fpm_DAO: " + result);
		return result;
	}

	public List monthSalsList3(Fpm_DTO fpm_DTO) {
		System.out.println("갈 때 monthSalsList2 fpm_DAO : " + fpm_DTO);
		List result = sqlSession.selectList("mapper.fpm.monthSalsList3", fpm_DTO);
		System.out.println("올 때 monthSalsList2 fpm_DAO: " + result);
		return result;
	}

	public List monthSalsList4(Fpm_DTO fpm_DTO) {
		System.out.println("갈 때 monthSalsList4 fpm_DAO : " + fpm_DTO);
		List result = sqlSession.selectList("mapper.fpm.monthSalsList4", fpm_DTO);
		System.out.println("올 때 monthSalsList4 fpm_DAO: " + result);
		return result;
	}

	// 이번달 등급별 총 판매량
	public int totalEntryMonthSals() {
		int result = sqlSession.selectOne("mapper.fpm.totalEntryMonthSals");
		return result;
	}

	public int totalMainMonthSals() {
		int result = sqlSession.selectOne("mapper.fpm.totalMainMonthSals");
		return result;
	}

	public int totalPerforMonthSals() {
		int result = sqlSession.selectOne("mapper.fpm.totalPerforMonthSals");
		return result;
	}
	// 이번달 등급별 총 판매량 끝

	// 지난달 등급별 총 판매량을 토대로한(+5%) 이번달 목표판매량(mapper 재활용해서 코드 줄임)
	public int totalEntryMonthSalestarget() {
		int result = sqlSession.selectOne("mapper.fpm.totalEntryLastMonthSals");
		System.out.println("이번달 목표판래량 5% 적용 전" + result);
		double a = 1.05;
		int result2 = (int) (result * a);
		System.out.println("이번달 목표판래량 5% 적용 후" + result2);
		return result2;
	}

	public int totalMainMonthSalestarget() {
		int result = sqlSession.selectOne("mapper.fpm.totalMainLastMonthSals");
		System.out.println("이번달 목표판래량 5% 적용 전" + result);
		double a = 1.05;
		int result2 = (int) (result * a);
		System.out.println("이번달 목표판래량 5% 적용 후" + result2);
		return result2;
	}

	public int totalPerforMonthSalestarget() {
		int result = sqlSession.selectOne("mapper.fpm.totalPerforLastMonthSals");
		System.out.println("이번달 목표판래량 5% 적용 전" + result);
		double a = 1.05;
		int result2 = (int) (result * a);
		System.out.println("이번달 목표판래량 5% 적용 후" + result2);
		return result2;
	}
	// 지난달 등급별 총 판매량을 토대로한(+5%) 이번달 목표판매량(mapper 재활용해서 코드 줄임) 끝

	// 지난달 등급별 총 판매량
	public int totalEntryLastMonthSals() {
		int result = sqlSession.selectOne("mapper.fpm.totalEntryLastMonthSals");
		return result;
	}

	public int totalMainLastMonthSals() {
		int result = sqlSession.selectOne("mapper.fpm.totalMainLastMonthSals");
		return result;
	}

	public int totalPerforLastMonthSals() {
		int result = sqlSession.selectOne("mapper.fpm.totalPerforLastMonthSals");
		return result;
	}
	// 지난달 등급별 총 판매량 끝

	// 지난달 목표 판매량을 구하기 위한 두달 전 판매량 총 합 * 5%
	public int totalEntryLastSalestarget() {
		int result = sqlSession.selectOne("mapper.fpm.totalEntryLastSalestarget");
		System.out.println("지난달 목표판래량 5% 적용 전" + result);
		double a = 1.05;
		int result2 = (int) (result * a);
		System.out.println("지난달 목표판래량 5% 적용 후" + result2);
		return result2;
	}

	public int totalMainLastSalestarget() {
		int result = sqlSession.selectOne("mapper.fpm.totalMainLastSalestarget");
		System.out.println("지난달 목표판래량 5% 적용 전" + result);
		double a = 1.05;
		int result2 = (int) (result * a);
		System.out.println("지난달 목표판래량 5% 적용 후" + result2);
		return result2;
	}

	public int totalPerforLastSalestarget() {
		int result = sqlSession.selectOne("mapper.fpm.totalPerforLastSalestarget");
		System.out.println("지난달 목표판래량 5% 적용 전" + result);
		double a = 1.05;
		int result2 = (int) (result * a);
		System.out.println("지난달 목표판래량 5% 적용 후" + result2);
		return result2;
	}
	// 지난달 목표 판매량을 구하기 위한 두달 전 판매량 총 합 * 5%
	
	// 다음달 목표판매량을 구하기 위한 이번달 제외한 3달간의 총 판매량
	public int entryPastThreeMonths() {
		int result = sqlSession.selectOne("mapper.fpm.entryPastThreeMonths");
		System.out.println("다음달 목표판매량 적용 전" + result);
		int a = 3;
		int result2 = (int) (result / a);
		System.out.println("다음달 목표판매량 적용 후" + result2);
		return result2;
	}
	
	public int mainPastThreeMonths() {
		int result = sqlSession.selectOne("mapper.fpm.mainPastThreeMonths");
		System.out.println("다음달 목표판매량 적용 전" + result);
		int a = 3;
		int result2 = (int) (result / a);
		System.out.println("다음달 목표판매량 적용 후" + result2);
		return result2;
	}
	
	public int perforPastThreeMonths() {
		int result = sqlSession.selectOne("mapper.fpm.perforPastThreeMonths");
		System.out.println("다음달 목표판매량 적용 전" + result);
		int a = 3;
		int result2 = (int) (result / a);
		System.out.println("다음달 목표판매량 적용 후" + result2);
		return result2;
	}
	
	// 다음달 목표판매량을 구하기 위한 이번달 제외한 3달간의 총 판매량 끝
	

}
