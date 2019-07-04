package com.atTrip.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.atTrip.db.mypageManager;
import com.atTrip.vo.BoardVo;
import com.atTrip.vo.LikeVo;
import com.atTrip.vo.PlanVo;

@Repository
public class MypageDao {

	public List<PlanVo> myPlanList(int m_no)
	{
		return mypageManager.myPlanlist(m_no);
	}
	
	public List<LikeVo> likeListMember(int m_no) {
		// TODO Auto-generated method stub
		return mypageManager.myLikeList(m_no);
	}
	
	public List<BoardVo> myBoardList(int m_no)
	{
		return mypageManager.myBoardList(m_no);
	}

	
	
}
