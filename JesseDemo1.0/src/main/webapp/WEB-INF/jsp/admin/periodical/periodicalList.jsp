<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ page import="com.bdk.conmon.SystemCons" %> 
<style>
 .p_edit_dialog .inner{
   padding: 20px;
 }
</style>
 <head>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/h5/p_list.css">
  </head>
<!-- 总条数 -->
<input id="ptotal" type="hidden" value="${total}"/>
<!--当前页  -->
<input id="currPage" type="hidden" value="${currPage}"/>
  <table class="layui-table" lay-skin="line">
								  <colgroup>
								     <col >
								     <col >
								     <col>
								     <col >
								     <col>
								  </colgroup>
								  <thead>
								    <tr>
								        <th>序号</th>
										<th >期刊号</th>
										<th >期刊名称</th>
										<th >发布日期</th>
										<th>最新</th>
										<th>状态</th>
										<th >操作</th>
								    </tr> 
								  </thead>
								  <tbody>
								     <c:if test="${!empty periods}">  
					                    <c:forEach items="${periods}" var="period" varStatus="in">  
					                        <tr id="tr_${period.id}">  
					                            <td >${in.index+1}</td>  
					                            <td >${period.qknum}</td>  
					                            <td >${period.qkname}</td> 
					                            <td ><f:formatDate value="${period.releasetime}" type="date"/></td> 
					                            <td >${period.isnew=='Y'?'是':'否'}</td> 
					                             <td class=" ${period.isrelease=='Y'?'pc-qk-color-blue':'pc-qk-color-red'}" >${period.isrelease=='Y'?'已发布':'未发布'} </td> 
					                            <td >  
					                                   <div class="layui-btn-group">
					                                            <button name="qkPreview"
																	class="do-action layui-btn layui-btn-small qk_preview_btn" data-id="${period.id}" data-name="${period.qkname}" data-value="${period.qknum}" data-time="<f:formatDate value="${period.releasetime}" type="date"/>"><i class="layui-icon">&#xe60a;</i>预览期刊</button>
																	<button 
																	class="do-action layui-btn layui-btn-small <c:if test="${period.isrelease == 'N'}" >  qk_edit_btn </c:if> <c:if test="${period.isrelease == 'Y'}" > layui-btn-disabled</c:if>" data-id="${period.id}" data-name="${period.qkname}" data-value="${period.qknum}" data-isnew="${period.isnew}" data-time="<f:formatDate value="${period.releasetime}" type="date"/>"><i class="layui-icon">&#xe642;</i>编辑</button>
																   <button 
																	class="do-action layui-btn layui-btn-small <c:if test="${period.isrelease == 'N'}" > qk_release_btn  </c:if><c:if test="${period.isrelease == 'Y'}" > layui-btn-disabled</c:if>" data-id="${period.id}"><i class="layui-icon">&#xe605;</i>发布</button>
																	<button 
																	class="do-action layui-btn layui-btn-small layui-btn-normal <c:if test="${period.isrelease == 'Y'}">cannel_isrelease_btn</c:if>  <c:if test="${period.isrelease == 'N'}" > layui-btn-disabled</c:if>" data-id="${period.id}"><i class="layui-icon">&#x1006;</i>取消发布</button>
													   </div>
					                            </td> 
					                                
					                        </tr> 
					                        
					                                      
					                    </c:forEach>  
					                </c:if> 
								  </tbody>
</table> 

<!-- 修改期刊 -->
<div id="p_edit_dialog" class="p_edit_dialog" style="display: none;"  >
																	  <div class="inner" >
																	            <form id="qk_edit_Form" class="layui-form"  method="post">
																	             <input name="id" type="hidden" value=""  >
																								<div class="layui-form-item">
																								<label class="layui-form-label">期刊号:</label>
																								<div class="layui-input-block">
																									<input type="text" name="qknum" value="${period.qknum}" lay-verify="required|number" class="layui-input">
																								</div>
																								
																							</div>
																							<div class="layui-form-item">
																								<label class="layui-form-label">期刊名称：</label>
																								<div class="layui-input-block">
																									<input type="text" name="qkname" lay-verify="required" value="" class="layui-input">
																								</div>
																								
																							</div>
																						   <!-- <div class="layui-form-item">
																								<label class="layui-form-label">发行日期：</label>
																								<div class="layui-input-block">
																									<input type="text" name="releasetime" value="" class="layui-input">
																									 <input name="releasetime" lay-verify="required" class="layui-input" placeholder="自定义日期格式" value="" onclick="layui.laydate({elem: this, festival: true})">
																								</div>
																							</div> -->
																						    <div class="layui-form-item">
																							    <label class="layui-form-label">设为最新:</label>
																							    <div class="layui-input-block">
																							      <input type="checkbox" name="isnew"  lay-skin="switch"  lay-filter="isnew_checkbox"  lay-text="是|否" value="">
																							    </div>
																						    </div>
																							<div class="layui-form-item">
																								<div class="layui-input-block">
																									<button class="layui-btn" data-listurl="" lay-submit="" lay-filter="qk_edit_submit">确认提交</button>
																								</div>
																							</div>
													                         </form>  
																	  </div>
																	</div> 


