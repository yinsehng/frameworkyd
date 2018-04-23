//通过选项，时间查询结算或者对账的数据
var count = 0;
function getData(basePath,options,begin_time,end_time,detail_condition,pageNum,position){
	if (position == 1) {
		count = 1;
		$("#page").children().remove();
	} else if (position == 2) {
		count = 2;
	}
	var url = basePath + "ActionServlet?method=accountDataAction&ajax=true&timestamp=" + new Date().getTime();
	//开始渲染表格的内容
	var content = $("#content");
	var page = "<div class='tcdPageCode' style='display: block;'></div>";
	$('#content > tr').remove();
	$.ajax( {  
	    url: url,
	    data:{
	    	'options' : options,
	    	'begin_time' : begin_time,
	    	'end_time' : end_time,
	    	'detail_condition' : detail_condition,
	    	'pageNum' : pageNum
	    },  
	    type:'POST',
	    cache:false, 
	    dataType:'json',
	    async: false,
	    success:function(data) {
	    	console.log(data);
	    	_data = data;
	    	var html = "";
	    	if (data.result != null && data.result.length > 0) {
	    		for (var i = 0; i < data.result.length; i++) {
	    			var aaa204 = "";
	    			var akc021 = "";
	    			var akc021_tip = data.result[i].aKB021;
	    			var tip = data.result[i].aAA204;
	    			if (tip.length > 29) {
	    				aaa204 = tip.substr(0,25) + "...";
	    			} else {
	    				aaa204 = tip;
	    			}
	    			
	    			if (akc021_tip.length > 11) {
	    				akc021 = akc021_tip.substr(0,11) + "..";
	    			} else {
	    				akc021 = akc021_tip;
	    			}
	    			html += "<tr><td><a href='javascript:;' class='aac002' aac002='"+data.result[i].aAC002+"'>"+data.result[i].aAC003+"</a></td><td>"+data.result[i].yAB003+"</td><td>"+data.result[i].yAB300+"</td><td title='"+akc021_tip+"'>"+akc021+"</td><td>"+data.result[i].aAE040+"</td><td title='"+tip+"'>"+aaa204+"</td>" +
	    					"<td><span class='glyphicon glyphicon-list show-detail' aac002='"+data.result[i].aAC002+"' akc190='"+data.result[i].aKC190+"' akc351='"+data.result[i].aKC351+"' yab060='"+data.result[i].yAB060+"' yab600='"+data.result[i].yAB600+"' aria-hidden='true'></span></td></tr>";
	    		}
	    	} else {
	    		console.log('显示无数据');
	    		html += "<tr><td></td><td></td><td></td><td>无数据</td><td></td><td></td><td></td><td></td></tr>";
	    	}
	    	content.append($(html));
	    	if (data.pages > 0) {
	    		if (count == 1) {
	    			$("#page").append($(page));
	    			$(".tcdPageCode").createPage({
		    	        pageCount:data.pages,
		    	        current:pageNum,
		    	        backFn:function(p){
		    	        	getData(basePath,options,begin_time,end_time,detail_condition,p,2);
		    	        }
		    	    });
	    			$(".tcdPageCode").css('display','block');
	    		}
	    		
	    	} else {
	    		//表示无数据，则隐藏分页的默认显示
	    		$(".tcdPageCode").css('display','none');
	    	}
	    	
	     },
	     error : function() {
	        
	     }
	});
}

function fixWindow() {
    //item所占的宽度 = 自身宽度+marginleft
    var item = $(".fishBone .bd .item");
    var marginleft = parseInt(item.css('margin-left'))
    var item_w = item.width() + marginleft;

    //显示区域
    var bd_w = $(".fishBone .bd").width();
    //能显示的个数 取整
    var rowcount = parseInt(bd_w / item_w);
    if (rowcount > item.size()) {
        //rowcount = item.size();
        $(".fishBone .prev,.fishBone .next").hide()
    }
    //设置新的宽度使其平均分布
    var item_w_temp = bd_w / rowcount - marginleft;
    item.width(item_w_temp);
    return rowcount;
};

