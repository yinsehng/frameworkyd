package com.neusoft.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.neusoft.dao.IKc02Dao;
import com.neusoft.model.JK_KC02;

@Repository
public class KC02DaoImpl extends SuperDaoImpl implements IKc02Dao{

	@Override
	public List<JK_KC02> finaAll() {
		
		return sqlSessionTemplate.selectOne("JK_KC02Mapper.findAll");
	}

	@Override
	public List<JK_KC02> findAllByCondition(String aac002, String yab060,
			String yab600, String order) {
		HashMap<String, String> parames = new HashMap<>();
		parames.put("aac002", aac002);
		parames.put("yab060", yab060);
		parames.put("yab600", yab600);
		parames.put("order", order);
		return sqlSessionTemplate.selectList("JK_KC02Mapper.findAllByCondition", parames);
	}

}
