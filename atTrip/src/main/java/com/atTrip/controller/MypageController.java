package com.atTrip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atTrip.dao.MypageDao;
import com.atTrip.vo.BoardVo;
import com.atTrip.vo.LikeVo;
import com.atTrip.vo.PlanVo;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class MypageController {
	@Autowired
	private MypageDao dao;

	public void setDao(MypageDao dao) {
		this.dao = dao;
	}
	
	ObjectMapper mapper = new ObjectMapper();
	
	@RequestMapping(value="myPlanlist.do",produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String getMyPlan(int m_no){
		
		List<PlanVo> list = dao.myPlanList(m_no);

		String str ="";
		
		try {
			str = mapper.writeValueAsString(list);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return str;		
	}
	
	@RequestMapping(value="/likeListMember.do", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String likeListMember(int m_no){
		String str = "";
		
		List<LikeVo> list =  dao.likeListMember(m_no);
		
		try {
			str = mapper.writeValueAsString(list);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
	
	
	@RequestMapping(value="myBoardlist.do",produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String getMyBoard(int m_no){
		
		List<BoardVo> list = dao.myBoardList(m_no);
		
		String str ="";
		
		try {
			str = mapper.writeValueAsString(list);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return str;		
	}
	
}
