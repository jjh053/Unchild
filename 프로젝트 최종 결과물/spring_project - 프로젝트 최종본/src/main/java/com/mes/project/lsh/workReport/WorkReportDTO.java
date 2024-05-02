package com.mes.project.lsh.workReport;

import java.sql.Timestamp;

public class WorkReportDTO {

	int rnum;
	
	int w_seq;
	String quality_detail; 
	int clear_num;
	int unclear_num = 0;
	int status;
	Timestamp end_time; 
	int procid;
	
	String linenum;
	
	String g_grade;
	
	String sname;
	String sphone;
	String smail;
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
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
	public String getLinenum() {
		return linenum;
	}
	public void setLinenum(String linenum) {
		this.linenum = linenum;
	}
	public String getG_grade() {
		return g_grade;
	}
	public void setG_grade(String g_grade) {
		this.g_grade = g_grade;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSphone() {
		return sphone;
	}
	public void setSphone(String sphone) {
		this.sphone = sphone;
	}
	public String getSmail() {
		return smail;
	}
	public void setSmail(String smail) {
		this.smail = smail;
	}
	
	@Override
	public String toString() {
		return "WorkReportDTO [rnum=" + rnum + ", w_seq=" + w_seq + ", quality_detail=" + quality_detail
				+ ", clear_num=" + clear_num + ", unclear_num=" + unclear_num + ", status=" + status + ", end_time="
				+ end_time + ", procid=" + procid + ", linenum=" + linenum + ", g_grade=" + g_grade + ", sname=" + sname
				+ ", sphone=" + sphone + ", smail=" + smail + "]";
	}	
}
