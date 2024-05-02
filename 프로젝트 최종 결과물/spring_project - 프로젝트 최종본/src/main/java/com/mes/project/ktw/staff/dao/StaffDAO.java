package com.mes.project.ktw.staff.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mes.project.ktw.staff.dto.AbsentDTO;
import com.mes.project.ktw.staff.dto.Role;
import com.mes.project.ktw.staff.dto.StaffDTO;

@Repository
public class StaffDAO {
	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public String checkUserIdStatus(int staffno) {
		return sqlSession.selectOne("mapper.staff.checkUserIdStatus", staffno);
	}

	// select
	// 로그인
	public StaffDTO findByUserId(String userId) {
		System.out.println("유저아이디" + userId);
		StaffDTO staff = sqlSession.selectOne("mapper.staff.findByUserId", userId);
		return staff;

	}
	
	public int countStaff(Map<String, Object> params) {
	    return sqlSession.selectOne("mapper.staff.countStaff", params);
	}
	
	public int countRole(Map<String, Object> params) {
	    return sqlSession.selectOne("mapper.staff.countRole", params);
	}

	// 직원 조회
	public StaffDTO getStaff(int staffno) {
		StaffDTO staff = sqlSession.selectOne("mapper.staff.selectStaff", staffno);
		return staff;
	}

	// 직원 목록 조회
	public List<StaffDTO> getStaffList(Map<String, Object> params) {
		List<StaffDTO> staffList = new ArrayList<StaffDTO>();
		staffList = sqlSession.selectList("mapper.staff.selectStaffList", params);
		return staffList;
	}
	
	//권한 목록 조회
	public List<StaffDTO> getRoleList(Map<String, Object> params) {
		List<StaffDTO> staffList = new ArrayList<StaffDTO>();
		staffList = sqlSession.selectList("mapper.staff.selectRoleList", params);
		return staffList;
	}

	// 휴가 목록 조회
	public List<AbsentDTO> getAbsentList(int typeNumber) {
		AbsentDTO absent = new AbsentDTO();
		absent.setTypeNumber(typeNumber);
		List<AbsentDTO> list = sqlSession.selectList("mapper.staff.getAbsentList", absent);
		return list;
	}
	
	public void addAbsent(AbsentDTO absent) {
		sqlSession.insert("mapper.staff.insertAbsent", absent);
	}

	// insert
	// 직원 추가
	public void addStaff(StaffDTO staff) {
		sqlSession.insert("mapper.staff.addStaff", staff);
	}

	// update
	// 직원 정보 수정
	public void updateStaff(StaffDTO staff) {
		sqlSession.update("mapper.staff.updateStaff", staff);
	}

	// 권한 정보 수정
	public int updateStaffRole(int staffno, Role newRole) {
		StaffDTO staffDTO = new StaffDTO();
		staffDTO.setStaffno(staffno);
		staffDTO.setRole(newRole);
		return sqlSession.update("mapper.staff.updateRole", staffDTO);
	}

	// 휴가 상태 업데이트
	public int updateAbsent(int absentId, String status) {
		AbsentDTO absent = new AbsentDTO();
		absent.setStatus(status);
		absent.setId(absentId);
		System.out.println("dao 아이디 확인 : " + absentId);
		System.out.println("dao 스테이터스: " + absent.getStatus());
		return sqlSession.update("mapper.staff.updateAbsentStatus", absent);
	}

	// delete
	// 직원 삭제
	public int deleteStaff(int staffno) {
		return sqlSession.delete("mapper.staff.deleteStaff", staffno);
	}

	public int updateAccount(StaffDTO staff) {
		return sqlSession.update("mapper.staff.staffAccount", staff);
	}

}
