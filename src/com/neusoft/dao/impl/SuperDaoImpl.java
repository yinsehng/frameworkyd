package com.neusoft.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.neusoft.dao.ISuperDao;
@Repository
public class SuperDaoImpl implements ISuperDao {
	@Resource
    public SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<Object> getSqlData(String sql) {
        List<Object> list = sqlSessionTemplate.selectList("SQLMapper.getSqlData",sql);
		return list;
	}
	
	public String getStringData(String sql) {
		String s = sqlSessionTemplate.selectOne("SQLMapper.getStringData",sql);
		return s;
	}
}
