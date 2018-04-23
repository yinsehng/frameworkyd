package com.neusoft.dao.impl;

import org.springframework.stereotype.Repository;

import com.neusoft.dao.IKc24Dao;

@Repository
public class Kc24DaoImpl extends SuperDaoImpl implements IKc24Dao{

	public String getDiseaseNameByCode(String code) {
		String diseaseName = sqlSessionTemplate.selectOne("JK_KC24Mapper.getDiseaseNameByCode", code);
		return diseaseName;
	}
}
