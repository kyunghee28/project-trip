package com.atTrip.vo;

import java.sql.Date;

public class PlanVo {
	private int plan_no;
	private String plan_name;
	private int m_no;
	private int city_no;
	private String city_name;
	private Date plan_startday;
	private Date plan_endday;
	private String plan_image;
	private int plan_day;
	public PlanVo(int plan_no, String plan_name, int m_no, int city_no, String city_name, Date plan_startday,
			Date plan_endday, String plan_image, int plan_day) {
		super();
		this.plan_no = plan_no;
		this.plan_name = plan_name;
		this.m_no = m_no;
		this.city_no = city_no;
		this.city_name = city_name;
		this.plan_startday = plan_startday;
		this.plan_endday = plan_endday;
		this.plan_image = plan_image;
		this.plan_day = plan_day;
	}
	public PlanVo() {
		super();
	}
	public int getPlan_no() {
		return plan_no;
	}
	public void setPlan_no(int plan_no) {
		this.plan_no = plan_no;
	}
	public String getPlan_name() {
		return plan_name;
	}
	public void setPlan_name(String plan_name) {
		this.plan_name = plan_name;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public int getCity_no() {
		return city_no;
	}
	public void setCity_no(int city_no) {
		this.city_no = city_no;
	}
	public String getCity_name() {
		return city_name;
	}
	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}
	public Date getPlan_startday() {
		return plan_startday;
	}
	public void setPlan_startday(Date plan_startday) {
		this.plan_startday = plan_startday;
	}
	public Date getPlan_endday() {
		return plan_endday;
	}
	public void setPlan_endday(Date plan_endday) {
		this.plan_endday = plan_endday;
	}
	public String getPlan_image() {
		return plan_image;
	}
	public void setPlan_image(String plan_image) {
		this.plan_image = plan_image;
	}
	public int getPlan_day() {
		return plan_day;
	}
	public void setPlan_day(int plan_day) {
		this.plan_day = plan_day;
	}
	
	
}
