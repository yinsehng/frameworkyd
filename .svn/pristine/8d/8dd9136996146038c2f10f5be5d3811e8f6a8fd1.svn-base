package com.neusoft.service;

import java.util.List;

import com.neusoft.model.JY_KC24;
import com.neusoft.util.PageHelper;
import com.neusoft.util.PageHelper.Page;

public interface IJYKC24Service {

	public List<JY_KC24> findAll();
	
	public PageHelper.Page<JY_KC24> findAllByPage();
	
	public List<JY_KC24> findAllNoAccount(String begin_time, String end_time);
	
	public PageHelper.Page<JY_KC24> findAllNoAccountByPage(String begin_time, String end_time, int def_pageNum, int def_pageSize);
	
	public List<Object> getAxisTime(String aac002, String akc190, String akc351, String yab060, String yab600);
	
	public List<Object> getAxisTime(String aac002);

	public Page<JY_KC24> findByCondition(String aac001, String aac002,
			String aac003,int def_pageNum, int def_pageSize);
	
	public JY_KC24 getKc24ByAkc351(String akc351);

	public Page<JY_KC24> findAllAccountByPage(String begin_time,
			String end_time, int def_pageNum, int def_pageSize);

	public Page<JY_KC24> findErrorAccountByPage(String begin_time,
			String end_time, int def_pageNum, int def_pageSize);
}
