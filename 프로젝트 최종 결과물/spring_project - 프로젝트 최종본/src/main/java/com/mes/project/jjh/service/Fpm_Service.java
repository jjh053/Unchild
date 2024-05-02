package com.mes.project.jjh.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mes.project.jjh.dao.Fpm_DAO;
import com.mes.project.jjh.dto.Fpm_DTO;

@Service
public class Fpm_Service {
	@Autowired
	Fpm_DAO fpmDAO;

//	- 작업자 - 품목선택 페이지
	public List select1(Fpm_DTO fpm_dto) {

		System.out.println("갈 때 fpm_Service fpm_dto : " + fpm_dto);
		List list = fpmDAO.select1(fpm_dto);
		System.out.println("올 때 fpm_Service list1 : " + list);
		return list;

	}
	public List select2(Fpm_DTO fpm_dto) {

		System.out.println("갈 때 fpm_Service fpm_dto : " + fpm_dto);
		List list2 = fpmDAO.select2(fpm_dto);
		System.out.println("올 때 fpm_Service list2 : " + list2);
		return list2;

	}
	public List select3(Fpm_DTO fpm_dto) {

		System.out.println("갈 때 fpm_Service fpm_dto : " + fpm_dto);
		List list3 = fpmDAO.select3(fpm_dto);
		System.out.println("올 때 fpm_Service list3 : " + list3);
		return list3;

	}
	public List select4(Fpm_DTO fpm_dto) {

		System.out.println("갈 때 fpm_Service fpm_dto : " + fpm_dto);
		List list4 = fpmDAO.select4(fpm_dto);
		System.out.println("올 때 fpm_Service list4 : " + list4);
		return list4;

	}
	
	public List monthSelect1(Fpm_DTO fpm_dto) {
		System.out.println("갈 때 fpm_Service fpm_dto : " + fpm_dto);
		List monthSelect1 = fpmDAO.monthSelect1(fpm_dto);
		System.out.println("올 때 fpm_Service monthSelect1 : " + monthSelect1);
		return monthSelect1;
	}
	public List monthSelect2(Fpm_DTO fpm_dto) {
		System.out.println("갈 때 fpm_Service fpm_dto : " + fpm_dto);
		List monthSelect2 = fpmDAO.monthSelect2(fpm_dto);
		System.out.println("올 때 fpm_Service monthSelect2 : " + monthSelect2);
		return monthSelect2;
	}
	public List monthSelect3(Fpm_DTO fpm_dto) {
		System.out.println("갈 때 fpm_Service fpm_dto : " + fpm_dto);
		List monthSelect3 = fpmDAO.monthSelect3(fpm_dto);
		System.out.println("올 때 fpm_Service monthSelect3 : " + monthSelect3);
		return monthSelect3;
	}
	public List monthSelect4(Fpm_DTO fpm_dto) {
		System.out.println("갈 때 fpm_Service fpm_dto : " + fpm_dto);
		List monthSelect4 = fpmDAO.monthSelect4(fpm_dto);
		System.out.println("올 때 fpm_Service monthSelect4 : " + monthSelect4);
		return monthSelect4;
	}
	
	
	
	public List monthSalsList1(Fpm_DTO fpm_dto) {
		System.out.println("갈 때 fpm_Service fpm_dto : " + fpm_dto);
		List monthSalsList1 = fpmDAO.monthSalsList1(fpm_dto);
		System.out.println("올 때 fpm_Service monthSalsList1 : " + monthSalsList1);
		return monthSalsList1;
	}
	
	public List monthSalsList2(Fpm_DTO fpm_dto) {
		System.out.println("갈 때 fpm_Service fpm_dto : " + fpm_dto);
		List monthSalsList2 = fpmDAO.monthSalsList2(fpm_dto);
		System.out.println("올 때 fpm_Service monthSalsList2 : " + monthSalsList2);
		return monthSalsList2;
	}
	public List monthSalsList3(Fpm_DTO fpm_dto) {
		System.out.println("갈 때 fpm_Service fpm_dto : " + fpm_dto);
		List monthSalsList3 = fpmDAO.monthSalsList3(fpm_dto);
		System.out.println("올 때 fpm_Service monthSalsList3 : " + monthSalsList3);
		return monthSalsList3;
	}
	
