package com.atTrip.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.atTrip.db.JoinManager;
import com.atTrip.vo.CityVo;
import com.atTrip.vo.JoinVo;

@Repository
public class JoinDao{
	public int insertjoin(JoinVo jv) {		
		return JoinManager.joinMember(jv);
	}
	
	//ȸ�� �ߺ�Ȯ��
	public int checkId(String m_email) {
		return JoinManager.checkId(m_email);
	}
	
	//üũ�ڽ� �����̸�
	public List<CityVo> CityJoin(){
		return JoinManager.CityJoin();
	}
}
