package com.mes.project.lsh.workReport;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WorkReportService {

	@Autowired
	private WorkReportDAO workReportDAO;
	
	// 조회
	public Map<String, Object> selectService(PagingDTO pagingDTO) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 가져온 날짜가 없다면 현재 날짜로 설정
		String select_date = pagingDTO.getSelect_date();
		
		int now_page = pagingDTO.getNow_page();
		if( "".equals(select_date) ) {
			Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
			select_date = format.format(date);
			System.out.println("현재시간" + format.format(date));
			pagingDTO.setSelect_date( format.format(date) );
		}
		
		pagingDTO = workReportDAO.selectPageNum(pagingDTO);
		
		int page_num = pagingDTO.getPage_num();
		pagingDTO.setNow_page(now_page);
		
		page_num = pagingDTO.getPage_num();
		now_page = pagingDTO.getNow_page();
		System.out.println("now_page : " + now_page);
		int last_page = (int) Math.ceil((double) page_num / 2);
		System.out.println("page_num : " + page_num);
		System.out.println("last_page : " + last_page);
		int sec_position = (int) Math.ceil((double) now_page / 2);
		System.out.println("sec_position : " + sec_position);
		// 2 : 4 ~ 6
		int sec_first = (sec_position - 1) * 2 + 1;
		int sec_last = sec_position * 2;
		System.out.println("숫자 : " + sec_first);
		// 28 : 28 ~ 30
		if(sec_last > last_page) {
			sec_last = last_page;
		}
		System.out.println("-------------------dtosdlnlksdndlk------------------------" + pagingDTO);
		
		pagingDTO.setSelect_date(select_date);
		pagingDTO.setLast_page(last_page);
		pagingDTO.setSec_first(sec_first);
		pagingDTO.setSec_last(sec_last);
		
		
		System.out.println("selectService >> pagignDTO-------------" + pagingDTO);
		map.put("pagingDTO", pagingDTO);
		
		
		List<WorkReportDTO> list = workReportDAO.selectWorkReport(pagingDTO);	

		map.put("list", list);
		
		return map;
	}
}
