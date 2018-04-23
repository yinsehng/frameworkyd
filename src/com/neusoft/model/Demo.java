package com.neusoft.model;

import java.util.List;

/**
 */
public class Demo {

    private int id;
    private String name;
    private String title;

    // registry list
    private List<String> registryList;  // 执行器地址列表(系统注册)

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }


    public List<String> getRegistryList() {
        return registryList;
    }

    public void setRegistryList(List<String> registryList) {
        this.registryList = registryList;
    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


}
