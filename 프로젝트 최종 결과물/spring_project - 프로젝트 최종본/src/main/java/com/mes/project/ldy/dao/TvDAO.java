package com.mes.project.ldy.dao;

import java.util.List;
import java.util.Map;

import com.mes.project.ldy.dto.SD_DTO;
import com.mes.project.ldy.dto.StockDTO;

public interface TvDAO {
	public List<StockDTO> selectDAO();
	public List<StockDTO> selectOne();
	public List<SD_DTO> selectProcess(int lineNum);
	public Map<String, Object> insertDAO(Map map);

}
