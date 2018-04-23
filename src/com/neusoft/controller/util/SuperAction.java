package com.neusoft.controller.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 控制层接口
 * @author cgh
 * **/
public interface SuperAction {
	/**
	 * ajax使用接口
	 * **/
	public String actionAjaxHandler(HttpServletRequest request, HttpServletResponse response);
	
	
	/**
	 * 转发使用接口
	 * **/
	public void actionForwardHandler(HttpServletRequest request, HttpServletResponse response);

}
