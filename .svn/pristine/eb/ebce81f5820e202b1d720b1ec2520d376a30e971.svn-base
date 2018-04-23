package com.neusoft.dao.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.neusoft.dao.IAa10Dao;
@Repository
public class Aa10DaoImpl extends SuperDaoImpl implements IAa10Dao{

	@Override
	public String getNameByCode(String AAA100, String AAA102) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("AAA100", AAA100);
		map.put("AAA102", AAA102);
		String name = sqlSessionTemplate.selectOne("JK_AA10Mapper.getNameByCode", map);
		return name;
	}

}
