var url=$("#url").val();
var pageNo=2;
var pageSize=4;
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
				$(".init-loading").html('下拉刷新...').show();
			}else if(mySwiper.translate > 50 ){
				$(".init-loading").html('释放刷新...').show();
			}
		},
		onTouchEnd: function(swiper) {//回调函数，当释放slider时执行
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
                
                setTimeout(function() {
                	var view_msg="上拉加载更多...";
                    $.post(url+"/period/getQkData.do",{pageSize:pageSize,pageNo:pageNo},function(data){
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
	                  	        	 //格式化时间
	                  	    	   var da = pl[i].releasetime.time;
	                  	    	   var unixTimestamp = new Date(da) ;
	                  	    	   commonTime = unixTimestamp.toLocaleString();
	                  	    	 $(".qk_sub_table")
	                             .append(' <tr class="qk-tr" data-qknum='+pl[i].qknum+' ><td class="one_td"> <div class="c_box" > <span class="qk_title">第'+pl[i].qknum+'期</span>'
	                              +' </div>  </td>  <td class="two_td">'
	                              +' <h1>'+pl[i].qkname+'</h1>'
	                              //+'  <h2><span class="qk_icon">央行为P2P正名，P2P网贷步入正轨</span></h2>'
	                              +'  <h2><span class="qk_icon"></span><span class="qk_text" >'+(pl[i].actitle==""?"暂未发布内容":pl[i].actitle)+'</span></h2>'
	                              +' <p>'+commonTime+'</p>'
	                              +'</li>');
			                   }
	                  	      bindgetbyid();
	                  	    
                  	        }
                  	    mySwiper.update();
                   });
                    
                     $(".loadtip").html(view_msg);
                     mySwiper.update(); // 重新计算高度;
                }, 500);
            }
            
            // 下拉刷新
            if(mySwiper.translate >= 50) {
                $(".init-loading").html('正在刷新...').show();
                $(".loadtip").html('上拉加载更多');
                loadFlag = true;
                
                setTimeout(function() {
                    $(".refreshtip").show(0);
                    $(".init-loading").html('刷新成功！');
                    pageNo=2;
                    setTimeout(function(){
                    	$(".init-loading").html('').hide();
                    	   $.post(url+"/period/getQkData.do",{pageSize:pageSize,pageNo:1},function(data){
                    		   var pl =data[0].data.list;//分页数据
                    		   $(".qk_sub_table").html("");
   	                  	        for(var i = 0; i <pl.length; i++) {
   	                  	        	
   	                  	        	 //格式化时间
   	                  	    	   var da = pl[i].releasetime.time;
   	                  	    	   var unixTimestamp = new Date(da) ;
   	                  	    	   commonTime = unixTimestamp.toLocaleString();
   	                  	    	 $(".qk_sub_table")
   	                           .append(' <tr class="qk-tr" data-qknum='+pl[i].qknum+' ><td class="one_td"> <div class="c_box" > <span class="qk_title">第'+pl[i].qknum+'期</span>'
   	                            +' </div>  </td>  <td class="two_td">'
   	                            +' <h1>'+pl[i].qkname+'</h1>'
   	                            //+'  <h2><span class="qk_icon">央行为P2P正名，P2P网贷步入正轨</span></h2>'
   	                            +'  <h2><span class="qk_icon"></span><span class="qk_text" >'+(pl[i].actitle==""?"暂未发布内容":pl[i].actitle)+'</span></h2>'
   	                            +' <p>'+commonTime+'</p>'
   	                            +'</li>');
   			                   }
   	                  	      bindgetbyid();
   	                  	 $('.w').css('transform', 'translate3d(0px, 0px, 0px)')
                     	    mySwiper.update();
                      });
                    	
                    	
                    	
                    },500);
                    $(".loadtip").show(0);
                    //刷新操作
                    mySwiper.update(); // 重新计算高度;
                }, 600);
            }else if(mySwiper.translate >= 0 && mySwiper.translate < 50){
            	$(".init-loading").html('').hide();
            }
            return false;
		}
	});//swiper end
	
	   $.post(url+"/period/getQkData.do",{pageSize:pageSize,pageNo:1},function(data){
 	       var pl =data[0].data.list;//分页数据
 	    
 	      
 	    
 	      if(pl.length>0){
 	       for(var i = 0; i <pl.length; i++) {
 	    	 //格式化时间
 	    	   var da = pl[i].releasetime.time;
 	    	   var unixTimestamp = new Date(da) ;
 	    	   commonTime = unixTimestamp.toLocaleString();
 	    	   
                        $(".qk_sub_table")
                           .append(' <tr class="qk-tr" data-qknum='+pl[i].qknum+' ><td class="one_td"> <div class="c_box" > <span class="qk_title">第'+pl[i].qknum+'期</span>'
                            +' </div>  </td>  <td class="two_td">'
                            +' <h1>'+pl[i].qkname+'</h1>'
                            //+'  <h2><span class="qk_icon">央行为P2P正名，P2P网贷步入正轨</span></h2>'
                            +'  <h2><span class="qk_icon"></span><span class="qk_text" >'+(pl[i].actitle==""?"暂未发布内容":pl[i].actitle)+'</span></h2>'
                            +' <p>'+commonTime+'</p>'
                            +'</li>');
                   }
 	      bindgetbyid();
 	      }
 	    mySwiper.update();
  });
});

function bindgetbyid(){
	  $(".qk-tr").click(function(){
     	  var qknum=$(this).attr("data-qknum");
     	  window.location.href=url+"/period/qkList.do?qknum="+qknum;
     	  
      });
}
Date.prototype.toLocaleString = function() {
    return this.getFullYear() + "-" + (this.getMonth() + 1) + "-" + this.getDate();
};
