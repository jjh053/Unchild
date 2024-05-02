package com.mes.project.ldy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mes.project.ldy.dto.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Autowired
	private SqlSession sess;
	
	BoardDAOImpl() {
		System.out.println("BoardDAOImpl 실행");
	}
	
	public List<BoardDTO> selectOne(int seq) {

		List<BoardDTO> list = sess.selectList("mapper.board.selectReply", seq);
		System.out.println("selectBoard : " + list);
		
		return list;
	}
	
	@Override
	public String selectSname(int staffno) {
		String sname = sess.selectOne("mapper.board.selectSname", staffno);
		return sname;
	}
	
	
	public List reqBoard() {
		return sess.selectList("mapper.board.requestBoard");
	}
	
	
	
	public Map<String, Object> selectBoard(BoardDTO dto) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<BoardDTO> list = sess.selectList("mapper.board.selectBoard", dto);
		Integer totalCount = sess.selectOne("mapper.board.selectCount", dto.getBoardType());
		
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}
	
	
	public int deleteBoard(int seq) {
		int result = sess.delete("mapper.board.deleteBoard", seq);
		return result;
	}
	
	public int insertBoard(BoardDTO dto) {
		System.out.println("BoardDAOImpl > insertBoard : " + dto);
		
		System.out.println("getB_content" + dto.getB_content());
		System.out.println("getB_sequence" + dto.getB_sequence());
		System.out.println("getB_title" + dto.getB_title());
		System.out.println("getB_view" + dto.getB_view());
		System.out.println("getBoardType" + dto.getBoardType());
		System.out.println("getFileName" + dto.getFileName());
		System.out.println("getReplyId" + dto.getReplyId());
		System.out.println("getStaffno" + dto.getStaffno());
		System.out.println("getB_date" + dto.getB_date());
		
		int result = sess.insert("mapper.board.insertBoard", dto);
		return result;
	}
	
	public int updateBoard(BoardDTO dto) {
		int result = sess.insert("mapper.board.updateBoard", dto);
		return result;
	}
}