package com.mes.project.ldy.dao;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mes.project.ldy.dto.SD_DTO;
import com.mes.project.ldy.dto.StockDTO;

@Repository
public class TvDAOImpl implements TvDAO {
	
	@Autowired
	private SqlSession sess;
	
	@Override
	public List<StockDTO> selectDAO() {
		List<StockDTO> result = sess.selectList("mapper.factory.selectGrade");
		return result;
	}
	
	@Override
	public List<StockDTO> selectOne() {
		List<StockDTO> result = sess.selectList("mapper.factory.selectOne");
		return result;
	}
	
	
	@Override
	public List<SD_DTO> selectProcess(int lineNum) {
		List<SD_DTO> result = sess.selectList("mapper.factory.selectProcess", lineNum);
		
		return result;
	}
	
	public List<StockDTO> selectEndTimeNull() {
		List<StockDTO> result = sess.selectList("mapper.factory.selectEndTimeNull");
		return result;
	}
	
	
	
	
	
	public int updateProcPass(StockDTO stockDTO) {
		int result = sess.update("mapper.factory.update_eqi_pass", stockDTO);
		return result;
	}
	
	public int updateProcFail(StockDTO stockDTO) {
		int result = sess.update("mapper.factory.update_eqi_fail", stockDTO);
		return result;
	}
	
	public int updateProcEnd(StockDTO stockDTO) {
		int result = sess.update("mapper.factory.update_eqi_end", stockDTO);
		return result;
	}
	
	public int updateTotalEnd() {
		int result = sess.update("mapper.factory.truncate_process");
		return result;
	}
	
	
	
	@Override
	public Map<String, Object> insertDAO(Map map) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		StockDTO dto = new StockDTO();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.util.Date parsedDate;
		java.sql.Timestamp sqlDate = null;
		
        try {
            parsedDate = format.parse((String)map.get("startTime"));
            sqlDate = new java.sql.Timestamp(parsedDate.getTime());
        } catch (Exception e) {
            e.printStackTrace();
        }
		dto.setStartTime(sqlDate);
		dto.setLineNum(((Integer)map.get("lineNum")).intValue());
		dto.setG_sequence(Integer.parseInt((String)map.get("g_sequence")));
		
		dto.setProduct(Integer.parseInt((String)map.get("product")));
		int insertResult = sess.insert("mapper.factory.insert_eqi", dto);
		
		int updateResult = -1;
		List<LinkedHashMap> list = (List<LinkedHashMap>)map.get("stockName");

		for(int i = 0; i < list.size() ; i++ ) {
			SD_DTO sd = new SD_DTO();
			
			sd.setLineNum(((Integer)map.get("lineNum")).intValue());
			sd.setStockType((String)list.get(i).get("name"));
			sd.setStockName((String)list.get(i).get("data"));
			sd.setStockCount(Integer.parseInt((String)map.get("product")));
			
			updateResult = sess.update("mapper.factory.update_mes", sd);
			sess.insert("mapper.factory.insert_process", sd);
		}
		
		resultMap.put("insertResult", insertResult);
		resultMap.put("updateResult", updateResult);
		
		
		return resultMap;
	}
	
	
	
	
	// 메인용
	public List<StockDTO> selectInterval(int day) {
		List<StockDTO> list = null;
		list = sess.selectList("mapper.factory.selectITV", day);
		
		return list;
	}

}
