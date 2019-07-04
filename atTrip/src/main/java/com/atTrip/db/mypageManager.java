package com.atTrip.db;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.atTrip.vo.BoardVo;
import com.atTrip.vo.JoinVo;
import com.atTrip.vo.LikeVo;
import com.atTrip.vo.PlanVo;

public class mypageManager {

	public static SqlSessionFactory factory;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("com/atTrip/db/sqlConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();		
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public static List<PlanVo> myPlanlist(int m_no){  
		List<PlanVo> list;
		
		SqlSession session = factory.openSession();
		list = session.selectList("my.plan", m_no);
		session.close();
		return list;
	}
	
	public static List<LikeVo> myLikeList(int m_no) {
		List<LikeVo> list;
		
		SqlSession session = factory.openSession();
		list = session.selectList("my.like", m_no);
		session.close();
		return list;
	}
	
	public static List<BoardVo> myBoardList(int m_no){  
		List<BoardVo> list;
		
		SqlSession session = factory.openSession();

		list = session.selectList("my.board", m_no);
		session.close();
		return list;
	}

	
}

