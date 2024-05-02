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

import com.mes.project.jjh.dto.Sr_DTO;
import com.mes.project.jjh.service.Sr_Service;

@Controller
public class Sr_Controller {
	private static final Logger logger = LoggerFactory.getLogger(Sr_Controller.class);

	@Autowired
	Sr_Service selectService;

	@RequestMapping("/SS")
	public String select(@ModelAttribute Sr_DTO srdto, Model model) {
//		- 작업자 - 품목선택페이지
		List itemSelectPage = selectService.select1(srdto);
		List requestConfirmation = selectService.select2(srdto);
		List orderHistory = selectService.select3(srdto);
		System.out.println("Sr_Controller itemSelectPage : " + itemSelectPage);
		System.out.println("Sr_Controller requestConfirmation : " + requestConfirmation);
		System.out.println("Sr_Controller orderHistory : " + orderHistory);

//		- 작업자 - 품목선택페이지의 검색버튼 클릭시 null 또는 not null로 
//				 페이지 팝업장의 display:none, display:block 유무 결정
		model.addAttribute("gradeSerch", srdto.getMesGradeSerch());
//		- 관리자 - 업체주문내역페이지의 검색버튼 클릭시 null 또는 not null로 
//		 		 페이지 팝업장의 display:none, display:block 유무 결정
		model.addAttribute("orderingName", srdto.getOrderingName());

//		- 작업자 - 품목선택페이지 리스트
		model.addAttribute("itemSelectPage", itemSelectPage);
//		- 관리자 - 재고신청확인 리스트
		model.addAttribute("requestConfirmation", requestConfirmation);
		model.addAttribute("orderHistory", orderHistory);
		return "Stock_Request";
	}

//	-작업자- 관리자에게 주문요청 
	@RequestMapping("/si")
	public String insert(HttpServletRequest request) {

		String[] mesGrades = request.getParameterValues("mesGrade");
		String[] quantities = request.getParameterValues("orderQuantity");
		String[] userInfos = request.getParameterValues("userInfo");

		for (int i = 0; i < mesGrades.length; i++) {
			Sr_DTO srDTO = new Sr_DTO();
			srDTO.setMesGrade(mesGrades[i]);
			srDTO.setOrderQuantity(Integer.parseInt(quantities[i]));
			srDTO.setUserInfo(userInfos[i]);
			int insert1 = selectService.insert1(srDTO);
			System.out.println("돌아올 때 Sr_Controller insert1 : " + insert1);
		}
		return "Stock_Request";
	}
	
	@RequestMapping(value="/sidy", method = { RequestMethod.POST, RequestMethod.GET })
	public String insertLDY(HttpServletRequest request) {
		
		String[] mesGrades = request.getParameter("mesGrade").split(",");
		String[] orderQuantitys = request.getParameter("orderQuantity").split(",");
		
		String userInfo = request.getParameter("userInfo");
		for (int i = 0; i < mesGrades.length-1; i++) {
			Sr_DTO srDTO = new Sr_DTO();
			srDTO.setMesGrade(mesGrades[i]);
			srDTO.setOrderQuantity(Integer.parseInt(orderQuantitys[i]));
			srDTO.setUserInfo(userInfo);
			int insert1 = selectService.insert1(srDTO);
		}
		
		return "redirect:/main_work";
	}

//	-관리자- 반려 틸리트
	@RequestMapping("/sd")
	public String delete(@ModelAttribute Sr_DTO srdto) {
		System.out.println("갈 때 Sr_Controller delete : " + srdto);
		int delete = selectService.delete(srdto);
		System.out.println("돌아올 때 Sr_Controller delete : " + delete);

		return "redirect:/SS";
	}

//	-관리자- 업체주문요청 인설트, 딜리트
	@RequestMapping("/sid")
	public String orderingInsertDelete(HttpServletRequest request) {

		String[] mesGrades = request.getParameterValues("mesGrade");
		String[] quantities = request.getParameterValues("orderQuantity");
		String[] mesIds = request.getParameterValues("mesId");
		String[] co_Numbers = request.getParameterValues("co_Number");

		for (int i = 0; i < mesGrades.length; i++) {
			Sr_DTO srDTO = new Sr_DTO();
			srDTO.setMesGrade(mesGrades[i]);
			srDTO.setOrderQuantity(Integer.parseInt(quantities[i]));
			srDTO.setMesId(Integer.parseInt(mesIds[i]));
			srDTO.setCo_Number(Integer.parseInt(co_Numbers[i]));

			// 업체주문내역 insert
			int orderingInsert = selectService.orderingInsert(srDTO);
			// 업체주문내역 delete
			int orderingDelete = selectService.orderingDelete(srDTO);
			System.out.println("돌아올 때 Sr_Controller insertDelete : " + orderingInsert);
			System.out.println("돌아올 때 Sr_Controller insertDelete : " + orderingDelete);
		}

		return "redirect:/SS";
	}

}
