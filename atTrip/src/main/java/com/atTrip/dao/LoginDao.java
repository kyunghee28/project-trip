package com.atTrip.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.atTrip.db.LoginManager;
import com.atTrip.vo.JoinVo;
import com.atTrip.vo.MemberVo;

@Repository
public class LoginDao {

	public JoinVo getLogin(HashMap map){
		return LoginManager.LoginM(map);
	}
	
	
}
