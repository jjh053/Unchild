package com.mes.project.ldy.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.mes.project.ldy.dto.BoardDTO;

public interface BoardController {
	public String boardTableList(Model model, BoardDTO dto);
	public Map<String, Object> replyList(Model model, BoardDTO dto);
	public String boardTableDelete(Model model, int seq, String boardType);
	public String boardTableUpdate(BoardDTO dto);
	
	public String boardTableInsert(BoardDTO dto);
}
