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
	<meta http-equiv="description" content="吉林省跨省异地交易监控平台">
	<title>吉林省跨省异地交易监控平台</title>
	<link rel="stylesheet" type="text/css" href="<%=basePath %>plugins/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=basePath %>plugins/bootstrap/css/bootstrap-select.min.css">
	<link rel="stylesheet" href="<%=basePath %>static/css/my.css">
	<link rel="stylesheet" href="<%=basePath %>plugins/time-axis/css/fishBone.css">
	<link rel="stylesheet" href="<%=basePath %>plugins/page/css/pageCode.css">
	<link rel="stylesheet" href="<%=basePath %>plugins/page/css/reset.css">
	<!-- 引入监控首页公共的js -->
	<script src="<%=basePath %>plugins/echarts/echarts.js"></script>
	<script src="<%=basePath %>plugins/echarts/jilin.js"></script>
	<script src="<%=basePath %>plugins/echarts/china.js"></script>
	<script src="<%=basePath %>plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="<%=basePath %>plugins/jQueryUI/jq_scroll.js"></script>
	<script src="<%=basePath %>plugins/jQueryUI/jquery.myslider.js"></script>
	<script src="<%=basePath %>plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=basePath %>plugins/bootstrap/js/bootstrap-select.min.js"></script>
	<script src="<%=basePath %>plugins/My97DatePicker/WdatePicker.js"></script>
	<script src="<%=basePath %>plugins/time-axis/js/fishBone.js"></script>
	<script src="<%=basePath %>plugins/time-axis/js/jquery.SuperSlide.2.1.1.js"></script>
	<!-- 引入屏幕F11处理的js -->
	<script src="<%=basePath %>static/js/screen-util.js"></script>
	<script src="<%=basePath %>static/js/my.js"></script>
	<script src="<%=basePath %>plugins/page/js/jquery.page.js"></script>
	<style type="text/css">
		html,body { height: 100%;width: 100%;}
		.com-height{ height: 100%;padding: 0;}
		.top-height{ height: 10%;padding: 0;}
	</style>
  </head>