	public List monthSalsList4(Fpm_DTO fpm_dto) {
		System.out.println("갈 때 fpm_Service fpm_dto : " + fpm_dto);
		List monthSalsList4 = fpmDAO.monthSalsList4(fpm_dto);
		System.out.println("올 때 fpm_Service monthSalsList4 : " + monthSalsList4);
		return monthSalsList4;
	}
	
	// 이번달 등급별 총 판매량
	public int totalEntryMonthSals() {
		int totalEntryMonthSals = fpmDAO.totalEntryMonthSals();
		return totalEntryMonthSals;
	}
	
	public int totalMainMonthSals() {
		int totalMainMonthSals = fpmDAO.totalMainMonthSals();
		return totalMainMonthSals;
	}
	public int totalPerforMonthSals() {
		int totalPerforMonthSals = fpmDAO.totalPerforMonthSals();
		return totalPerforMonthSals;
	}
	// 이번달 등급별 총 판매량 끝
	
	// 지난달 등급별 총 판매량을 토대로(+5%)한 이번달 목표판매량(mapper 재활용해서 코드 줄임) 적용 후
	
	public int totalEntryMonthSalestarget() {
		int totalEntryMonthSalestarget = fpmDAO.totalEntryMonthSalestarget();
		return totalEntryMonthSalestarget;
	}
	
	public int totalMainMonthSalestarget() {
		int totalMainMonthSalestarget = fpmDAO.totalMainMonthSalestarget();
		return totalMainMonthSalestarget;
	}
	public int totalPerforMonthSalestarget() {
		int totalPerforMonthSalestarget = fpmDAO.totalPerforMonthSalestarget();
		return totalPerforMonthSalestarget;
	}
	
	
	
	// 지난달 등급별 총 판매량을 토대로한(+5%) 이번달 목표판매량(mapper 재활용해서 코드 줄임) 적용 후 끝
	
	// 지난달 등급별 총 판매량
	public int totalEntryLastMonthSals() {
		int totalEntryLastMonthSals = fpmDAO.totalEntryLastMonthSals();
		return totalEntryLastMonthSals;
	}
	
	public int totalMainLastMonthSals() {
		int totalMainLastMonthSals = fpmDAO.totalMainLastMonthSals();
		return totalMainLastMonthSals;
	}
	public int totalPerforLastMonthSals() {
		int totalPerforLastMonthSals = fpmDAO.totalPerforLastMonthSals();
		return totalPerforLastMonthSals;
	}
	// 지난달 등급별 총 판매량 끝
	
	// 지난달 목표 판매량을 구하기 위한 두달 전 판매량 총 합 * 5% 적용 후
	public int totalEntryLastSalestarget() {
		int totalEntryLastSalestarget = fpmDAO.totalEntryLastSalestarget();
		return totalEntryLastSalestarget;
	}
	
	public int totalMainLastSalestarget() {
		int totalMainLastSalestarget = fpmDAO.totalMainLastSalestarget();
		return totalMainLastSalestarget;
	}
	public int totalPerforLastSalestarget() {
		int totalPerforLastSalestarget = fpmDAO.totalPerforLastSalestarget();
		return totalPerforLastSalestarget;
	}
	// 지난달 목표 판매량을 구하기 위한 두달 전 판매량 총 합 * 5% 적용 후 끝
	
	
	// 다음달 목표판매량을 구하기 위한 이번달 제외한 3달간의 총 판매량
	public int entryPastThreeMonths() {
		int entryPastThreeMonths = fpmDAO.entryPastThreeMonths();
		return entryPastThreeMonths;
	}
	
	public int mainPastThreeMonths() {
		int mainPastThreeMonths = fpmDAO.mainPastThreeMonths();
		return mainPastThreeMonths;
	}
	public int perforPastThreeMonths() {
		int perforPastThreeMonths = fpmDAO.perforPastThreeMonths();
		return perforPastThreeMonths;
	}
	// 다음달 목표판매량을 구하기 위한 이번달 제외한 3달간의 총 판매량 끝
	
	
}
