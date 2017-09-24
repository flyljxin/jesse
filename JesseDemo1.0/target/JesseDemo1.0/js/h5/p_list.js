var url=$("#url").val();
var qknum=$("#qknum").val();
var pageNo=2;
var pageSize=5;
var total;//总条数
var pageNum;//总共有多少页
var upTouchnum=0;//记录上拉加载的次数
$(function(){
	var loadFlag = true;
	var oi = 0;
	var mySwiper = new Swiper('.swiper-container',{
		direction: 'vertical',//Slides的滑动方向，可设置水平(horizontal)或垂直(vertical)。
		scrollbar: '.swiper-scrollbar',//滚动条  Scrollbar容器的css选择器或HTML元素。
		slidesPerView: 'auto',//设置slider容器能够同时显示的slides数量(carousel模式)。可以设置为number或者 'auto'则自动根据slides的宽度来设定数量。loop模式下如果设置为'auto'还需要设置另外一个参数loopedSlides。
		mousewheelControl: true,//是否开启鼠标控制Swiper切换。设置为true时，能使用鼠标滚轮控制slide滑动。
		freeMode: true,//默认为false，普通模式：slide滑动时只滑动一格，并自动贴合wrapper，设置为true则变为free模式，slide会根据惯性滑动且不会贴合。
		onTouchMove: function(swiper){		//手动滑动中触发  手指触碰Swiper并滑动（手指）时执行。
			var _viewHeight = document.getElementsByClassName('swiper-wrapper')[0].offsetHeight;//内容高度+padding高度+边框宽度  ，jQuery中的outerHeight()方法返回的就是这个高度
            var _contentHeight = document.getElementsByClassName('swiper-slide')[0].offsetHeight;//内容高度+padding高度+边框宽度  ，jQuery中的outerHeight()方法返回的就是这个高度
            
            //mySwiper.translate获取wrapper的位移。
            if(mySwiper.translate < 50 && mySwiper.translate > 0) {
				/*$(".init-loading").html('下拉刷新...').show();*/
            	$(".refreshtip").show().find("span").html('下拉刷新...');
			}else if(mySwiper.translate > 50 ){
				/*$(".init-loading").html('释放刷新...').show();*/
				$(".refreshtip").show().find("span").html('释放立即刷新...');
			}
          
            
		},
		onTouchEnd: function(swiper) {//回调函数，当释放slider时执行
			
		     var type=getTypeFun(mySwiper2.activeIndex);
		     //alert("mySwiper2下标"+type);
			 console.log("位置值为: "+mySwiper.translate);
			//offsetHeight 
			//IE、Opera 认为 offsetHeight = clientHeight + 滚动条 + 边框。 
			//NS、FF 认为 offsetHeight 是网页内容实际高度，可以小于 clientHeight。 
			var _viewHeight = document.getElementsByClassName('swiper-wrapper')[0].offsetHeight;
            var _contentHeight = document.getElementsByClassName('swiper-slide')[0].offsetHeight;
         
            // 上拉加载  如果位移 小于等于  可视高度- 内容高度 -50   并且wrapper的位移小于0
            if(mySwiper.translate <= _viewHeight - _contentHeight - 50 && mySwiper.translate < 0) {
                // console.log("已经到达底部！");
               
                if(loadFlag){
                	$(".loadtip").html('正在加载...');
                }else{
                	$(".loadtip").html('没有更多啦！');
                }
                $(".tab li").unbind( "click" );
                mySwiper2.disableTouchControl(); 
                setTimeout(function() {
                	var view_msg="上拉加载更多...";
                    /*for(var i = 0; i <5; i++) {
                    	oi++;
                        $(".list-group").eq(mySwiper2.activeIndex).append('<li class="list-group-item">我是加载出来的'+oi+'...</li>');
                    }*/
                   var activeIndex = (type/100)-1 ;
                    $.post(url+"/period/getSubData.do",{type:type,pageSize:pageSize,pageNo:pageNo,qknum:qknum},function(data){
                    	    pageNo++;
                    	    upTouchnum++;
                  	       var pl =data[0].data.list;//分页数据
                  	        total=data[0].data.total;//总条数
                  	        
                  	        pageNum=Math.ceil(total/pageSize);//有多少页
                  	      if(pageNo-1>pageNum){
                  	    	  pageNo=pageNum+1;
                  	    	  view_msg="数据已加载完！";
                  	    	 $(".loadtip").html(view_msg).fadeIn("slow");
                  	    	 $(".loadtip").html(view_msg).fadeOut("slow");
                	        }else{
                	        	view_msg="上拉加载更多...";
                	        	$(".loadtip").html(view_msg).fadeIn("slow");
	                  	        for(var i = 0; i <pl.length; i++) {
			                        $(".list-group").eq(activeIndex)
			                           .append('<li class="list-group-item" data-id="'+pl[i].id+'">'
			                            +' <div class="qk-con-title" >'
			                              +'<div class="qk-left"><p>'+pl[i].title+'</p> </div>'
			                            +'  <div class="qk-right"><img alt="" src="'+pl[i].wzimage+'"> </div></div>'
			                            +'</li>');
			                   }
	                  	     
	                  	      qkinfodetileFun();//绑定事件
                  	        }
                  	    setTimeout(function(){
                  	    	 $('.tab li').on("click",typeClickFun); 
                        	 mySwiper2.enableTouchControl();
                  	    },500);  
                  	   
                    	 
                  	     mySwiper.update();
                   });
                    
                     $(".loadtip").html(view_msg);
                     mySwiper.update(); // 重新计算高度;
                }, 500);
            }
            
            // 下拉刷新$('.w').css('transform', 'translate3d(0px, 0px, 0px)')
            if(mySwiper.translate >= 50) {
               /* $(".init-loading").html('正在刷新...').show();*/
            	$(".refreshtip").find("span").html('正在刷新...');
            	$(".init-loading").css("height","1rem");
            	$(".init-loading").show();
                $(".loadtip").html('上拉加载更多');
                loadFlag = true;
                mySwiper2.disableTouchControl(); 
               
            	 $(".tab li").unbind( "click" );
                setTimeout(function() {
                    $(".refreshtip").show(0);
                    $(".refreshtip").find("span").html('刷新成功！');
                   
                    setTimeout(function(){
                    	$(".init-loading").hide();
                    	$(".refreshtip").hide();
                    	mySwiper2.enableTouchControl();
                    	  $('.tab li').on("click",typeClickFun);
                    	  var activeIndex = (type/100)-1 ;
                        $.post(url+"/period/getSubData.do",{type:type,pageSize:pageSize,pageNo:1,qknum:qknum},function(data){
                  	       var pl =data[0].data.list;//分页数据
                  	     $(".list-group").eq(activeIndex).html("");
                  	       for(var i = 0; i <pl.length; i++) {
             	                        $(".list-group").eq(activeIndex)
             	                           .append('<li class="list-group-item" data-id="'+pl[i].id+'">'
             	                            +' <div class="qk-con-title" >'
             	                            +'<div class="qk-left"><p>'+pl[i].title+'</p> </div>'
             	                            +'  <div class="qk-right"><img alt="" src="'+pl[i].wzimage+'"> </div></div>'
             	                            +'</li>');
             	                   }
                  	       qkinfodetileFun()
                  	        $('.w').css('transform', 'translate3d(0px, 0px, 0px)')
                  	    mySwiper.update();
                   });
                        pageNo=2;
                    },100);
                    $(".loadtip").show(0);
                    
                    //刷新操作
                    mySwiper.update(); // 重新计算高度;
                }, 900);
            }else if(mySwiper.translate >= 0 && mySwiper.translate < 50){
            	$(".init-loading").html('').hide();
            }
            return false;
		}
	});
	var mySwiper2 = new Swiper('.swiper-container2',{
		onTransitionEnd: function(swiper){//过渡结束时触发，接收Swiper实例作为参数。
			pageNo=2;
			$('.w').css('transform', 'translate3d(0px, 0px, 0px)')
			$('.swiper-container2 .swiper-slide-active').css('height','auto').siblings('.swiper-slide').css('height','0px');
			mySwiper.update();
			$('.tab li').eq(mySwiper2.activeIndex).addClass('active').siblings('li').removeClass('active');
		},onSlideChangeStart: function(swiper){//没有回弹不会执行这个函数
			
		    var type=getTypeFun(swiper.activeIndex);
		    pageNo=1;
		    $(".list-group").eq(mySwiper2.activeIndex).html("");
		    $.post(url+"/period/getSubData.do",{type:type,pageSize:pageSize,pageNo:pageNo,qknum:qknum},function(data){
            	       var pl =data[0].data.list;//分页数据
            	       for(var i = 0; i <pl.length; i++) {
		                        $(".list-group").eq(mySwiper2.activeIndex)
		                           .append('<li class="list-group-item" data-id="'+pl[i].id+'">'
		                            +' <div class="qk-con-title" >'
		                            +'<div class="qk-left"><p>'+pl[i].title+'</p> </div>'
		                            +'  <div class="qk-right"><img alt="" src="'+pl[i].wzimage+'"> </div></div>'
		                            +'</li>');
		                   }
            	       qkinfodetileFun()
            	    mySwiper.update();
             });
	    }
		
	});
	
	 $('.tab li').on("click",typeClickFun);
	//类型切换事件
	function typeClickFun(){
		$(this).addClass('active').siblings('li').removeClass('active');
		mySwiper2.slideTo($(this).index(), 500);//Swiper切换到指定slide。
		 $(".loadtip").html('上拉加载更多').show();
		$('.w').css('transform', 'translate3d(0px, 0px, 0px)')
		$('.swiper-container2 .swiper-slide-active').css('height','auto').siblings('.swiper-slide').css('height','0px');
		mySwiper.update();
	}

	
	  //初始化 “头条版”数据 
	    var type=getTypeFun(0);
	    $(".list-group").eq(mySwiper2.activeIndex).html("");
	    $.post(url+"/period/getSubData.do",{type:type,pageSize:pageSize,pageNo:1,qknum:qknum},function(data){
     	       var pl =data[0].data.list;//分页数据
     	       for(var i = 0; i <pl.length; i++) {
	                        $(".list-group").eq(mySwiper2.activeIndex)
	                           .append('<li class="list-group-item" data-id="'+pl[i].id+'">'
	                            +' <div class="qk-con-title" >'
	                            +'<div class="qk-left"><p>'+pl[i].title+'</p> </div>'
	                            +'  <div class="qk-right"><img alt="" src="'+pl[i].wzimage+'"> </div></div>'
	                            +'</li>');
	                   }
     	       qkinfodetileFun()
     	    mySwiper.update();
      });
	

});

/*获取数据方法*/
function getdatas(type,pageNo,pageSize){
	 /**
	  * type 类型
	  * pageNo当页码 1
	  * tatle总共有多少条
	  * pages 每页显示多少条
	  * return list
	  */
	  $.post(url+"/period/getSubData.do",{type:type,pageSize:pageSize,pageNo:pageNo},function(data){
     	   
     	   return data[0].data;
      });
 }

/*当前激活下标头条版 、资讯版 、分享版、综合版*/
function  getTypeFun(i){
	var typeStr="";
	if(i==0){
		typeStr='100';
	}else if(i==1){
		typeStr='200';
	}else if(i==2){
		typeStr='300';
	}else if(i==3){
		typeStr='400';
	}
	
	return typeStr;
}

//绑定单击期刊详细情况信息
function qkinfodetileFun(){
	$(".list-group-item").click(function(){
	     var id=$(this).attr("data-id");
	     window.location.href=url+"/period/articleInfo.do?id="+id;
	});
}
