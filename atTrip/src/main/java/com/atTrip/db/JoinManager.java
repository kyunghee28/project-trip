package com.atTrip.db;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.atTrip.vo.CityVo;
import com.atTrip.vo.JoinVo;

public class JoinManager {

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
	
	public static int joinMember(JoinVo jv){  
		int m = -1; 
		
		SqlSession session = factory.openSession(true);
		m = session.insert("join.new", jv);
		session.close();
		return m;
	}
	
	// 회원 중복 체크
	public static int checkId(String m_email) {
	
		int c = -1; 
		SqlSession session = factory.openSession();
		c = session.selectOne("join.checkId",m_email);
		session.close();
		return c;
		
	}
	

	// 체크박스 나라
	public static List<CityVo> CityJoin(){
		List<CityVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("join.checkCity");
		session.close();	
		return list;
	}

}
