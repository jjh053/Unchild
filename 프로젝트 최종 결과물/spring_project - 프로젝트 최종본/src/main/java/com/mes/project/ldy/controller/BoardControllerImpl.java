package com.mes.project.ldy.controller;

import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mes.project.ldy.dto.BoardDTO;
import com.mes.project.ldy.service.BoardServiceImpl;

@Controller
public class BoardControllerImpl implements BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardControllerImpl.class);

	@Autowired
	private BoardServiceImpl service;

	BoardControllerImpl() {
		System.out.println("BoardControllerImpl 실행");
	}
	
	
	@Override
	@RequestMapping("/replyList")
	@ResponseBody public Map<String, Object> replyList(
			Model model,
			@RequestBody BoardDTO boardDTO
	) {
		System.out.println("아작스 들어옴? >> seq : " + boardDTO);
		
		List<BoardDTO> replyList = service.listOne(boardDTO.getB_sequence());
		List<String> nameList = service.nameList(boardDTO.getB_sequence());
		
		for(int i=0; i<replyList.size(); i++) {
			System.out.println("ㅇㅇ??" + replyList.get(i).getB_date());
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("replyList", replyList);
		map.put("nameList", nameList);
		
		return map;
	}
	
	@Override
	@RequestMapping("/boardTable.do")
	public String boardTableList(Model model, @ModelAttribute BoardDTO dto) {
		
		// 원글 확인 
		List<BoardDTO> list = null; 
		Map<String, Object> map = service.listBoard(dto);
		Integer totalCount_obj = (Integer) map.get("totalCount");
		int totalCount = totalCount_obj.intValue();
		
		try {
			list = (List<BoardDTO>)map.get("list");
		} catch(Exception e) {
			System.out.println("list 못바꿈");
		}
		
		for(int i=0; i<list.size(); i++) {
			System.out.println("list : " + list.get(i).getFileName());
		}

		model.addAttribute("countPerPage", dto.getCountPerPage()); // 현재 페이지에 표시할 품목 수
		model.addAttribute("pageNum", dto.getPageNum());
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list", list);

		if ("자유게시판".equals(dto.getBoardType())) {
			return "boardTable";
		} else if ("QaA게시판".equals(dto.getBoardType())) {
			return "QA";
		} else if ("건의게시판".equals(dto.getBoardType())) {
			return "suggestTable";
		} else {
			return "boardTable";
		}
	}

	@Override
	@RequestMapping("/dod")
	public String boardTableDelete(Model model, @RequestParam("seq") int seq,
			@RequestParam("boardType") String boardType) {

		int result = service.listDeleteBoard(seq);

		return "redirect:/boardTable.do?boardType=" + URLEncoder.encode(boardType);
	}

	@Override
	@RequestMapping(value = "/doi", method = { RequestMethod.POST, RequestMethod.GET })
	public String boardTableInsert(
			@ModelAttribute BoardDTO dto
	) {
	    System.out.println("Received DTO: " + dto);
	    
	    Timestamp nowDate = new Timestamp(System.currentTimeMillis());
	    dto.setB_date(nowDate);
	    
	    int result = service.listInsertBoard(dto);

	    return "redirect:/boardTable.do?boardType=" + URLEncoder.encode(dto.getBoardType());
	}
	
	@RequestMapping(value = "/doii", method = { RequestMethod.POST })
	@ResponseBody public String boardTableInsertAjax(@RequestBody BoardDTO dto) throws Exception {
		
		Timestamp nowDate = new Timestamp(System.currentTimeMillis());
		dto.setB_date(nowDate);
		
		int result = service.listInsertBoard(dto);
	
		if(result > 0) {
			return "SUCC";
		} else {
			return "FAIL";
		}
		
	}

	@Override
	@RequestMapping(value = "/dou", method = { RequestMethod.POST })
	public String boardTableUpdate(@ModelAttribute BoardDTO dto) {

		System.out.println(dto);

		int result = service.listUpdateBoard(dto);
		System.out.println("Update > result : " + result);

		
		return "redirect:/boardTable.do?boardType=" + URLEncoder.encode(dto.getBoardType());
	}

}

//