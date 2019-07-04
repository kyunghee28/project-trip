package com.atTrip.db;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.atTrip.vo.JoinVo;
import com.atTrip.vo.MemberVo;

public class LoginManager {
	
	public static JoinVo LoginM(HashMap map){ 
		JoinVo jv = null;
		
		SqlSession session = JoinManager.factory.openSession();
		
		jv = session.selectOne("lo.gin",map);
		session.close();
		return jv;
	}
	
	
	
}
