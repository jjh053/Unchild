package com.mes.project.lsh.workReport;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WorkReportController {
	
	@Autowired
	private WorkReportService workReportService;

	// 조회
	@RequestMapping(value="/workReport", method= {RequestMethod.GET})
	public String selctController(Model model, PagingDTO pagingDTO) {
		System.out.println("paging : " + pagingDTO);
		
		
		
		model.addAttribute("map", workReportService.selectService(pagingDTO));
		return "workReport";
	}
	
//	// 페이지 변경
//	@RequestMapping(value="/workReport/page", method= {RequestMethod.POST})
//	public String pageController(PagingDTO pagingDTO) {
//		
//		return null;
//	}
}
