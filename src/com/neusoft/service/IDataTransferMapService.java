package com.neusoft.service;

import java.util.List;

import com.neusoft.model.JK_AA26;
import com.neusoft.util.ResultModel;

public interface IDataTransferMapService {
	public List<Object> getAllAa26();
	
	public ResultModel getMapData();
}