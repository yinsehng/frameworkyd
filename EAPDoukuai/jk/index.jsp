<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../public/common.jsp"%>
<!-- 页面采用bootstrap进行实现 -->
<body style="background-image: url('<%=basePath%>static/images/bg.jpg');">
    <div class="container-fluid">
		<div class="row top-height">
			<div id="main-bg" class="col-lg-3 com-height">1</div>
			<div class="col-lg-6 com-height">
				<div style="font-size: 35px; text-align: center; color: white; font-weight: bold;">吉林省跨省异地交易监控平台
  					<div id="search" style="text-align: center;color: #aaa;cursor:pointer;font-weight: bold;font-size: 14px;z-index: 1800">数据时间：2017-09-08 10:00:00</div>
  				</div>
			</div>
			<div class="col-lg-3 com-height">3</div>
		</div>
		<div class="row com-height">
			<div class="col-lg-3 com-height">4</div>
			<div class="col-lg-6 com-height">
				<!-- 地图显示 -->
				<div id="china-map" style="width: 100%;height:90%;"></div>
			</div>
			<div class="col-lg-3 com-height">6</div>
		</div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="margin-top: 13%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<div class="row" style="height: 0%;">
						<div class="col-lg-4 " style="height: 100%;">
							<h4 class="modal-title">查询：</h4>
						</div>
						<div class="col-lg-4 " style="height: 100%;"></div>
						<div class="col-lg-3 " style="height: 100%;">
							<div style="height:100%;margin-left: 50%;">
								<input class="tgl tgl-flip" id="cb5" type="checkbox"/>
    						 	<label class="tgl-btn change-select" flag = "0" data-tg-off="时间" data-tg-on="个人" for="cb5"></label>
							</div>
						</div>
					</div>
					
				</div>
				<div class="modal-body">
					<div class="common" style="display: block;">
						<div class="row com-height " style="height: 10%;margin-top: 18px;">
							<div class="col-lg-4 " style="height: 100%;">
								<select class="selectpicker one">
	  								<option value="1">已完成对账</option>
	  								<option value="2">未完成对账</option>
	  								<option value="3">问题对账</option>
	  								<option value="4">清算数据</option>
								</select>
							</div>
							<div class="col-lg-8 " style="height: 100%;">
								<div>
	    							开始：<input id="d4311" class="Wdate cont" name="begintime" type="text" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'d4312\')||\'2020-10-01\'}'})"/> 
									至<input id="d4312" class="Wdate cont" name="endtime" type="text" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'d4311\')}',maxDate:'2020-10-01'})"/>
	    						</div>
							</div>
						</div>
					</div>
					<div class="detail" style="display: none;">
						<div class="row com-height " style="height: 10%;margin-top: 18px;">
							<div class="col-lg-4 " style="height: 100%;">
								<select class="selectpicker two">
	  								<option value="5">身份证号</option>
	  								<option value="6">姓名</option>
	  								<option value="7">个人编号</option>
								</select>
							</div>
							<div class="col-lg-8 " style="height: 100%;">
								<div>
	    							<div class="form-group">
									    <label for="exampleInputName2">条件</label>
									    <input type="text" class="form-control change-none set-width-90 " id="detail_condition" placeholder="请先选择前面选择框查询条件">
									</div>
	    						</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary submit">确定</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="tableModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width:1010px;margin-top:10%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" id="result" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">查询结果显示：</h4>
				</div>
				<div class="modal-body">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>姓名</th>
								<th>参保地</th>
								<th>就医地</th>
								<th>医院</th>
								<th>结算时间</th>
								<th>备注</th>
								<th>详情</th>
							</tr>
						</thead>
						<tbody id="content">
							
						</tbody>
				</table>
				</div>
				<div class="footer modal-footer" id="page">
					
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="timeAxisModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width:90%;margin-top:10%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" style="z-index:999!important;" id="orbit" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">就医轨迹</h4>
				</div>
				<div class="modal-body" style="height: 57%;margin-top: 25px;">
					<div class="container" style="margin-top: -30px;">
						<div class="fishBone" />
					</div>
					<div id="weight" style="display:none;width: 400px;height:400px;margin-top: -439px;margin-left: 75%;z-index:1;"></div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
</div>
<div id="main" class="circle" style="box-shadow: 2px 2px 2px #888888;height:440px;width:440px;position:absolute;display:none;z-index:99999;">

