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

import com.mes.project.jjh.dto.Fpm_DTO;
import com.mes.project.jjh.service.Fpm_Service;

@Controller
public class Fpm_Controller {
	private static final Logger logger = LoggerFactory.getLogger(Fpm_Controller.class);

	@Autowired
	Fpm_Service rodiService;

	@RequestMapping("/fs")
	public String select(@ModelAttribute Fpm_DTO fpmDTO, Model model) {
		System.out.println("갈 때 Fpm_Controller fpmDTO : " + fpmDTO);
		List list = rodiService.select1(fpmDTO);
		List list2 = rodiService.select2(fpmDTO);
		List list3 = rodiService.select3(fpmDTO);
		List list4 = rodiService.select4(fpmDTO);

		List monthList1 = rodiService.monthSelect1(fpmDTO);
		List monthList2 = rodiService.monthSelect2(fpmDTO);
		List monthList3 = rodiService.monthSelect3(fpmDTO);
		List monthList4 = rodiService.monthSelect4(fpmDTO);

		List monthSalsList1 = rodiService.monthSalsList1(fpmDTO);
		List monthSalsList2 = rodiService.monthSalsList2(fpmDTO);
		List monthSalsList3 = rodiService.monthSalsList3(fpmDTO);
		List monthSalsList4 = rodiService.monthSalsList4(fpmDTO);

		// 이번달 등급별 총 판매량
		int totalEntryMonthSals = rodiService.totalEntryMonthSals();
		int totalMainMonthSals = rodiService.totalMainMonthSals();
		int totalPerforMonthSals = rodiService.totalPerforMonthSals();
		// 이번달 등급별 총 판매량 끝

		// 이번달 등급별 총 판매량기반 실수익
		double tems = ((double) totalEntryMonthSals * 700000) / 100000000;
		double tmms = ((double) totalMainMonthSals * 1200000) / 100000000;
		double tpms = ((double) totalPerforMonthSals * 2000000) / 100000000;
		int temsi = (int)tems;
		int tmmsi = (int)tmms;
		int tpmsi = (int)tpms;
		// 이번달 등급별 총 판매량기반 실수익

		// 이번달 목표 판매량을 구하기 위한 한달 전 판매량 총 합 * 5% 적용 후
		int totalEntryMonthSalestarget = rodiService.totalEntryMonthSalestarget();
		int totalMainMonthSalestarget = rodiService.totalMainMonthSalestarget();
		int totalPerforMonthSalestarget = rodiService.totalPerforMonthSalestarget();
		// 이번달 목표 판매량을 구하기 위한 한달 전 판매량 총 합 * 5% 적용 후
		
		// 이번달 등급별 목표판매량 기반 목표수익
		double temst = ((double) totalEntryMonthSalestarget * 700000) / 100000000;
		double tmmst = ((double) totalMainMonthSalestarget * 1200000) / 100000000;
		double tpmst = ((double) totalPerforMonthSalestarget * 2000000) / 100000000;
		int temsti = (int)temst;
		int tmmsti = (int)tmmst;
		int tpmsti = (int)tpmst;
		// 이번달 등급별 목표판매량 기반 목표수익 끝
		

		// 이번달 목표판매량과 실판매량 퍼센트 차이 계산
		// 계산식 = ((실판매량 - 목표판매량)/목표판매량) * 100
		double thisEnrtyPerformancePercent = (((double) totalEntryMonthSals - (double) totalEntryMonthSalestarget)
				/ (double) totalEntryMonthSalestarget) * 100;
		double thisMainPerformancePercent = (((double) totalMainMonthSals - (double) totalMainMonthSalestarget)
				/ (double) totalMainMonthSalestarget) * 100;
		double thisPerforPerformancePercent = (((double) totalPerforMonthSals - (double) totalPerforMonthSalestarget)
				/ (double) totalPerforMonthSalestarget) * 100;
		int tepp = (int) thisEnrtyPerformancePercent;
		int tmpp = (int) thisMainPerformancePercent;
		int tppp = (int) thisPerforPerformancePercent;
		// 이번달 목표판매량과 실판매량 퍼센트 차이 계산 끝

		// 지난달 등급별 총 판매량
		int totalEntryLastMonthSals = rodiService.totalEntryLastMonthSals();
		int totalMainLastMonthSals = rodiService.totalMainLastMonthSals();
		int totalPerforLastMonthSals = rodiService.totalPerforLastMonthSals();
		// 지난달 등급별 총 판매량 끝
		
		//  지난달 등급별 총 판매량기반 실수익
		double telms = ((double) totalEntryLastMonthSals * 700000) / 100000000;
		double tmlms = ((double) totalMainLastMonthSals * 1200000) / 100000000;
		double tplms = ((double) totalPerforLastMonthSals * 2000000) / 100000000;
		int telmsi = (int)telms;
		int tmlmsi = (int)tmlms;
		int tplmsi = (int)tplms;
		// 지난달 등급별 총 판매량기반 실수익 끝
		
		// 지난달 목표 판매량을 구하기 위한 두달 전 판매량 총 합 * 5% 적용 후
		int totalEntryLastSalestarget = rodiService.totalEntryLastSalestarget();
		int totalMainLastSalestarget = rodiService.totalMainLastSalestarget();
		int totalPerforLastSalestarget = rodiService.totalPerforLastSalestarget();
		// 지난달 목표 판매량을 구하기 위한 두달 전 판매량 총 합 * 5% 적용 후 끝

		// 지난달 등급별 목표판매량 기반 목표수익
		double telst = ((double) totalEntryLastSalestarget * 700000) / 100000000;
		double tmlst = ((double) totalMainLastSalestarget * 1200000) / 100000000;
		double tplst = ((double) totalPerforLastSalestarget * 2000000) / 100000000;
		int telsti = (int)telst;
		int tmlsti = (int)tmlst;
		int tplsti = (int)tplst;
		// 지난달 등급별 목표판매량 기반 목표수익 끝
		
		
		// 지난달 목표판매량과 실판매량 퍼센트 차이 계산
		// 계산식 = ((실판매량 - 목표판매량)/목표판매량) * 100
		double enrtyPerformancePercent = (((double) totalEntryLastMonthSals - (double) totalEntryLastSalestarget)
				/ (double) totalEntryLastSalestarget) * 100;
		double MainPerformancePercent = (((double) totalMainLastMonthSals - (double) totalMainLastSalestarget)
				/ (double) totalMainLastSalestarget) * 100;
		double PerforPerformancePercent = (((double) totalPerforLastMonthSals - (double) totalPerforLastSalestarget)
				/ (double) totalPerforLastSalestarget) * 100;
		int epp = (int) enrtyPerformancePercent;
		int mpp = (int) MainPerformancePercent;
		int ppp = (int) PerforPerformancePercent;
		// 지난달 목표판매량과 실판매량 퍼센트 차이 계산 끝

		// 다음달 목표판매량을 구하기 위한 이번달 제외한 3달간의 총 판매량
		int entryPastThreeMonths = rodiService.entryPastThreeMonths();
		int mainPastThreeMonths = rodiService.mainPastThreeMonths();
		int perforPastThreeMonths = rodiService.perforPastThreeMonths();
		// 다음달 목표판매량을 구하기 위한 이번달 제외한 3달간의 총 판매량 끝
		
		// 다음달달 등급별 목표판매량 기반 목표수익 
		double eptm = ((double) entryPastThreeMonths * 700000) / 100000000;
		double mptm = ((double) mainPastThreeMonths * 1200000) / 100000000;
		double pptm = ((double) perforPastThreeMonths * 2000000) / 100000000;
		int eptmi = (int)eptm;
		int mptmi = (int)mptm;
		int pptmi = (int)pptm;
		
		// 다음달달 등급별 목표판매량 기반 목표수익 끝
		
		

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("list4", list4);

		model.addAttribute("monthList1", monthList1);
		model.addAttribute("monthList2", monthList2);
		model.addAttribute("monthList3", monthList3);
		model.addAttribute("monthList4", monthList4);

		model.addAttribute("monthSalsList1", monthSalsList1);
		
		
		model.addAttribute("monthSalsList2", monthSalsList2);
		model.addAttribute("monthSalsList3", monthSalsList3);
		model.addAttribute("monthSalsList4", monthSalsList4);

		// 이번달 실판매량
		model.addAttribute("totalEntryMonthSals", totalEntryMonthSals);
		model.addAttribute("totalMainMonthSals", totalMainMonthSals);
		model.addAttribute("totalPerforMonthSals", totalPerforMonthSals);
		
		// 이번달 실수익(단위 억)
		model.addAttribute("temsi", temsi);
		model.addAttribute("tmmsi", tmmsi);
		model.addAttribute("tpmsi", tpmsi);

		// 이번달 목표판매량
		model.addAttribute("totalEntryMonthSalestarget", totalEntryMonthSalestarget);
		model.addAttribute("totalMainMonthSalestarget", totalMainMonthSalestarget);
		model.addAttribute("totalPerforMonthSalestarget", totalPerforMonthSalestarget);
		
		// 이번달 목표수익(단위 억)
		model.addAttribute("temsti", temsti);
		model.addAttribute("tmmsti", tmmsti);
		model.addAttribute("tpmsti", tpmsti);
		
		// 이번달 실적평가(달성률)
		model.addAttribute("tepp", tepp);
		model.addAttribute("tmpp", tmpp);
		model.addAttribute("tppp", tppp);

		// 지난달 판매량
		model.addAttribute("totalEntryLastMonthSals", totalEntryLastMonthSals);
		model.addAttribute("totalMainLastMonthSals", totalMainLastMonthSals);
		model.addAttribute("totalPerforLastMonthSals", totalPerforLastMonthSals);

		// 지난달 실수익(단위 억)
		model.addAttribute("telmsi", telmsi);
		model.addAttribute("tmlmsi", tmlmsi);
		model.addAttribute("tplmsi", tplmsi);
		
		
		// 지난달 목표판매량
		model.addAttribute("totalEntryLastSalestarget", totalEntryLastSalestarget);
		model.addAttribute("totalMainLastSalestarget", totalMainLastSalestarget);
		model.addAttribute("totalPerforLastSalestarget", totalPerforLastSalestarget);

		// 지난달 목표수익(단위 억)
		model.addAttribute("telsti", telsti);
		model.addAttribute("tmlsti", tmlsti);
		model.addAttribute("tplsti", tplsti);
		
		// 지난달 실적평가(달성률)
		model.addAttribute("enrtyPerformancePercent", epp);
		model.addAttribute("MainPerformancePercent", mpp);
		model.addAttribute("PerforPerformancePercent", ppp);

		// 다음달 목표량
		model.addAttribute("entryPastThreeMonths", entryPastThreeMonths);
		model.addAttribute("mainPastThreeMonths", mainPastThreeMonths);
		model.addAttribute("perforPastThreeMonths", perforPastThreeMonths);

		// 다음달 목표량 기반 수익(단위 억)
		model.addAttribute("eptmi", eptmi);
		model.addAttribute("mptmi", mptmi);
		model.addAttribute("pptmi", pptmi);
		
		
		return "Finished_product_management";
	}

}
