package com.neusoft.controller.business;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.neusoft.controller.util.SuperAction;
import com.neusoft.service.IJYKC24Service;
@Controller
public class AxisTimeAction implements SuperAction {

	@Resource
	public IJYKC24Service jyIjykc24Service;
	@Override
	public String actionAjaxHandler(HttpServletRequest request,
			HttpServletResponse response) {
		String aac002 = (String)request.getParameter("aac002");
		String akc190 = (String)request.getParameter("akc190");
		String akc351 = (String)request.getParameter("akc351");
		String yab060 = (String)request.getParameter("yab060");
		String yab600 = (String)request.getParameter("yab600");
		String option = (String)request.getParameter("option");
		List<Object> list = null;
		if ("1".equals(option)) {
			list = jyIjykc24Service.getAxisTime(aac002, akc190, akc351, yab060, yab600);
		} else {
			list = jyIjykc24Service.getAxisTime(aac002);
		}
		
		String axisTime_json = JSON.toJSONString(list);
		axisTime_json = covertData(axisTime_json);
		return axisTime_json;
	}

	private String covertData(String axisTime_json) {
		return axisTime_json.replace("aac002", "身份证号").replace("aac003", "姓名").replace("aae011", "经办人")
		.replace("aae036", "经办时间").replace("common", "医院").replace("status", "状态").replace("akc044", "_时间")
		.replace("akc021", "就医类型").replace("akc264","总费用").replace("time", "_时间")
		.replace("aab004", "单位名称").replace("aac004", "性别");
	}

	@Override
	public void actionForwardHandler(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

}
