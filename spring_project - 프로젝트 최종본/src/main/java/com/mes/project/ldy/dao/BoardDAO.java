package com.mes.project.ldy.dao;

import java.util.List;
import java.util.Map;

import com.mes.project.ldy.dto.BoardDTO;

public interface BoardDAO {
	public List<BoardDTO> selectOne(int seq);
	public String selectSname(int staffno);
	public Map<String, Object> selectBoard(BoardDTO dto);
	public int deleteBoard(int seq);
	public int insertBoard(BoardDTO dto);
	public int updateBoard(BoardDTO dto);
}
