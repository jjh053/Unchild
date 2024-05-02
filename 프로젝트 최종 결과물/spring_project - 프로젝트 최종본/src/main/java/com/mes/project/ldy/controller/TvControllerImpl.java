package com.mes.project.ldy.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mes.project.jjh.dto.Ss_DTO;
import com.mes.project.jjh.service.Ss_Service;
import com.mes.project.ldy.dto.SD_DTO;
import com.mes.project.ldy.dto.StockDTO;
import com.mes.project.ldy.service.TvServiceImpl;


@Controller
public class TvControllerImpl implements TvController {
	private static final Logger log = LoggerFactory.getLogger(BoardControllerImpl.class);
	
	@Autowired
	private TvServiceImpl service;
	
	@Autowired
	private Ss_Service ss_service;
	
	// 셀렉트
	@Override
	@RequestMapping("/facility")
	public String selectController(Model model, @ModelAttribute Ss_DTO ssdto) {
		List<StockDTO> list = service.selectService();
		List<Ss_DTO> list2 = ss_service.listLDY();
		
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		
		return "facilitiespage";
	}
	
	@Override
	@RequestMapping("/process")
	public String selectProcess(Model model) {
		
		List<StockDTO> list = service.selectOneList();
		
		List<StockDTO> endNullList = service.processEndTimeSel();
		
		List tmp_list2 = ss_service.listMesLDY();
		List mes_list = new ArrayList();
		
		for(int i=0; i<tmp_list2.size(); i++) {
			Map map = new HashMap();
			map.put("mesName", ((Ss_DTO)tmp_list2.get(i)).getMesName());
			map.put("mesCount", ((Ss_DTO)tmp_list2.get(i)).getGCount());
			mes_list.add(map);
		}
		
		List<List<SD_DTO>> stockList = new ArrayList<List<SD_DTO>>();
		
		
		for(int i=0; i<endNullList.size(); i++) {
			int lineNum = endNullList.get(i).getLineNum();
			List<SD_DTO> tmp_list = service.processSel(lineNum);
			stockList.add(tmp_list);
		}
		model.addAttribute("list", list);
		model.addAttribute("mesList", mes_list);
		model.addAttribute("stockList", stockList);
		model.addAttribute("endNullList", endNullList);
		
		return "process";
	}
	
	// eqi 테이블 업데이트
	@RequestMapping(value = "/option_pass", method = {RequestMethod.POST})
	@ResponseBody public String updatePassProcess(@RequestBody StockDTO stockDTO) {
		service.processUpPass(stockDTO);
		
		return "";
	}
	@RequestMapping(value = "/option_fail", method = {RequestMethod.POST})
	@ResponseBody public String updateFailProcess(@RequestBody StockDTO stockDTO) {
		service.processUpFail(stockDTO);
		
		return "";
	}
	@RequestMapping(value = "/option_end", method = {RequestMethod.POST})
	@ResponseBody public String updateEndProcess(@RequestBody StockDTO stockDTO) {
		service.processUpEnd(stockDTO);
		
		return "";
	}
	@RequestMapping(value = "/option_totalEnd", method = {RequestMethod.POST})
	@ResponseBody public String updateTotalEndProcess() {
		service.processUpTotalEnd();
		return "";
	}
	
	
	// 인서트
	@Override
	@RequestMapping(value = "/option", method = {RequestMethod.POST})
	@ResponseBody public int insertController(Model model, @RequestBody List<Map> list) {
		
		Map resultMap = null;
		
		for(int i=0; i<list.size(); i++) {
			log.warn("insertController > list.get(" + i + ") : " + list.get(i));
			resultMap = service.insertService(list.get(i));
		}
		
		return (Integer)resultMap.get("insertResult");
	}
	
	
	// 메인페이지 일일 생산 현황
	
	@RequestMapping(value = "/itv_process", method = {RequestMethod.POST})
	@ResponseBody public List<StockDTO> selectInterval() {
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd"); // 일을 추출하기 위한 포맷을 설정합니다.
	    String dayStr = sdf.format(date); // 현재 날짜에서 일을 추출합니다.
	    int day = Integer.parseInt(dayStr);
	    
	    System.out.println("dto >> 오늘 날짜의 일 >> " + day);
	    
		List<StockDTO> list = service.selectInterval(day);

		System.out.println("selectInterval >> list : " + list);
		
		return list;
	}
	
}
