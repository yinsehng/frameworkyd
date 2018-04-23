package com.neusoft.controller.business;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import com.alibaba.fastjson.JSON;
import com.neusoft.controller.util.SuperAction;

@Controller
public class IndexAction implements SuperAction{
	
	@Override
	public String actionAjaxHandler(HttpServletRequest request,
			HttpServletResponse response) {
		HashMap<String, String> map = new HashMap<>();
		
		String data = JSON.toJSONString(map);
		return data;
	}

	@Override
	public void actionForwardHandler(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			
			request.getRequestDispatcher("/jk/index.jsp").forward(request, response);
			
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		
	}

}
