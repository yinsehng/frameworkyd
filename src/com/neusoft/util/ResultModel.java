package com.neusoft.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public class ResultModel implements Serializable{

	private static final long serialVersionUID = 1L;

	private int code;
	private String message;
	private String title;
	private Map<String, ArrayList> series;
	private Map<String, ArrayList> xAxis;
	private Map<String, ArrayList> yAxis;
	private Map<String, ArrayList<Data>> data;
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Map<String, ArrayList> getSeries() {
		return series;
	}
	public void setSeries(Map<String, ArrayList> series) {
		this.series = series;
	}
	public Map<String, ArrayList> getxAxis() {
		return xAxis;
	}
	public void setxAxis(Map<String, ArrayList> xAxis) {
		this.xAxis = xAxis;
	}
	public Map<String, ArrayList> getyAxis() {
		return yAxis;
	}
	public void setyAxis(Map<String, ArrayList> yAxis) {
		this.yAxis = yAxis;
	}
	public Map<String, ArrayList<Data>> getData() {
		return data;
	}
	public void setData(Map<String, ArrayList<Data>> data) {
		this.data = data;
	}
	
}
