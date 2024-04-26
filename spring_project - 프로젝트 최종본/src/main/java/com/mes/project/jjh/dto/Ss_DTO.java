package com.mes.project.jjh.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Ss_DTO {
	int mesId;
	String mesName;
	String mesGrade;
	String mesContent;
	int mesPrice;
	int gCount;
	String gLoc;
	int bCount;
	String bLoc;
	int row_num;

	int pageNum = 1;
	int countPerPage = 10;

	int start;
	int end;

	String itemImg;
	MultipartFile imgFileName;

	public String getItemImg() {
		return itemImg;
	}

	public void setItemImg(String itemImg) {
		this.itemImg = itemImg;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getRow_num() {
		return row_num;
	}

	public void setRow_num(int row_num) {
		this.row_num = row_num;
	}

	public int getMesId() {
		return mesId;
	}

	public void setMesId(int mesId) {
		this.mesId = mesId;
	}

	public String getMesName() {
		return mesName;
	}

	public void setMesName(String mesName) {
		this.mesName = mesName;
	}

	public String getMesGrade() {
		return mesGrade;
	}

	public void setMesGrade(String mesGrade) {
		this.mesGrade = mesGrade;
	}

	public String getMesContent() {
		return mesContent;
	}

	public void setMesContent(String mesContent) {
		this.mesContent = mesContent;
	}

	public int getMesPrice() {
		return mesPrice;
	}

	public void setMesPrice(int mesPrice) {
		this.mesPrice = mesPrice;
	}

	public int getGCount() {
		return gCount;
	}

	public void setGCount(int gCount) {
		this.gCount = gCount;
	}

	public String getGLoc() {
		return gLoc;
	}

	public void setGLoc(String gLoc) {
		this.gLoc = gLoc;
	}

	public int getBCount() {
		return bCount;
	}

	public void setBCount(int bCount) {
		this.bCount = bCount;
	}

	public String getBLoc() {
		return bLoc;
	}

	public void setBLoc(String bLoc) {
		this.bLoc = bLoc;
	}

	@Override
	public String toString() {
		return "Ss_DTO [mesId=" + mesId + ", mesName=" + mesName + ", mesGrade=" + mesGrade + ", mesContent="
				+ mesContent + ", mesPrice=" + mesPrice + ", gCount=" + gCount + ", gLoc=" + gLoc + ", bCount=" + bCount
				+ ", bLoc=" + bLoc + ", row_num=" + row_num + ", pageNum=" + pageNum + ", countPerPage=" + countPerPage
				+ "]";
	}

}
