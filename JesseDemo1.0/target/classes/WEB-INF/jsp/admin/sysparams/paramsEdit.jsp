<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  

<!--1、首页修改弹窗 -->
<div id="qk-index-dialog" class="dialog" style="display: none;" >
  <div class="inner">
   <form id="params_edit_form" class="layui-form"  method="post">
		<div class="wrap-main params-edit-left">
				       <section class="wrapper params-index">
				               <article class="content">
							   <section class="inner">
								     <div class="img-container"><!--固定图片尺寸超出部分隐藏-->
						                 <img name="indexImg"  class="c_img " alt="" src="/upload/">
						             </div> 
									<aside class="c_bootom" >
									    <button id="yaolingbtn" class="btn one" onclick="javascript:return false;" >
									       <input type="text" name="title"  autocomplete="off" placeholder="请输入标题" value="" class="layui-input">
									     </button>
									    <button id="hunyingbtn" class="btn two" onclick="javascript:return false;">
									       <input type="text" name="title"  autocomplete="off" placeholder="请输入标题" value="" class="layui-input" />
									    
									    </button>
									</aside>
								</section>
							</article>
				      </section> 
				      <footer class="params-footer">
		                  <img name="bottomImg" class="c_img" alt="" src="/upload/">	
		                  <p> <input type="text" name="title"  autocomplete="off" placeholder="请输入标题" value="" class="layui-input" /> </p>
		              </footer>
		</div> 
		
		<div class="params-edit-right">
		     <div class="params-edit-right-main">   
			       <div class="inner">
				       <div class="params-edit-indexImg"> <input type="file" name="file" class="layui-upload-file" lay-title="更改首页图片" id="indeximg"> </div>
				       <div class="params-edit-bottomImg"><input type="file" name="file" class="layui-upload-file" lay-title="更改底部logo" id="bottomimg"> </div>
				       <button class="layui-btn params-edit-btn">修改</button> 
			      </div>
		      </div>
		   <!--    <button class="layui-btn">更改首页图片</button>
		      <button class="layui-btn">更改底部logo</button> -->
		</div>
		</form>  
	</div>
</div>