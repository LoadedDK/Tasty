package com.tasty.notice.model;

public class Pp {
	String period;
	int cpage;
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period =period;
	}
	public int getCpage() {
		return cpage;
	}
	public void setCpage(int cpage) {
		this.cpage = cpage;
	}
	@Override
	public String toString() {
		return "Pp [str=" + period + ", cpage=" + cpage + "]";
	}
	
}
