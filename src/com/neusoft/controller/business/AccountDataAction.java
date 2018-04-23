package com.neusoft.controller.business;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.neusoft.controller.util.SuperAction;
import com.neusoft.model.JY_KC24;
import com.neusoft.service.IJYKC24Service;
import com.neusoft.util.PageHelper;

@Controller
public class AccountDataAction implements SuperAction{

	@Resource
	public IJYKC24Service jyIjykc24Service;
	private int def_pageNum = 1;
	private int def_pageSize = 8;
	@Override
	public String actionAjaxHandler(HttpServletRequest request,
			HttpServletResponse response) {
		String options = (String)request.getParameter("options");
		String begin_time = (String)request.getParameter("begin_time");
		String end_time = (String)request.getParameter("end_time");
		String pageNum = (String)request.getParameter("pageNum");
		String detail_condition = (String)request.getParameter("detail_condition");
		try {
			def_pageNum = pageNum != null?Integer.parseInt(pageNum):def_pageNum;
		} catch (Exception e) {
			System.out.println(pageNum);
		}
		
		PageHelper.Page<JY_KC24> list = null;
		if ("1".equals(options)) {
			//已完成的对账信息
			list = jyIjykc24Service.findAllAccountByPage(begin_time, end_time, def_pageNum, def_pageSize);
		} else if("2".equals(options)){
			list = jyIjykc24Service.findAllNoAccountByPage(begin_time, end_time, def_pageNum, def_pageSize);
		} else if("3".equals(options)){
			list = jyIjykc24Service.findErrorAccountByPage(begin_time, end_time, def_pageNum, def_pageSize);
		} else if ("5".equals(options)) {
			list = jyIjykc24Service.findByCondition(null,detail_condition,null, def_pageNum, def_pageSize);
		} else if ("6".equals(options)) {
			list = jyIjykc24Service.findByCondition(null,null,detail_condition, def_pageNum, def_pageSize);
		} else if ("7".equals(options)) {
			list = jyIjykc24Service.findByCondition(detail_condition,null,null, def_pageNum, def_pageSize);
		}
		
		String noAccountData_json = JSON.toJSONString(list);
		return noAccountData_json;
	}

	@Override
	public void actionForwardHandler(HttpServletRequest request,
			HttpServletResponse response) {
		
	}
}
