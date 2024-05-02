package com.mes.project.ldy.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mes.project.ldy.dao.BoardDAOImpl;
import com.mes.project.ldy.dto.BoardDTO;
import com.mes.project.lsh.file.FileUpload;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAOImpl dao;
	@Autowired
    private FileUpload fileUpload;
	
	
	public List reqBoard() {
		return dao.reqBoard();
		
	}
	
	@Override
	public List<BoardDTO> listOne(int seq) {
		List<BoardDTO> list = dao.selectOne(seq);
		return list;
	}
	
	public List<String> nameList(int seq) {
		List<BoardDTO> list = dao.selectOne(seq);
		List<String> nameList = new ArrayList<String>();
		
		for(int i=0; i<list.size(); i++) {
			String sname = dao.selectSname(list.get(i).getStaffno());
			nameList.add(sname);
		}
		
		return nameList;
		
	}
	
	

	@Override
	public Map<String, Object> listBoard(BoardDTO dto) {
		
		int start = 0;
		int end = 0;
		
		if(dto.getPageNum() <= 0) {
			dto.setPageNum(1);
		}
		if(dto.getCountPerPage() <= 0) {
			dto.setCountPerPage(5);
		}
		
		System.out.println("dto.getPageNum() : " + dto.getPageNum());
		System.out.println("dto.getCountPerPage() : " + dto.getCountPerPage());
		
		start = ((dto.getPageNum() - 1) * dto.getCountPerPage()) + 1;
		end = dto.getPageNum() * dto.getCountPerPage();
		
		System.out.println("start : " + start + " , end : " + end);
		
		
		dto.setStartColumn(start);
		dto.setEndColumn(end);

		Map map = dao.selectBoard(dto);
		
		return map;
	}

	@Override
	public int listDeleteBoard(int seq) {
		return dao.deleteBoard(seq);
	}

	@Override
	public int listInsertBoard(BoardDTO dto) {
		try {
			dto.setFileName( fileUpload.upload(dto.getImgFileName()) );
			
			System.out.println("dto.getFileName : " + dto.getFileName());
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return dao.insertBoard(dto);
	}

	@Override
	public int listUpdateBoard(BoardDTO dto) {
		return dao.updateBoard(dto);
	}
}
