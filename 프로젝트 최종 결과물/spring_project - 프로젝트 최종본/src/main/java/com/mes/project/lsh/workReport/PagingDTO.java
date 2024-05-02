package com.mes.project.lsh.workReport;

public class PagingDTO {

	int page_num;
	int now_page = 1;
	String select_date = "";
	int last_page;
	int sec_first;
	int sec_last;
	
	public int getPage_num() {
		return page_num;
	}
	public void setPage_num(int page_num) {
		this.page_num = page_num;
	}
	public int getNow_page() {
		return now_page;
	}
	public void setNow_page(int now_page) {
		this.now_page = now_page;
	}
	public String getSelect_date() {
		return select_date;
	}
	public void setSelect_date(String select_date) {
		this.select_date = select_date;
	}
	public int getLast_page() {
		return last_page;
	}
	public void setLast_page(int last_page) {
		this.last_page = last_page;
	}
	public int getSec_first() {
		return sec_first;
	}
	public void setSec_first(int sec_first) {
		this.sec_first = sec_first;
	}
	public int getSec_last() {
		return sec_last;
	}
	public void setSec_last(int sec_last) {
		this.sec_last = sec_last;
	}
	
	@Override
	public String toString() {
		return "PagingDTO [page_num=" + page_num + ", now_page=" + now_page + ", select_date=" + select_date
				+ ", last_page=" + last_page + ", sec_first=" + sec_first + ", sec_last=" + sec_last + "]";
	}
}
