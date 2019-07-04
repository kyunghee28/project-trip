package com.atTrip.vo;

public class JoinVo {
	private int m_no;
	private String m_email;
	private String m_pwd;
	private String m_interest;
	private String m_style;

	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public String getM_interest() {
		return m_interest;
	}
	public void setM_interst(String m_interest) {
		this.m_interest = m_interest;
	}
	public String getM_style() {
		return m_style;
	}
	public void setM_style(String m_style) {
		this.m_style = m_style;
	}
	public JoinVo(int m_no, String m_email, String m_pwd, String m_interest, String m_style) {
		super();
		this.m_no = m_no;
		this.m_email = m_email;
		this.m_pwd = m_pwd;
		this.m_interest = m_interest;
		this.m_style = m_style;
	}
	public JoinVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
