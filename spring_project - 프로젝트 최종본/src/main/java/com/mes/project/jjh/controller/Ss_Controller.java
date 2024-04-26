package com.mes.project.jjh.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mes.project.jjh.dto.Ss_DTO;
import com.mes.project.jjh.service.Ss_Service;

@Controller
public class Ss_Controller {
	private static final Logger logger = LoggerFactory.getLogger(Ss_Controller.class);

	@Autowired
	Ss_Service pagingService;

	@RequestMapping("/ot")
	public String select(@ModelAttribute Ss_DTO ssdto, Model model) {
//		////////////////////////////////// 페이징 구현///////////////////
//
//		// controller :
//		// - 요청에 따라서 service 호출
//		// - service의 결과물을 어떤 view로 보낼지 결정
//
//		// service :
//		// - 계산 등의 일을 한다.
//		// - dao 호출 담당
//
//		// dao :
//		// - DB 담당
//
//		// jsp :
//		// - view 담당
//
//		Ss_Service pagingService = new Ss_Service(); // 이거 주석처리 안하면
//		@Autowired	Ss_Service pagingService; 이게 작동을 안함

		int totalCount = pagingService.getTotalPaging(ssdto);
		List listPaging = pagingService.listPaging(ssdto);

		model.addAttribute("countPerPage", ssdto.getCountPerPage()); // 현재 페이지에 표시할 품목 수
		model.addAttribute("pageNum", ssdto.getPageNum());
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("listPaging", listPaging);
//		//////////////////////// 페이징 구현 //////////////////
		return "Stock_Status";

	}

	@RequestMapping(value = "/oi", method = { RequestMethod.GET, RequestMethod.POST })
	public String insert(
			@ModelAttribute Ss_DTO ssdto
	) throws IOException {
		int result = pagingService.insertMes(ssdto);
		
		return "redirect:/ot";
	}

	@RequestMapping("/od")
	public String delete(@ModelAttribute Ss_DTO ssdto) throws IOException {
//		System.out.println("ssdto : " + ssdto);
		int deleteNum = pagingService.deleteMes(ssdto);
//		System.out.println("deleteNum : " + deleteNum);

		return "redirect:/ot";
	}

	@RequestMapping(value = "/ou", method = { RequestMethod.GET, RequestMethod.POST })
	public String update(@ModelAttribute Ss_DTO ssdto) throws IOException {
		System.out.println("ou 진입 >> update >> " + ssdto);
		
		Map updateNum = pagingService.updateMes(ssdto);
		return "redirect:/ot";
	}


	@RequestMapping("/down")
	public void down(String fileName, HttpServletResponse response) {
		pagingService.download(fileName, response);

	}

}
