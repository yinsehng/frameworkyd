package com.neusoft.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.neusoft.dao.IAa26Dao;
import com.neusoft.dao.IKc02Dao;
import com.neusoft.service.IDataTransferMapService;
import com.neusoft.util.ConvertDataToRMUtil;
import com.neusoft.util.Data;
import com.neusoft.util.ResultModel;

@Service
public class DataTransferMapServiceImpl implements IDataTransferMapService {
	
	@Resource
	public IAa26Dao aa26Dao;
	
	@Resource
	public IKc02Dao kc02Dao;
	
	public List<Object> getAllAa26(){
		return aa26Dao.getSqlData("SELECT aaa149,aaa150 FROM jk_aa26  WHERE aaa150 IS NOT NULL");
	}
	
	public ResultModel getMapData(){
		
		String out_sql = "select substr(yab003,0,4) subject, count(*) count from JK_KC02 where substr(yab003,0,2) = '22' and ydbz = 1 " +
                         " group by substr(yab003,0,4) order by subject desc";
		String in_sql = "select substr(yab300,0,4) subject, count(*) count from JK_KC02 where substr(yab300,0,2) = '22' and ydbz = 1 " +
                        " group by substr(yab300,0,4) order by subject desc";
		//审批出去的排行列表
		List<Object> list_out = kc02Dao.getSqlData(out_sql);
		//审批到本省的排行列表
		List<Object> list_in = kc02Dao.getSqlData(in_sql);
		//在此对返回的数据进行封装
	    ResultModel rm = ConvertDataToRMUtil.convertDataToRM(list_out, list_in);
	    //在此将地市编码转换成对应的名称
	    rm = convertRM(rm);
		
		return rm;
	}
	
	private ResultModel convertRM(ResultModel rm) {
	    Map<String, ArrayList> series = rm.getSeries();
	    Map<String, ArrayList> yAxis = rm.getyAxis();
	    ArrayList data_in = series.get("转入");
	    ArrayList data_out = series.get("转出");
	    ArrayList yaxis_in = yAxis.get("转入");
	    ArrayList yaxis_out = yAxis.get("转出");
	    ArrayList y_in = new ArrayList<>();
	    ArrayList y_out = new ArrayList<>(); 
	    for (int i = 0; i < data_in.size(); i++) {
	    	Data data = new Data();
	    	data.setName(getName(yaxis_in.get(i).toString() + "00"));
	    	data.setValue(data_in.get(i));
	    	y_in.add(data);
	    }
	    
	    for (int i = 0; i < data_out.size(); i++) {
	    	Data data = new Data();
	    	data.setName(getName(yaxis_out.get(i).toString()+"00"));
	    	data.setValue(data_out.get(i));
	    	y_out.add(data);
	    }
	    rm.getSeries().put("转入", y_in);
	    rm.getSeries().put("转出", y_out);
		return rm;
	}
	
	public String getName(String aaa027){
		String vdstcq = aa26Dao.getStringData("select aaa150 from jk_aa26 where aab301='" + aaa027 + "' and aaa150 is not null ");
		if(vdstcq==null  ){
		}
		return vdstcq;
	}
}
