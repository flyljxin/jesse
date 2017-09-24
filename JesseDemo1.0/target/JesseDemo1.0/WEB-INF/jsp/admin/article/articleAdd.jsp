  <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
  <%@ page import="com.bdk.conmon.SystemCons" %>
<style>
  .img-yulan-wape img{
    width: 174px;
    height: 120px;
  }
  
.img-yulan-wape div{
    overflow: hidden;
    position: absolute;
    top: -61px;
  }
</style>
    <form id="article_add_form" class="layui-form"  method="post">
    
    								  <div class="layui-form-item">
										   <label class="layui-form-label">所属期刊：</label>
										   <div class="layui-input-inline">
										     <select name="qkid" lay-filter="qktype"  lay-search>
										           <option value="">带搜索的选择框</option>
										           <c:forEach items="${periodList}" var="art" varStatus="ist"> 
										              <option value="${art.id}" data-name="${art.qkname}" data-number="${art.qknum}"   >第${art.qknum}期--${art.qkname}-(${art.isrelease=='Y'?'已发布':'未发布'})</option>
										            </c:forEach>  
										     </select>
										     <input name="qkChinaName" type="hidden"  value=""> <!--期刊中文名 -->
										     <input name="qknum" type="hidden"value=""> <!--期刊编号-->
										   </div>
										   
										   <!--  <input id="qkid" name="qkid" type="hidden" value="" class="layui-input"/> -->
											<label class="layui-form-label">文章标题：</label>
											<div class="layui-input-inline">
												<input type="text" name="title" value=""  class="layui-input" maxlength="100">
											</div>
										 </div>
										<div class="layui-form-item">
										   <label class="layui-form-label">版块：</label>
										   <div class="layui-input-inline">
										     <select name="type" lay-filter="bktype" >
										         <option value="">请选择</option>
										          <c:forEach items="${pertypes}" var="pt" varStatus="pti"> 
										               <option  value="${pt.code}" >${pt.type}</option>
										            </c:forEach>  
										     </select>
										      <input name="bkChinaName" type="hidden"  value="">
										   </div>
										   
										   <label class="layui-form-label">文章主图：</label>
											<div class="layui-input-inline">
											    <input type="hidden" name="wzimage" value="" data-code="" >
											    <input type="file" name="file" class="layui-upload-file"  >
											</div>
											<div class="layui-form-mid layui-word-aux">请上传规定尺寸宽174(px)高120(px)像素</div>
											<div class="layui-input-inline img-yulan-wape">
											    <div>
											       <img   alt="图片预览" src="">
											    </div>
											</div>
										 </div>
									    <div class="layui-form-item layui-form-text" style="margin-top:30px; ">
										    <label class="layui-form-label">文章内容:</label>
										    <div class="layui-input-block">
										      <textarea class="layui-textarea layui-hide" name="wzinfo"  id="article_add_editor" ></textarea>
										    </div>
										  </div>
									    
										<div class="layui-form-item">
											 <div class="layui-input-block">
											     <button class="layui-btn" lay-submit="" lay-filter="article_return_yulan">预览</button> 
									             <button class="layui-btn" lay-submit="" lay-filter="article_return_save">保存</button>
									             <button name="article_return_clear"  class="layui-btn layui-btn-primary" onclick="javascript:return false;" >重置</button>
									          </div>
										</div>
</form>   


        <!--保存预览的弹窗-->
        
<div id="view">

</div> 
 
 <script id="artic_view_phone_temp"   type="text/html">
  <div id="artic_view_phone" class="dialog" style="display: none;" >
	<div class="art-header">
	  <div class="inner">
			<table lay-even lay-skin="nob">
			   <tr>
			       <td class="left">
			          <img  class="c_img" src="/upload/<%=SystemCons.getSysimgs().getSys_logo()%>">
			       </td>
			       <td class="rigth">
			                  <span class="first" ></span>
			              <span class="one">第{{ d.qknum }}期</span>
			              <span class="two">
			                 <%-- <f:formatDate value="${article.releasetime}" type="date"/> --%>{{d.qktime}}
			              </span>
			          </td>
			   </tr>
			</table>
		</div>
	</div>
	<div class="section art-content">
	      <div class="inner">
	          <h1>{{d.title}}</h1>
	          <h2><span class="one">{{d.qkname}}[{{d.type}}]</span><span class="two">{{d.qktime1}}</span></h2>
	      </div>
	</div>
	<div class="section art-p">
	          {{d.wzinfo}}
	</div>
	<div class="section art-footer">
	     <div class="inner">
				<img class="c_img" alt="" src="/upload/<%=SystemCons.getSysimgs().getSydb_logo()%>">	
                 <p><%=SystemCons.sysparams.getSydb_bqwz()%></p>
	     </div>
	</div>
</div>

</script>   