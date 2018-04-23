package com.neusoft.dao;

import java.util.List;

import com.neusoft.model.JK_KC02;

public interface IKc02Dao extends ISuperDao{

	public List<JK_KC02> finaAll();
	
	public List<JK_KC02> findAllByCondition(String aac002, String yab060, String yab600, String order);
}
