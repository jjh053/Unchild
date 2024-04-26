package com.mes.project.ldy.service;

import java.util.List;
import java.util.Map;

import com.mes.project.ldy.dto.BoardDTO;

public interface BoardService {
	
	public List<BoardDTO> listOne(int seq);
	public Map<String, Object> listBoard(BoardDTO dto);
	
	public int listDeleteBoard(int seq);
	
	public int listInsertBoard(BoardDTO dto);
	
	public int listUpdateBoard(BoardDTO dto);
}
