<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<form id="inputForm" class="layui-form"  method="post">
										<div class="layui-form-item">
											<label class="layui-form-label">期刊号:</label>
											<div class="layui-input-inline">
												<input type="text" name="qknum" value="" lay-verify="qknumber" class="layui-input" >
											</div>
											<!-- div class="layui-form-mid layui-word-aux">请输入数字格式为：模块:功能:权限（例如：sys:user:view）</div> -->
										</div>
										<div class="layui-form-item">
											<label class="layui-form-label">期刊名称：</label>
											<div class="layui-input-inline">
												<input type="text" name="qkname" lay-verify="required" value="" class="layui-input">
											</div>
											<!-- <div class="layui-form-mid layui-word-aux">请输入数字格式为：模块:功能:权限（例如：sys:user:view）</div> -->
										</div>
<!-- 									   <div class="layui-form-item">
											<label class="layui-form-label">发行日期：</label>
											<div class="layui-input-inline">
												<input type="text" name="releasetime" value="" class="layui-input">
												 <input name="releasetime" lay-verify="required" class="layui-input" placeholder="自定义日期格式" onclick="layui.laydate({elem: this, festival: true})">
											</div>
											<div class="layui-form-mid layui-word-aux">请输入数字格式为：模块:功能:权限（例如：sys:user:view）</div>
										</div> -->
									    <div class="layui-form-item">
										    <label class="layui-form-label">设为最新:</label>
										    <div class="layui-input-block">
										      <input type="checkbox" name="isnew"  lay-skin="switch" lay-text="是|否" value="Y">
										    </div>
									    </div>
										<div class="layui-form-item">
											<div class="layui-input-block">
												<button class="layui-btn" data-listurl="" lay-submit="" lay-filter="add_submit">确认提交</button>
											</div>
										</div>
</form>  


