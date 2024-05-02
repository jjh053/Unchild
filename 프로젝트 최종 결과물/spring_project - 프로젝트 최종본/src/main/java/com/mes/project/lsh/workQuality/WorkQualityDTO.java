package com.mes.project.lsh.workQuality;

import java.sql.Date;

public class WorkQualityDTO {

	int w_bord_seq;
    String w_title;
    String w_detail;
    
    int procid;
    String linenum;
    Date endtime;
    int pass;
    int g_sequence;
    String g_grade;
    
    int staffno;
    String sname;
    String sphone;
    String smail;
    
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
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	public int getPass() {
		return pass;
	}
	public void setPass(int pass) {
		this.pass = pass;
	}
	public int getG_sequence() {
		return g_sequence;
	}
	public void setG_sequence(int g_sequence) {
		this.g_sequence = g_sequence;
	}
	public String getG_grade() {
		return g_grade;
	}
	public void setG_grade(String g_grade) {
		this.g_grade = g_grade;
	}
	public int getStaffno() {
		return staffno;
	}
	public void setStaffno(int staffno) {
		this.staffno = staffno;
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
		return "WorkQualityDTO [w_bord_seq=" + w_bord_seq + ", w_title=" + w_title + ", w_detail=" + w_detail
				+ ", procid=" + procid + ", linenum=" + linenum + ", endtime=" + endtime + ", pass=" + pass
				+ ", g_sequence=" + g_sequence + ", g_grade=" + g_grade + ", staffno=" + staffno + ", sname=" + sname
				+ ", sphone=" + sphone + ", smail=" + smail + "]";
	}
}
