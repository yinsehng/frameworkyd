package com.neusoft.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class SetSpringContext  implements ApplicationContextAware{
	private static ApplicationContext ctx;
	public void setApplicationContext(ApplicationContext app)
			throws BeansException {
		ctx = app;
	}
	public static ApplicationContext getCtx() {
		return ctx;
	}
}
