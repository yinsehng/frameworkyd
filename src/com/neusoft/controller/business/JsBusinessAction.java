package com.neusoft.controller.business;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.neusoft.controller.util.SuperAction;
import com.neusoft.model.JY_KC24;
import com.neusoft.service.IJYKC24Service;
import com.neusoft.util.Data;

@Controller
public class JsBusinessAction implements SuperAction{

	@Resource
	public IJYKC24Service jyIjykc24Service;
	@Override
	public String actionAjaxHandler(HttpServletRequest request,
			HttpServletResponse response) {
		String akc351 = (String)request.getParameter("akc351");
		JY_KC24 kc24 = jyIjykc24Service.getKc24ByAkc351(akc351);
		List<Data> data = convertData(kc24);
		String kc24_json = JSON.toJSONString(data);
		return kc24_json;
	}

	private List<Data> convertData(JY_KC24 kc24) {
		ArrayList<Data> list = new ArrayList<Data>();
		
	    Data data1 = new Data("账户支出",kc24.getAKC255(),false);
	    list.add(data1);
	    
	    Data data2 = new Data("基本医疗补助",kc24.getAKC260(),false);
	    list.add(data2);
	    
	    Data data3 = new Data("现金支付",kc24.getAKC261(),false);
	    list.add(data3);
	    
	    Data data4 = new Data("公务员补助",kc24.getZKC025(),false);
	    list.add(data4);
	    
		return list;
	}

	@Override
	public void actionForwardHandler(HttpServletRequest request,
			HttpServletResponse response) {
		
	}

}
