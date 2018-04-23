package com.neusoft.controller.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

@WebServlet(name="ActionServlet" ,urlPatterns={"/ActionServlet"},asyncSupported=true) 
public class ActionServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public ActionServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	/**
	 * 控制层servlet
	 * 
	 * **/
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String method=request.getParameter("method");
		String ajax=request.getParameter("ajax");
		ServletContext servletContext = this.getServletContext();  
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(servletContext);  
		SuperAction sa = (SuperAction) context.getBean(method);  
		
		if(ajax.equalsIgnoreCase("true")){
			out.print(sa.actionAjaxHandler(request, response));
		}else{
			sa.actionForwardHandler(request, response);
		}
		
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
