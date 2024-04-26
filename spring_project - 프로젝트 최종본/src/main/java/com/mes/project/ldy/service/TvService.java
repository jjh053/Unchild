package com.mes.project.ldy.service;

import java.util.List;
import java.util.Map;

import com.mes.project.ldy.dto.SD_DTO;
import com.mes.project.ldy.dto.StockDTO;

public interface TvService {
	public List<StockDTO> selectService();
	public List<StockDTO> selectOneList();
	public List<SD_DTO> processSel(int lineNum);
	public Map insertService(Map map);
}
