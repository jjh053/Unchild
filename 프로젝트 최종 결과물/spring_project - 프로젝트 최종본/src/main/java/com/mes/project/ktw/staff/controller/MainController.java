package com.mes.project.ktw.staff.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mes.project.jjh.dto.Sr_DTO;
import com.mes.project.jjh.dto.Ss_DTO;
import com.mes.project.jjh.service.Fpm_Service;
import com.mes.project.jjh.service.Sr_Service;
import com.mes.project.jjh.service.Ss_Service;
import com.mes.project.ldy.service.BoardServiceImpl;

@Controller
public class MainController {

	@Autowired
	BoardServiceImpl b_service;
	@Autowired
	Fpm_Service fpm_Service;
	@Autowired
	Sr_Service sr;
	@Autowired
	Ss_Service ss;


	@RequestMapping("/main_work")
	public String mainWorkForm(Model model, @ModelAttribute Sr_DTO srdto, Ss_DTO ssdto) {
		System.out.println("왔냐고");
		ssdto.setStart(1);
		ssdto.setEnd(4);
		// 재고현황
		List listPaging = ss.listPaging(ssdto);
		model.addAttribute("listPaging", listPaging);
		
		System.out.println("listPaging : " +listPaging);
		
		List b_list = b_service.reqBoard();

		model.addAttribute("b_list", b_list);
		int totalEntryMonthSals = fpm_Service.totalEntryMonthSals();
		int totalMainMonthSals = fpm_Service.totalMainMonthSals();
		int totalPerforMonthSals = fpm_Service.totalPerforMonthSals();
		// 이번달 등급별 총 판매량 끝

		// 이번달 실판매량
		model.addAttribute("totalEntryMonthSals", totalEntryMonthSals);
		model.addAttribute("totalMainMonthSals", totalMainMonthSals);
		model.addAttribute("totalPerforMonthSals", totalPerforMonthSals);

		// 재고 신청내역
		List itemSelectPage = sr.select1(srdto);
		List requestConfirmation = sr.select2(srdto);
		List orderHistory = sr.select3(srdto);

		model.addAttribute("itemSelectPage", itemSelectPage);


		// 이번달 등급별 총 판매량기반 실수익
		double tems = ((double) totalEntryMonthSals * 700000) / 100000000;
		double tmms = ((double) totalMainMonthSals * 1200000) / 100000000;
		double tpms = ((double) totalPerforMonthSals * 2000000) / 100000000;
		int temsi = (int) tems;
		int tmmsi = (int) tmms;
		int tpmsi = (int) tpms;
		// 이번달 등급별 총 판매량기반 실수익
		System.out.println("temsi" + temsi);

		// 이번달 실판매량
		model.addAttribute("totalEntryMonthSals", totalEntryMonthSals);
		model.addAttribute("totalMainMonthSals", totalMainMonthSals);
		model.addAttribute("totalPerforMonthSals", totalPerforMonthSals);

		// 이번달 실수익(단위 억)
		model.addAttribute("temsi", temsi);
		model.addAttribute("tmmsi", tmmsi);
		model.addAttribute("tpmsi", tpmsi);

		return "main_work";
	}
	
	@RequestMapping("/main")
	public String mainWorkForm2(Model model, @ModelAttribute Sr_DTO srdto, Ss_DTO ssdto) {
		
		ssdto.setStart(1);
		ssdto.setEnd(4);
		// 재고현황
		List listPaging = ss.listPaging(ssdto);
		model.addAttribute("listPaging", listPaging);
		
		System.out.println("listPaging : " +listPaging);
		
		List b_list = b_service.reqBoard();
		
		model.addAttribute("b_list", b_list);
		int totalEntryMonthSals = fpm_Service.totalEntryMonthSals();
		int totalMainMonthSals = fpm_Service.totalMainMonthSals();
		int totalPerforMonthSals = fpm_Service.totalPerforMonthSals();
		// 이번달 등급별 총 판매량 끝
		
		// 이번달 실판매량
		model.addAttribute("totalEntryMonthSals", totalEntryMonthSals);
		model.addAttribute("totalMainMonthSals", totalMainMonthSals);
		model.addAttribute("totalPerforMonthSals", totalPerforMonthSals);
		
		// 재고 신청내역
		List itemSelectPage = sr.select1(srdto);
		List requestConfirmation = sr.select2(srdto);
		List orderHistory = sr.select3(srdto);
		
		model.addAttribute("itemSelectPage", itemSelectPage);
		
		
		// 이번달 등급별 총 판매량기반 실수익
		double tems = ((double) totalEntryMonthSals * 700000) / 100000000;
		double tmms = ((double) totalMainMonthSals * 1200000) / 100000000;
		double tpms = ((double) totalPerforMonthSals * 2000000) / 100000000;
		int temsi = (int) tems;
		int tmmsi = (int) tmms;
		int tpmsi = (int) tpms;
		// 이번달 등급별 총 판매량기반 실수익
		System.out.println("temsi" + temsi);
		
		// 이번달 실판매량
		model.addAttribute("totalEntryMonthSals", totalEntryMonthSals);
		model.addAttribute("totalMainMonthSals", totalMainMonthSals);
		model.addAttribute("totalPerforMonthSals", totalPerforMonthSals);
		
		// 이번달 실수익(단위 억)
		model.addAttribute("temsi", temsi);
		model.addAttribute("tmmsi", tmmsi);
		model.addAttribute("tpmsi", tpmsi);
		
		return "main";
	}

	@RequestMapping("/mypage")
	public String myPageForm() {
		return "mypage";
	}

}
