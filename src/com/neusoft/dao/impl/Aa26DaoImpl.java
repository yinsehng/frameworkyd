package com.neusoft.dao.impl;


import org.springframework.stereotype.Repository;

import com.neusoft.dao.IAa26Dao;
@Repository
public class Aa26DaoImpl extends SuperDaoImpl  implements IAa26Dao {
	@Override
	public String getProvinceNameByCode(String provinceName) {
		return sqlSessionTemplate.selectOne("JK_AA26Mapper.getProvinceNameByCode", provinceName);
	}

}
