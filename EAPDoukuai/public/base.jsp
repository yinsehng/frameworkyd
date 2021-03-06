<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="异地,监控,异地监控">
	<meta http-equiv="description" content="齐齐哈尔市参保统计监控平台">
	<title>齐齐哈尔市参保统计监控平台</title>
	<!-- 引入监控首页公共的css -->
	<link rel="stylesheet" type="text/css" href="<%=basePath %>static/css/index.css">
	<!-- 引入实时交易的css -->
	<link rel="stylesheet" type="text/css" href="<%=basePath %>static/css/hx.css">
	<!-- 引入模态窗口的css -->
	<link rel="stylesheet" type="text/css" href="<%=basePath %>plugins/jQueryUI/jquery.modal.css">
	<!-- 引入滚动css -->
	<link rel="stylesheet" type="text/css" href="<%=basePath %>plugins/jQueryUI/jquery.myslider.css">
	<!-- 引入监控首页公共的js -->
	<script src="<%=basePath %>plugins/echarts/echarts.js"></script>
	<script src="<%=basePath %>plugins/echarts/jilin.js"></script>
	<script src="<%=basePath %>plugins/echarts/china.js"></script>
	<script src="<%=basePath %>plugins/jQuery/jquery-3.1.1.min.js"></script>
	<script src="<%=basePath %>plugins/jQueryUI/jquery.waypoints.min.js"></script>
	<script src="<%=basePath %>plugins/jQueryUI/jquery.countup.min.js"></script>
	<script src="<%=basePath %>plugins/jQueryUI/jquery.modal.js"></script>
	<script src="<%=basePath %>plugins/jQueryUI/jq_scroll.js"></script>
	<script src="<%=basePath %>plugins/jQueryUI/jquery.myslider.js"></script>
	<script language="javascript" type="text/javascript" src="<%=basePath %>plugins/My97DatePicker/WdatePicker.js"></script>
	<!-- 引入屏幕F11处理的js -->
	<script src="<%=basePath %>static/js/screen-util.js"></script>
  </head>