<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 100%;height:100%;"></div>
<script type="text/javascript">
	
var myChart = echarts.init(document.getElementById('main'));
 
var mapData=<%=request.getAttribute("mapData")%>

var option = {
		title: {
			show:false,
	        text: '吉林省异地就医服务监控平台',
	        subtext: '技术支持：东软集团',
	        sublink: 'http://www.neusoft.com',
	        left: 'center',
	        textStyle: {
	            color: '#fff'
	        }
	    },
	    legend: {
	        orient: 'vertical',
	        top: 'bottom',
	        left: 'right',
	        
	        textStyle: {
	            color: '#fff'
	        },
	        selectedMode: 'multiple'
	    },
	    tooltip: {},
	    dataRange: {
	        min: 0,
	        max: 200000,
	        x: 'left',
	        y: 'bottom',
	        color:['#ff0000','#00BB00'],
	        text:['高','低'],           // 文本，默认为数值文本
	        calculable : true
	    },
	    series :[ 
	        {
                    name: '异地转入人员',
                    type: 'map',
                    mapType: '吉林',
                    selectedMode : 'single',
                    left:'center',
        			top:'1px',
        			width: '85%',
        			height:'99%',
                    itemStyle:{
                        normal:{label:{show:true}},
                        emphasis:{label:{show:true}}
                    },
                    label: {
                        normal: {
                            show: true,
                            textStyle: {
                                color: 'rgba(255,255,255,1)'
                            }
                        }
                    },
                    data:mapData.series.转入
                },
                {
                    name: '异地转出人员',
                    type: 'map',
                    mapType: '吉林',
                    selectedMode : 'single',
                    itemStyle:{
                        normal:{label:{show:true}},
                        emphasis:{label:{show:true}}
                    },
                    label: {
                        normal: {
                            show: true,
                            textStyle: {
                                color: 'rgba(255,255,255,1)'
                            }
                        }
                    },
                    data:mapData.series.转出
                 }
	        ]
	     
	};
	myChart.on('click', function (param){
		showOnlyData(param.name);
	});
    myChart.setOption(option);         
</script>