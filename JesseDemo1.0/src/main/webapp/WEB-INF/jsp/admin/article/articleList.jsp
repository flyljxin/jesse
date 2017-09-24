<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<form id="article_form" action="${pageContext.request.contextPath}/article/artices.do" class="layui-form layui-form-pane search-form">
	                         <input id="currPage" type="hidden" name="currPage" value="${currPage}">
						      <input  type="hidden" name="pageNums" value="${pageNums}">
				               <div class="layui-form-item">
				                            

				                            <div class="layui-inline">
											      <label class="layui-form-label">剘刊号</label>
											      <div class="layui-input-inline">
											        <input  type="text" name="qknum" value="${article.qknum}"   autocomplete="off" placeholder="请输入剘刊号搜索" maxlength="8" class="layui-input">
											      </div>
											      
									      </div>
									       <div class="layui-inline">
											      <label class="layui-form-label">文章标题</label>
											      <div class="layui-input-inline">
											        <input type="text" name="title" value="${article.title}"  autocomplete="off" placeholder="请输入标题搜索" class="layui-input">
											      </div>
									      </div>
									       <div class="layui-inline">
									      <label class="layui-form-label">所属版块</label>
									      <div class="layui-input-block" style="width: 150px;">
									        <select name="type" >
											  <option value="">请选择</option>
											  <c:forEach items="${pertypes}" var="pt" varStatus="pti"> 
										      	<option <c:if test="${article.type == pt.code}">selected="selected"</c:if> value="${pt.code}" >${pt.type}</option>
										      </c:forEach>
											</select> 
									      </div>
									    </div>
										<!-- 	<div class="layui-inline">
									      <label class="layui-form-label">文章内容</label>
									       <div class="layui-input-inline">
											        <input type="text" name="number" autocomplete="off" placeholder="请输入内容搜索" class="layui-input">
										</div>
									    </div>
									      
									   <div class="layui-inline">
									      <label class="layui-form-label">录入日期</label>
									      <div class="layui-input-block">
									        <input type="text" name="date" id="date" autocomplete="off" placeholder="请输入时间搜索" class="layui-input" onclick="layui.laydate({elem: this})">
									      </div>
									    </div> -->
									  <button class="layui-btn" lay-submit="" lay-filter="articleSearchBtn"><i class="layui-icon">&#xe615;</i>搜索</button>
									  <button  name="resetBtn" class="layui-btn layui-btn-primary" onclick="javascript:return false;"><i class="layui-icon">&#xe639;</i>重置</button>
									   <button name="qkAllDel" class="layui-btn layui-btn-danger"  onclick="javascript:return false;" ><i class="layui-icon">&#xe640;</i>批量删除</button>
									   <button name="qkreload" class="layui-btn"  onclick="javascript:return false;" ><i class="layui-icon">&#x1002;</i>刷新</button>
									  </div>
			</form>
			 
			<table class="layui-table" lay-skin="line">
								  <colgroup>
								     <col width="50">
								        <col >
								           <col >
								              <col >
								     <col >
								     <col >
								     <col>
								     <col >
								     <col>
								  </colgroup>
								  <thead>
								    <tr>
								        <th> 
								            <div  class="layui-form"> 
								              <input type="checkbox" lay-filter="allcheck"   name="allcheck" lay-skin="primary"  >
  											</div>
  										</th>
										<th >序号</th>
										<th >期刊号</th>
										<th >文章标题</th>
										<th>版块</th>
										<th >主图片</th>
										<th >文章内容</th>
										<th >录入日期</th>
										<th>状态</th>
										<th >操作</th>
								    </tr> 
								  </thead>
								  <tbody>
								  <c:if test="${!empty artices}">  
					                    <c:forEach items="${artices}"  var="a" varStatus="st"> 
					                        <tr id="tr_${a.id}"> 
					                            <td> 
					                              <div  class="layui-form"> 
								                     <input type="checkbox" name="qkCheckbox" data-id="${a.id}"  lay-filter="onelyCheck" lay-skin="primary"  >
  											      </div>
  											    </td>
					                            <td >${st.index+1}</td>  
					                            <td >${a.qknum}</td> 
					                            <td >
						                            <c:if test="${fn:length(a.title)>10 }">${ fn:substring( a.title,0,10)} ...</c:if>
						                            <c:if test="${fn:length(a.title)<=10 }">${a.title}</c:if>
					                            </td> 
					                            <td >${a.typename}</td> 
					                            <td ><img src="${a.wzimage}" width="30" /></td> 
					                            <td  >
					                                  ${a.wzinfo}
					                            </td> 
					                            <td ><fmt:formatDate value="${a.writetime}" type="both" /></td> 
					                            <td class=" ${a.isrelease=='Y'?'pc-qk-color-blue':'pc-qk-color-red'}" >${a.isrelease=='Y'?'已发布':'未发布'}</td>
					                            <td >  
					                                   <div class="layui-btn-group">
					                                             <button 
																	class="article_look_btn do-action layui-btn layui-btn-small" data-id="${a.id}"><i class="layui-icon">&#xe60a;</i>预览</button>
																	<%--  <button 
																	class="article_look_btn do-action layui-btn layui-btn-small" data-id="${a.id}">详细内容</button> --%>
																 <button 
																	class=" ${a.isrelease=='Y'?'layui-btn-disabled':'article_edit_btn'}   do-action layui-btn layui-btn-small" data-id="${a.id}" ><i class="layui-icon">&#xe642;</i>编辑</button>
																 <button 
																	class="${a.isrelease=='Y'?'layui-btn-disabled':'article_del_btn'}   do-action layui-btn layui-btn-small " data-id="${a.id}"><i class="layui-icon">&#xe640;</i>删除</button>
															</div>
					                            </td>  
					                        </tr>    
					                    </c:forEach>  
					                </c:if>            
								  </tbody>
                                 </table>    
								<div id="layer-Pages"></div><!--导航条 -->
