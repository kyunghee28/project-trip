package com.atTrip.vo;

import java.sql.Date;

public class BoardVo {
	private int b_no;
	private String b_title;
	private String m_name;
	private String b_pwd;
	private String b_region;
	private Date b_startday;
	private Date b_endday;
	private String b_content;
	private Date b_wdate;
	private int b_hit;
	private int m_no;
	
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getB_pwd() {
		return b_pwd;
	}
	public void setB_pwd(String b_pwd) {
		this.b_pwd = b_pwd;
	}
	public String getB_region() {
		return b_region;
	}
	public void setB_region(String b_region) {
		this.b_region = b_region;
	}
	public Date getB_startday() {
		return b_startday;
	}
	public void setB_startday(Date b_startday) {
		this.b_startday = b_startday;
	}
	public Date getB_endday() {
		return b_endday;
	}
	public void setB_endday(Date b_endday) {
		this.b_endday = b_endday;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public Date getB_wdate() {
		return b_wdate;
	}
	public void setB_wdate(Date b_wdate) {
		this.b_wdate = b_wdate;
	}
	public int getB_hit() {
		return b_hit;
	}
	public void setB_hit(int b_hit) {
		this.b_hit = b_hit;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public BoardVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardVo(int b_no, String b_title, String m_name, String b_pwd, String b_region, Date b_startday,
			Date b_endday, String b_content, Date b_wdate, int b_hit,int m_no) {
		super();
		this.b_no = b_no;
		this.b_title = b_title;
		this.m_name = m_name;
		this.b_pwd = b_pwd;
		this.b_region = b_region;
		this.b_startday = b_startday;
		this.b_endday = b_endday;
		this.b_content = b_content;
		this.b_wdate = b_wdate;
		this.b_hit = b_hit;
		this.m_no = m_no;
	}
}
