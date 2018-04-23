package com.neusoft.util;

public class Data {

	private String name;
	private Object value;
	private boolean selected;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Object getValue() {
		return value;
	}
	public void setValue(Object value) {
		this.value = value;
	}
	public boolean isSelected() {
		return selected;
	}
	public void setSelected(boolean selected) {
		this.selected = selected;
	}
	public Data(){}
	public Data(String name, Object value, boolean selected) {
		super();
		this.name = name;
		this.value = value;
		this.selected = selected;
	}
	
}



