package com.atTrip.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.atTrip.dao.LoginDao;
import com.atTrip.vo.JoinVo;
import com.atTrip.vo.MemberVo;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class loginController {
	
	@Autowired
	private LoginDao dao;

	public void setDao(LoginDao dao) {
		this.dao = dao;
	}

	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public ModelAndView getlogin(String uri,HttpSession session) {
		
		ModelAndView mav = new  ModelAndView();
	
		String redirectUri;
		if(uri!=null || uri!="")
		{
			redirectUri = uri;
		}else{
			redirectUri = "idexmain.jsp";
		}
		
		mav.addObject("uri", redirectUri);
		
		session.setAttribute("uri",uri); 
		
		return mav; 
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public ModelAndView login(String m_email,String m_pwd,String uri,HttpSession session)
	{
		ModelAndView mav = new  ModelAndView();	
		
		HashMap map = new HashMap();
		
		map.put("m_email",m_email);
		map.put("m_pwd",m_pwd);

		JoinVo jv  = dao.getLogin(map);
		
		//�α��� ���� �� m_no�� ���� ��
		int m_no = -1;
		
		if(jv!=null){
			m_no = jv.getM_no();
		}
		 
		if(m_no > 0){ // �������� �� 
		
			mav.addObject("m_no", m_no);
			mav.setViewName("redirect:"+uri); 
		}
		
		else {// ���� ���� �� 
			session.getAttribute("../login.do?uri="+uri); 
			mav.addObject("m_no", m_no); 
		}
		return mav; 
	}
}
