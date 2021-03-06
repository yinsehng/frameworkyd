package com.neusoft.util;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ConvertDataToRMUtil {

	public static ResultModel convertDataToRM(List<Object> list_out, List<Object> list_in) {
		ResultModel rm = new ResultModel();
		List yaxis_data_out = new ArrayList();
		List yaxis_data_in = new ArrayList();
		List data_out = new ArrayList();
		List data_in = new ArrayList();
		
		Map<String, ArrayList> series = new HashMap<String, ArrayList>();
		Map<String, ArrayList> yaxis = new HashMap<String, ArrayList>();
		
		for (Object  obj : list_out) {
			HashMap<String, String> map = (HashMap<String, String>)obj;
			yaxis_data_out.add(map.get("SUBJECT"));
			data_out.add(map.get("COUNT"));
		}
		for (Object  obj : list_in) {
			HashMap<String, String> map = (HashMap<String, String>)obj;
			yaxis_data_in.add(map.get("SUBJECT"));
			data_in.add(map.get("COUNT"));
		}
		
		series.put("转出", (ArrayList) data_out);
		series.put("转入", (ArrayList) data_in);
		yaxis.put("转出", (ArrayList)yaxis_data_out);
		yaxis.put("转入", (ArrayList)yaxis_data_in);
		
		rm.setSeries(series);
		rm.setyAxis(yaxis);
		rm.setCode(200);
		rm.setMessage("数据转载成功.");
		return rm;
	}
	
	public static ResultModel convertDataToRModel(List<Object> list_out, List<Object> list_in) {
		ResultModel rm = new ResultModel();
		List yaxis_data_out = new ArrayList();
		List yaxis_data_in = new ArrayList();
		List data_out = new ArrayList();
		List data_in = new ArrayList();
		
		Map<String, ArrayList> series = new HashMap<String, ArrayList>();
		Map<String, ArrayList> yaxis = new HashMap<String, ArrayList>();
		
		for (Object  obj : list_out) {
			HashMap<String, String> map = (HashMap<String, String>)obj;
			yaxis_data_out.add(map.get("SUBJECT"));
			data_out.add(map.get("COUNT"));
		}
		for (Object  obj : list_in) {
			HashMap<String, String> map = (HashMap<String, String>)obj;
			yaxis_data_in.add(map.get("SUBJECT"));
			data_in.add(map.get("COUNT"));
		}
		
		series.put("out", (ArrayList) data_out);
		series.put("in", (ArrayList) data_in);
		yaxis.put("out", (ArrayList)yaxis_data_out);
		yaxis.put("in", (ArrayList)yaxis_data_in);
		
		rm.setSeries(series);
		rm.setyAxis(yaxis);
		rm.setCode(200);
		rm.setMessage("数据转载成功.");
		return rm;
	}
	
	public static ResultModel convertDataToRM(List<Object> list) {
		ResultModel rm = new ResultModel();
		List yaxis_data = new ArrayList();
		List data = new ArrayList();
	
		Map<String, ArrayList> series = new HashMap<String, ArrayList>();
		Map<String, ArrayList> yaxis = new HashMap<String, ArrayList>();
		
		for (Object  obj : list) {
			HashMap<String, String> map = (HashMap<String, String>)obj;
			yaxis_data.add(map.get("SUBJECT"));
			data.add(map.get("COUNT"));
		}
		
		series.put("data", (ArrayList) data);
		yaxis.put("axis", (ArrayList)yaxis_data);
		
		rm.setSeries(series);
		rm.setyAxis(yaxis);
		rm.setCode(200);
		rm.setMessage("数据转载成功.");
		return rm;
	}
	
	public static ResultModel convertDataToModel(List<Object> list) {
		ResultModel rm = new ResultModel();
		List yaxis_data = new ArrayList();
		List data_AKC022 = new ArrayList();
		List data_AKC023 = new ArrayList();
		List data_AKC024 = new ArrayList();
		List data = new ArrayList();
		Map<String, ArrayList> series = new HashMap<String, ArrayList>();
		Map<String, ArrayList> yaxis = new HashMap<String, ArrayList>();
		
		for (Object  obj : list) {
			HashMap<String, String> map = (HashMap<String, String>)obj;
			yaxis_data.add(map.get("SUBJECT"));
			data_AKC023.add(map.get("AKC023"));
			data_AKC024.add(map.get("AKC024"));
		}
		data.add(data_AKC023);
		data.add(data_AKC024);
		series.put("data", (ArrayList) data);
		yaxis.put("axis", (ArrayList)yaxis_data);
		
		rm.setSeries(series);
		rm.setyAxis(yaxis);
		rm.setCode(200);
		rm.setMessage("数据转载成功.");
		return rm;
	}
	
	public static ResultModel convertDataToRM(List<Object> list, List<Object> list_in, List<Object> list_out, List<Object> birthday_list) {
		ResultModel rm = new ResultModel();
		Map<String, ArrayList<Data>> dataMap = new HashMap<String, ArrayList<Data>>();
		ArrayList<Data> data_list = new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			Data data = new Data();
			HashMap<String, String> map = (HashMap<String, String>)list.get(i);
			data.setName(map.get("SUBJECT"));
			data.setValue(map.get("COUNT"));
			data_list.add(data);
		}
		if (data_list != null && data_list.size() > 0) {
			data_list.get(0).setSelected(true);
		}
		dataMap.put("AKC170", data_list);
		ArrayList<Data> data_person = new ArrayList<>();
		for (Object  obj : list_out) {
			Data data = new Data();
			HashMap<String, String> map = (HashMap<String, String>)obj;
			data.setName("转出");
			data.setValue(map.get("COUNT"));
			data_person.add(data);
		}
		for (Object  obj : list_in) {
			Data data = new Data();
			HashMap<String, String> map = (HashMap<String, String>)obj;
			data.setName("转入");
			data.setValue(map.get("COUNT"));
			data_person.add(data);
		}
		dataMap.put("inout", data_person);
		
		ArrayList<Integer> area_list = new ArrayList();
		for (int i = 0; i <= 7; i++) {
			area_list.add(0);
		}
		int current_year = DateUtil.getYear();
		for (Object obj : birthday_list) {
			if(obj!=null){
				HashMap<String, String> map = (HashMap<String, String>)obj;
				int birthday = Integer.parseInt(map.get("BIRTHDAY"));
				int count = Integer.parseInt(map.get("COUNT"));
				int age = current_year - birthday + 1;
				if (age < 0) {
					age = -age;
				}
				int area = age/10;
				if (area >= 8) {
					area = 7;
				}
				try{
					int sum = area_list.get(area);
					area_list.set(area, count + sum);
				}catch(Exception e){
					System.out.println(area + ">>>age" + age);
					e.printStackTrace();
				}
			}
		}
		String[] year_arr = {"0-9岁","10-19岁","20-29岁","30-39岁","40-49岁","50-59岁","60-69岁","70岁以上"};
		ArrayList<Data> area_data = new ArrayList<>();
		for (int i = 0; i < area_list.size(); i++) {
			Data data = new Data();
			data.setName(year_arr[i]);
			data.setValue(area_list.get(i));
			area_data.add(data);
		}
		dataMap.put("yearArea", area_data);
		rm.setData(dataMap);
		rm.setCode(200);
		rm.setMessage("数据转载成功.");
		return rm;
	}
	
	public static String getResultData (List<Object> list) {
		String subject ="";
		for (Object  obj : list) {
			HashMap<String, Object> map = (HashMap<String, Object>)obj;
			if (map == null) {
				return subject;
			}
			subject = subject+convertBigDecimalToString(map.get("SUBJECT"))+"&";
		}
		return subject;
	}
	
	public static String convertBigDecimalToString (Object object) {
		
		DecimalFormat df = new DecimalFormat("0.00");
		return df.format(object);
	}
	
	public static String getCommonSql (String beginTime, String endTime,String localName) {
		String sql = " where 1 = 1 ";
		if (beginTime != null && !"".equals(beginTime)) {
			sql += " and aae036 >=  to_date('" + beginTime + "', 'yyyy-mm-dd hh24:mi:ss')";
		}
		if (endTime != null && !"".equals(endTime)) {
			sql += " and aae036 <=  to_date('" + endTime + "', 'yyyy-mm-dd hh24:mi:ss')";
		}
		if(localName!=null && !"".equals(localName)){
			sql +=" and  yab300=(SELECT aab301  FROM jk_aa26 WHERE aaa146 = '"+localName+"' AND ROWNUM=1 ) OR yab003=(SELECT aab301  FROM jk_aa26 WHERE aaa146 = '"+localName+"' AND ROWNUM=1 )";
		}
		return sql;
	}
}
