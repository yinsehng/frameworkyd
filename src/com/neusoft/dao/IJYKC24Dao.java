package com.neusoft.dao;

import java.util.List;

import com.neusoft.model.JY_KC24;

public interface IJYKC24Dao {

	public List<JY_KC24> findAll();
	
	public List<JY_KC24> findAllNoAccount(String begin_time, String end_time);
	
	public List<JY_KC24> findAllByCondition(String akc190, String akc351);

	public List<JY_KC24> findByCondition(String aac001, String aac002,
			String aac003, String order);

	public JY_KC24 getKc24ByAkc351(String akc351);

	public List<JY_KC24> findAllAccount(String begin_time, String end_time);

	public JY_KC24 findAccount(String akc190, String aae072);

	public List<JY_KC24> findAllErrorAccount(String begin_time, String end_time);

}
