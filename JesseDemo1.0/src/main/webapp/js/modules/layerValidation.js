/**
 layer 自定义验证
**/  

layui.use(['jquery','form'], function() {
var form = layui.form();
form.verify({
    	  username: function(value, item){ //value：表单的值、item：表单的DOM对象
		    if(!new RegExp("^[a-zA-Z][a-zA-Z_0-9]{5,17}$").test(value)){
    	        return '6-18个字符，可使用字母、数字、下划线、需以字母开头，不区分大小写';
    	      }
    	    if(/^\d+\d+\d$/.test(value)){
    	        return '用户名不能全为数字';
    	      }
    	  },pwd: function(value, item){ //value：表单的值、item：表单的DOM对象
      	    if(!new RegExp("^[a-zA-Z0-9]{6,20}$").test(value)){
      	      return '6-20个字符，区分大小写';
      	    }
      	  },qknumber:function(value, item){ //value：表单的值、item：表单的DOM对象
        	    if(!new RegExp("^[0-9]{1,8}$").test(value)){
            	      return '最多只能输入8位数字';
            	    }
            	  }
    	});

});