/**
  项目JS主入口
  以依赖Layui的layer和form模块为例
**/    
layui.define(['jquery','layer','layedit', 'form','laydate'], function(exports){
  var layer = layui.layer,
      $=layui.jquery,
      layedit = layui.layedit,
      laydate = layui.laydate;
      exports('index', {}); //注意，这里是模块输出的核心，模块名必须和use时的模块名一致

  //构建一个默认的编辑器
  var index = layedit.build('LAY_demo_editor');
  
   $("#onebtn").click(function(){
		  window.location.href=url+"/user/getAllUser.do";
	  });

  
}); 

