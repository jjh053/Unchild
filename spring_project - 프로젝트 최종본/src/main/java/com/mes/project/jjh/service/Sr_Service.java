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

import com.mes.project.jjh.dao.Sr_DAO;
import com.mes.project.jjh.dto.Sr_DTO;

@Service
public class Sr_Service {
	@Autowired
	Sr_DAO srDAO;

	public List select1(Sr_DTO sr_dto) {

		List list = srDAO.select1(sr_dto);
//		System.out.println("Sr_Service list1 : " + list);
		return list;

	}

	public List select2(Sr_DTO sr_dto) {

		List list = srDAO.select2(sr_dto);
		System.out.println("Sr_Service list2 : " + list);

		return list;

	}

	public List select3(Sr_DTO sr_dto) {
		List list = srDAO.select3(sr_dto);
		System.out.println("Sr_Service list3 : " + list);
		return list;
	}

	// - 작업자 - 관리자에게 주문요청 
	public int insert1(Sr_DTO sr_dto) {

		System.out.println("갈 때 Sr_Service insert1 srdto(Requisition, quantity) : " + sr_dto);

		int insert1 = srDAO.insert1(sr_dto);
		System.out.println("돌아올 때  Sr_Service insert1 : " + insert1);
		return insert1;

	}

	// - 관리자 - 반려버튼 딜리트
	public int delete(Sr_DTO sr_dto) {
		System.out.println("갈 때 Sr_Service delete : " + sr_dto);
		int delete = srDAO.delete(sr_dto);
		System.out.println("돌아올 때  Sr_Service delete : " + delete);
		return delete;

	}

	// - 관리자 - 업체주문내역 insert
	public int orderingInsert(Sr_DTO sr_dto) {

		System.out.println("갈 때 Sr_Service orderingInsert : " + sr_dto);

		int orderingInsert = srDAO.orderingInsert(sr_dto);
		System.out.println("돌아올 때  Sr_Service delete : " + orderingInsert);
		return orderingInsert;

	}

	// - 관리자 - 업체주문내역 delete
	public int orderingDelete(Sr_DTO sr_dto) {

		System.out.println("갈 때 Sr_Service orderingDelete : " + sr_dto);

		int orderingDelete = srDAO.orderingDelete(sr_dto);
		System.out.println("돌아올 때  Sr_Service orderingDelete : " + orderingDelete);
		return orderingDelete;

	}

}