function showAxisTime(_this,option){
	//获取aac002,akc190,akc351
	var aac002 = $(_this).attr("aac002");
	var akc190 = $(_this).attr("akc190");
	var akc351 = $(_this).attr("akc351");
	var yab060 = $(_this).attr("yab060");
	var yab600 = $(_this).attr("yab600");
	var url = basePath + "ActionServlet?method=axisTimeAction&ajax=true&timestamp=" + new Date().getTime();
	$.ajax({ 
	    url: url,
	    data:{
	    	'aac002' : aac002,
	    	'akc190' : akc190,
	    	'akc351' : akc351,
	    	'yab060' : yab060,
	    	'yab600' : yab600,
	    	'option' : option
	    },  
	    type:'POST',
	    cache:false, 
	    dataType:'json',
	    async: false,
	    success:function(data) {
	    	initAxisTime(data);
	    },
	    error : function() {
	        
	    }
	});
}

function initAxisTime(data){
	$('#tableModal').modal('hide');
	$('#timeAxisModal').modal('show');
	
	//创建就医轨迹
	$(".fishBone").fishBone(data);
	//3.翻页滚动效果
	rowcount = 3;
	jQuery(".fishBone").slide({
		   titCell: ".hd ul",
		   mainCell: ".bd>ul",
		   autoPage: true,
		   effect: "left",
		   autoPlay: false,
		   trigger:"click",
		   scroll: rowcount,
		   vis: rowcount,
		   delayTime:1000
	});
	if (data.length <= 5) {
		//开始进行统计图的绘制
		var weight = echarts.init(document.getElementById('weight'));
		huatu(weight);
		//开始隐藏fixNext
		$('#fixNext').css('display','none');
	}
}

function getJsInfo(weight,akc351) {
	var url = basePath + "ActionServlet?method=jsBusinessAction&ajax=true";
	$.ajax({
	    url: url,
	    data:{
	    	'akc351' : akc351
	    },  
	    type:'POST',
	    cache:false, 
	    dataType:'json',
	    async: false,
	    success:function(result) {
	    	huatu(weight,result);
	    },
	    error : function() {
	        
	    }
	});
}


function show(obj,id) {
    var objDiv = $("#"+id+"");
    $(objDiv).css("display","block");
    var screen_width = screen.width;
    var screen_height = screen.height;
    var left = event.clientX;
    var top = event.clientY;
    if (left > 900) {
    	$(objDiv).css("left", event.clientX - 400);
    } else {
    	$(objDiv).css("left", event.clientX);
    }
    
    if (top > screen_height/2) {
    	$(objDiv).css("top", event.clientY - 200);
    } else {
    	$(objDiv).css("top", event.clientY + 10);
    }
    
}

function hide(obj,id) {
    var objDiv = $("#"+id+"");
    $(objDiv).css("display", "none");
} 


function huatu(weight, data) {
	  option = {
	        			    title : {
	        			        text: '各费用支出占比',
	        			        x:'center',
	        			        top: 50
	        			    },
	        			    backgroundColor: 'rgba(238, 238, 209,120)',
	        			    tooltip : {
	        			        trigger: 'item',
	        			        formatter: "{a} <br/>{b} : {c} ({d}%)"
	        			    },
	        			    series : [
	        			        {
	        			            name: '费用支出占比',
	        			            type: 'pie',
	        			            radius : '55%',
	        			            center: ['50%', '50%'],
	        			            label: {
	        			                normal: {
	        			                    formatter: '{b}\n{c}\n{d}%'
	        			                },
	        			          
	        			            },
			            			labelLine: {
			                			normal: {
			                    			show: true
			                			}
			            			},
	        			            data:data,
	        			            itemStyle: {
	        			                emphasis: {
	        			                    shadowBlur: 10,
	        			                    shadowOffsetX: 0,
	        			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
	        			                }
	        			            }
	        			        }
	        			    ]
	        			};
	        weight.setOption(option);
	}
