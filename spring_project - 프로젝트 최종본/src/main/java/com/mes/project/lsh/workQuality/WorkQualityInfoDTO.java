package com.mes.project.lsh.workQuality;

import java.sql.Timestamp;

public class WorkQualityInfoDTO {

	int w_seq;
	String quality_detail = "정상";
	int pass;
	int clear_num;
	int unclear_num = 0;
	int status;
	int staffno;
	Timestamp end_time;
	int procid;
	
	public int getW_seq() {
		return w_seq;
	}
	public void setW_seq(int w_seq) {
		this.w_seq = w_seq;
	}
	public String getQuality_detail() {
		return quality_detail;
	}
	public void setQuality_detail(String quality_detail) {
		this.quality_detail = quality_detail;
	}
	public int getPass() {
		return pass;
	}
	public void setPass(int pass) {
		this.pass = pass;
	}
	public int getClear_num() {
		return clear_num;
	}
	public void setClear_num(int clear_num) {
		this.clear_num = clear_num;
	}
	public int getUnclear_num() {
		return unclear_num;
	}
	public void setUnclear_num(int unclear_num) {
		this.unclear_num = unclear_num;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getStaffno() {
		return staffno;
	}
	public void setStaffno(int staffno) {
		this.staffno = staffno;
	}
	public Timestamp getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Timestamp end_time) {
		this.end_time = end_time;
	}
	public int getProcid() {
		return procid;
	}
	public void setProcid(int procid) {
		this.procid = procid;
	}
	
	@Override
	public String toString() {
		return "WorkQualityInfoDTO [w_seq=" + w_seq + ", quality_detail=" + quality_detail + ", pass=" + pass
				+ ", clear_num=" + clear_num + ", unclear_num=" + unclear_num + ", status=" + status + ", staffno="
				+ staffno + ", end_time=" + end_time + ", procid=" + procid + "]";
	}
}
