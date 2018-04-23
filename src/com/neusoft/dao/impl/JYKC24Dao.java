package com.neusoft.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.neusoft.dao.IJYKC24Dao;
import com.neusoft.model.JY_KC24;
@Repository
public class JYKC24Dao extends SuperDaoImpl implements IJYKC24Dao{

	@Override
	public List<JY_KC24> findAll() {
		return sqlSessionTemplate.selectList("JY_KC24Mapper.findAll");
	}

	@Override
	public List<JY_KC24> findAllNoAccount(String begin_time, String end_time) {
		HashMap<String,Object> parames = new HashMap<>();
		parames.put("begin_time", begin_time);
		parames.put("end_time", end_time);
		return sqlSessionTemplate.selectList("JY_KC24Mapper.findAllNoAccount", parames);
	}

	@Override
	public List<JY_KC24> findAllByCondition(String akc190, String akc351) {
		HashMap<String,Object> parames = new HashMap<>();
		parames.put("akc190", akc190);
		parames.put("akc351", akc351);
		return sqlSessionTemplate.selectList("JY_KC24Mapper.findAllByCondition", parames);
	}


	@Override
	public List<JY_KC24> findByCondition(String aac001, String aac002,
			String aac003, String order) {
		HashMap<String,Object> parames = new HashMap<>();
		parames.put("aac001", aac001);
		parames.put("aac002", aac002);
		parames.put("aac003", aac003);
		parames.put("order", order);
		return sqlSessionTemplate.selectList("JY_KC24Mapper.findByCondition", parames);
	}

	@Override
	public JY_KC24 getKc24ByAkc351(String akc351) {
		HashMap<String,Object> parames = new HashMap<>();
		parames.put("akc351", akc351);
		return sqlSessionTemplate.selectOne("JY_KC24Mapper.getKc24ByAkc351", parames);
	}

	@Override
	public List<JY_KC24> findAllAccount(String begin_time, String end_time) {
		HashMap<String,Object> parames = new HashMap<>();
		parames.put("begin_time", begin_time);
		parames.put("end_time", end_time);
		return sqlSessionTemplate.selectList("JY_KC24Mapper.findAllAccount", parames);
	}

	@Override
	public JY_KC24 findAccount(String akc190, String aae072) {
		HashMap<String,Object> parames = new HashMap<>();
		parames.put("akc190", akc190);
		parames.put("aae072", aae072);
		return sqlSessionTemplate.selectOne("JY_KC24Mapper.findAccount", parames);
	}

	@Override
	public List<JY_KC24> findAllErrorAccount(String begin_time, String end_time) {
		
		HashMap<String,Object> parames = new HashMap<>();
		parames.put("begin_time", begin_time);
		parames.put("end_time", end_time);
		return sqlSessionTemplate.selectList("JY_KC24Mapper.findAllErrorAccount", parames);
	}

}
