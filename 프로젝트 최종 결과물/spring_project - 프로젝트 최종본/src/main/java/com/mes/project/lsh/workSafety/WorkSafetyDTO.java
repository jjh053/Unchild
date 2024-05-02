package com.mes.project.lsh.workSafety;

import org.springframework.web.multipart.MultipartFile;

public class WorkSafetyDTO {

	int w_bord_seq;
    String w_title;
    String w_detail;
    String w_imgUrl;
    MultipartFile w_imgFile;
    
	public int getW_bord_seq() {
		return w_bord_seq;
	}
	public void setW_bord_seq(int w_bord_seq) {
		this.w_bord_seq = w_bord_seq;
	}
	public String getW_title() {
		return w_title;
	}
	public void setW_title(String w_title) {
		this.w_title = w_title;
	}
	public String getW_detail() {
		return w_detail;
	}
	public void setW_detail(String w_detail) {
		this.w_detail = w_detail;
	}
	public String getW_imgUrl() {
		return w_imgUrl;
	}
	public void setW_imgUrl(String w_imgUrl) {
		this.w_imgUrl = w_imgUrl;
	}
	
	public MultipartFile getW_imgFile() {
		return w_imgFile;
	}
	public void setW_imgFile(MultipartFile w_imgFile) {
		this.w_imgFile = w_imgFile;
	}
	
	@Override
	public String toString() {
		return "WorkOrderDTO [w_bord_seq=" + w_bord_seq + ", w_title=" + w_title + ", w_detail=" + w_detail
				+ ", w_imgUrl=" + w_imgUrl + ", w_imgFile=" + w_imgFile + "]";
	}
}