</div>
    <script type="text/javascript">
    var basePath = '<%=basePath%>';
    var rowcount = 0;
    $(document).ready(function(){
		$("#search").click(function(){
			$('#myModal').modal('show');
		});
		$(".submit").click(function(){
			$('#myModal').modal('hide');
			var flag = $('.change-select').attr('flag');
			var begin_time = $("#d4311").val();
			var end_time = $("#d4312").val();
			var detail_condition = $("#detail_condition").val();
			$.fn.createPage(null);
			if (flag == 0) {
				var options = $('.selectpicker.one').val();
				getData(basePath,options,begin_time,end_time,detail_condition,1,1);
			} else {
				var options = $('.selectpicker.two').val();
				getData(basePath,options,begin_time,end_time,detail_condition,1,1);
			}
			
			//查询数据,弹出分页的结算数据数据
			$("#tableModal").modal('show');
		});
		$(".change-select").click(function(){
			var flag = $(this).attr("flag");
			if (flag == "0") {
				$(this).attr("flag","1");
			}
			if (flag == "1") {
				$(this).attr("flag","0");
			}
			
		});
		$(".change-select").click(function(){
			var common = $(".common").css("display");
			if (common == "block") {
				//开始隐藏时间查询的面板
				$(".common").css("display","none");
				$(".detail").css("display","block");
			} else {
				//开始显示查询的面板
				$(".common").css("display","block");
				$(".detail").css("display","none");
			}
		});
	});
    $(function(){
    	$("body").delegate(".show-detail","click",function(){
	    	//点击详情进行数据的请求
	    	showAxisTime(this,1);
    	});
    	
    	$("body").delegate(".aac002","click",function(){
    		//点击详情进行数据的请求
	    	showAxisTime(this,2);
    	});
    	$("#orbit").click(function(){
    		//关闭轨迹图时打开查询结果图
    		$("#tableModal").modal("show");
    	});
    	//监听鼠标经过事件
    	var weight = echarts.init(document.getElementById('main'));
    	$("body").delegate(".content","mouseenter",function(){
	    	//点击详情进行数据的请求
    		var lis = $($($(this)[0]).children()[0]).children();
	    	for (var i = 0; i < lis.length; i++) {
	    		var text = $(lis[i]).text();
	    		
	    		if (text.indexOf('aka135：1') >= 0) {
	    			var akc351 = text.substr(text.indexOf('&')+1);
	    			//得到结算信息
	    			getJsInfo(weight,akc351);
	    			
	    			show(this,'main');
	    		}
	    		
	    	}
    	});
    	$("body").delegate(".content","mouseleave",function(){
	    	//点击详情进行数据的请求
	    	hide(this,'main');
    	});
    });
    //地图显示部分
    var myChart = echarts.init(document.getElementById('china-map'));

	var option = {
			title: {
				show:false,
		        text: '吉林省异地就医交易监控平台',
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
		        max: 1500,
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
	                    mapType: 'china',
	                    selectedMode : 'single',
	                    left:'center',
	        			top:'12%',
	        			width: '90%',
	        			height:'75%',
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
	                    data:[
	                          {name: '北京',value: randomData() },
	                          {name: '天津',value: randomData() },
	                          {name: '上海',value: randomData() },
	                          {name: '重庆',value: randomData() },
	                          {name: '河北',value: randomData() },
	                          {name: '河南',value: randomData() },
	                          {name: '云南',value: randomData() },
	                          {name: '辽宁',value: randomData() },
	                          {name: '黑龙江',value: randomData() },
	                          {name: '湖南',value: randomData() },
	                          {name: '安徽',value: randomData() },
	                          {name: '山东',value: randomData() },
	                          {name: '新疆',value: randomData() },
	                          {name: '江苏',value: randomData() },
	                          {name: '浙江',value: randomData() },
	                          {name: '江西',value: randomData() },
	                          {name: '湖北',value: randomData() },
	                          {name: '广西',value: randomData() },
	                          {name: '甘肃',value: randomData() },
	                          {name: '山西',value: randomData() },
	                          {name: '内蒙古',value: randomData() },
	                          {name: '陕西',value: randomData() },
	                          {name: '吉林',value: randomData() },
	                          {name: '福建',value: randomData() },
	                          {name: '贵州',value: randomData() },
	                          {name: '广东',value: randomData() },
	                          {name: '青海',value: randomData() },
	                          {name: '西藏',value: randomData() },
	                          {name: '四川',value: randomData() },
	                          {name: '宁夏',value: randomData() },
	                          {name: '海南',value: randomData() },
	                          {name: '台湾',value: randomData() },
	                          {name: '香港',value: randomData() },
	                          {name: '澳门',value: randomData() }
	                      ]
	                },
	                {
	                    name: '异地转出人员',
	                    type: 'map',
	                    mapType: 'china',
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
	                    data:[
	                          {name: '北京',value: randomData() },
	                          {name: '天津',value: randomData() },
	                          {name: '上海',value: randomData() },
	                          {name: '重庆',value: randomData() },
	                          {name: '河北',value: randomData() },
	                          {name: '河南',value: randomData() },
	                          {name: '云南',value: randomData() },
	                          {name: '辽宁',value: randomData() },
	                          {name: '黑龙江',value: randomData() },
	                          {name: '湖南',value: randomData() },
	                          {name: '安徽',value: randomData() },
	                          {name: '山东',value: randomData() },
	                          {name: '新疆',value: randomData() },
	                          {name: '江苏',value: randomData() },
	                          {name: '浙江',value: randomData() },
	                          {name: '江西',value: randomData() },
	                          {name: '湖北',value: randomData() },
	                          {name: '广西',value: randomData() },
	                          {name: '甘肃',value: randomData() },
	                          {name: '山西',value: randomData() },
	                          {name: '内蒙古',value: randomData() },
	                          {name: '陕西',value: randomData() },
	                          {name: '吉林',value: randomData() },
	                          {name: '福建',value: randomData() },
	                          {name: '贵州',value: randomData() },
	                          {name: '广东',value: randomData() },
	                          {name: '青海',value: randomData() },
	                          {name: '西藏',value: randomData() },
	                          {name: '四川',value: randomData() },
	                          {name: '宁夏',value: randomData() },
	                          {name: '海南',value: randomData() },
	                          {name: '台湾',value: randomData() },
	                          {name: '香港',value: randomData() },
	                          {name: '澳门',value: randomData() }
	                      ]
	                 }
		        ]
		     
		};
		myChart.on('click', function (param){
			//showOnlyData(param.name);
		});
    	myChart.setOption(option);
    	
    	function randomData() {
    	    return Math.round(Math.random()*1000);
    	}
    	
    </script>
</body>
</html>
