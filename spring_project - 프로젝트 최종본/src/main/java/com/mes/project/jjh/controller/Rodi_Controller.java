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

import com.mes.project.jjh.dto.Rodi_DTO;
import com.mes.project.jjh.service.Rodi_Service;

@Controller
public class Rodi_Controller {
	private static final Logger logger = LoggerFactory.getLogger(Rodi_Controller.class);

	@Autowired
	Rodi_Service rodiService;

	@RequestMapping("/rodi")
	public String select(@ModelAttribute Rodi_DTO rodiDTO, Model model) {
//		- 작업자 - 품목선택 페이지
		List list2 = rodiService.select1(rodiDTO);
		List list3 = rodiService.select2(rodiDTO);
		System.out.println("Rodi_Controller list2 : " + list2);
		System.out.println("Rodi_Controller list3 : " + list3);

//		- 작업자 - 품목선택페이지의 검색버튼 클릭시 null 또는 not null로 
//				 페이지 팝업장의 display:none, display:block 유무 결정
		model.addAttribute("gradeSerch", rodiDTO.getMesGradeSerch());
//		- 관리자 - 업체주문내역페이지의 검색버튼 클릭시 null 또는 not null로 
//		 		 페이지 팝업장의 display:none, display:block 유무 결정

//		- 작업자 - 품목선택페이지 리스트
		model.addAttribute("list2", list2);
//		- 관리자 - 재고신청확인 리스트
		model.addAttribute("list3", list3);
		return "Report_Of_Defective_Inventory";
	}

//	-작업자- 관리자에게 주문요청 
	@RequestMapping("/ri")
	public String insert(@ModelAttribute Rodi_DTO dto) {
		int insert1 = rodiService.insert1(dto);
		System.out.println("돌아올 때 Sr_Controller insert1 : " + insert1);
		return "redirect:/rodi";
	}

//	-관리자- 반품신청확인 딜리트
	@RequestMapping("/rd")
	public String delete(HttpServletRequest request) {
		
		String[] de_numbers = request.getParameterValues("de_number");
		for (int i = 0; i < de_numbers.length; i++) {
			Rodi_DTO rodiDTO = new Rodi_DTO();
			rodiDTO.setDe_number(Integer.parseInt(de_numbers[i]));
			int delete = rodiService.delete(rodiDTO);
			System.out.println("돌아올 때 Rodi_Controller delete : " + delete);
		}
		return "redirect:/rodi";
	}

}
