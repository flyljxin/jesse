<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>主页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	 <link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css"> 
  </head>
   <body >
<div class="layui-collapse" >
  <div class="layui-colla-item">
    <h2 class="layui-colla-title">【2017年】期刊信息概况</h2>
       <div class="layui-colla-content layui-show">
                 <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
             <div id="main" style="width: 100%;height:540px;"></div>
      </div>
  </div>

  </body>
 
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/layui/lay/dest/layui.all.js"></script>
    <script src="${pageContext.request.contextPath}/js/echarts.js"></script>
     <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
 <script type="text/javascript">
	  var layer = layui.layer,form = layui.form(),$=layui.jquery,laydate = layui.laydate,element=layui.element(),laypage=layui.laypage,layedit = layui.layedit,laytpl = layui.laytpl;
	 $(function(){
		  //构建一个默认的编辑器
		  var index = layedit.build('LAY_demo_editor');
		  var element = layui.element();
		  
		  // 基于准备好的dom，初始化echarts实例
	        var myChart = echarts.init(document.getElementById('main'));
	        var colors = ['#5793f3', '#d14a61', '#675bba'];

	        option = {
	        	    tooltip: {
	        	        trigger: 'axis',
	        	        axisPointer: {
	        	            type: 'cross',
	        	            crossStyle: {
	        	                color: 'red'
	        	            }
	        	        }
	        	    },
	        	    toolbox: {
	        	        feature: {
	        	            dataView: {show: true, readOnly: false},
	        	            magicType: {show: true, type: ['line', 'bar']},
	        	            restore: {show: true},
	        	            saveAsImage: {show: true}
	        	        }
	        	    },
	        	    legend: {
	        	        data:['头条版','资讯版','分享版','综合版','访问量']
	        	    },
	        	    xAxis: [
	        	        {
	        	            type: 'category',
	        	            data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
	        	            axisPointer: {
	        	                type: 'shadow'
	        	            }
	        	        }
	        	    ],
	        	    yAxis: [
	        	        {
	        	            type: 'value',
	        	            name: '发布数量',
	        	            min: 0,
	        	            max: 500,
	        	            interval: 100,
	        	            axisLabel: {
	        	                formatter: '{value}条'
	        	            }
	        	        },
	        	        {
	        	            type: 'value',
	        	            name: '访问量',
	        	            min: 0,
	        	            max: 50,
	        	            interval: 5,
	        	            axisLabel: {
	        	                formatter: '{value}次'
	        	            }
	        	        }
	        	    ],
	        	    series: [
	        	        {
	        	            name:'头条版',
	        	            type:'bar',
	        	            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
	        	        },
	        	        {
	        	            name:'资讯版',
	        	            type:'bar',
	        	            data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
	        	        },
	        	        {
	        	            name:'分享版',
	        	            type:'bar',
	        	            data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
	        	        },
	        	        {
	        	            name:'综合版',
	        	            type:'bar',
	        	            data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
	        	        },
	        	        {
	        	            name:'访问量',
	        	            type:'line',
	        	            yAxisIndex: 1,
	        	            data:[2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2]
	        	        }
	        	    ]
	        	};

	        // 使用刚指定的配置项和数据显示图表。
	        myChart.setOption(option);
		  
	 });
	  /**
     * 对layui进行全局配置
     */
/*     layui.config({
        base: '${pageContext.request.contextPath}/js/modules/'//你的模块目录
    }).use('index'); */
 
	</script>
  </body>
</html>
