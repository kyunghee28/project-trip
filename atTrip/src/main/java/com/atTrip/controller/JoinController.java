package com.atTrip.controller;

import javax.servlet.http.HttpServletRequest;
import com.atTrip.vo.CityVo;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.atTrip.dao.JoinDao;
import com.atTrip.vo.JoinVo;
import java.util.List;

@Controller
public class JoinController{
	
	@Autowired
	private JoinDao dao;
	public void setDao(JoinDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value="join.do", method=RequestMethod.GET)
	public void getjoin() {	
	}
	
	@RequestMapping(value="join.do", method=RequestMethod.POST)
	public ModelAndView join(JoinVo jv,HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();	
		String str = "";
		
		String[] cityValue = request.getParameterValues("citycheck");
		String[] stylevalue = request.getParameterValues("stylecheck");

		if(cityValue!= null) {
			for(String val : cityValue){	
				str += val+";";
			}
		}
			
		jv.setM_interst(str);
		
		String stylestr="";
		if(stylevalue != null) {
			for(String val : stylevalue){	
				stylestr += val+";";
			}
		}
		jv.setM_style(stylestr);
			
		int jm = dao.insertjoin(jv);
			
		if(jm>0){ 
			mav.setViewName("redirect:indexmain.jsp");
		}
		else{
			mav.addObject("msg", "회원가입실패");
			mav.setViewName("join");
		}
		
		return mav; 
	}
	
	@RequestMapping(value="/checkMail",produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String checkI(String m_email) {
		String str ="";
		//아이디 중복체크
		int check = -1;
		check = dao.checkId(m_email);
		if(check > 0){
		     str = "true";
		}else{		
			str = "false";
		}
		return str; 
	}
	


	@RequestMapping(value="/joincheckBoxCity",produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String CheckCity() {
		String str="";
		List<CityVo> list = dao.CityJoin();

		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(list);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	
		return str;
	}
	
}
