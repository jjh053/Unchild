package com.mes.project.ldy.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mes.project.ldy.dao.TvDAOImpl;
import com.mes.project.ldy.dto.SD_DTO;
import com.mes.project.ldy.dto.StockDTO;


@Service
public class TvServiceImpl implements TvService {
	@Autowired
	private TvDAOImpl dao;
	
	@Override
	public List<StockDTO> selectService() {
		return dao.selectDAO();
	}
	
	@Override
	public List<StockDTO> selectOneList() {
		return dao.selectOne();
	}
	
	@Override
	public List<SD_DTO> processSel(int lineNum) {
		return dao.selectProcess(lineNum);
	}
	
	public List<StockDTO> processEndTimeSel() {
		return dao.selectEndTimeNull();
	}
	
	public int processUpPass(StockDTO stockDTO) {
		return dao.updateProcPass(stockDTO);
	}
	public int processUpFail(StockDTO stockDTO) {
		return dao.updateProcFail(stockDTO);
	}
	public int processUpEnd(StockDTO stockDTO) {
		return dao.updateProcEnd(stockDTO);
	}
	public int processUpTotalEnd() {
		return dao.updateTotalEnd();
	}
	
	@Override
	public Map insertService(Map map) {
		return dao.insertDAO(map);
	}
	
	
	// 메인용
	public List<StockDTO> selectInterval(int day) {
		return dao.selectInterval(day);
	}
	
	
	
	
	
	
}
