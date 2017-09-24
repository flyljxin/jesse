package com.bdk.utill;

import java.util.List;

import com.alibaba.fastjson.JSON;

/**
 * ClassName: JsonHelper 
 * @Description: JSON串处理 , 此类不做字符串空判断，只负责转换 ， 判断需要在业务方法中处理好
 * @author 汪品文
 * @date 2016年9月19日上午11:35:34
 */
public class JsonHelper {
	
	/**
	 * 转换对象到json字符串
	 * @Description: TODO
	 * @param object
	 * @return
	 * @author 汪品文
	 * @date 2016年9月19日上午11:36:54
	 * @version:1.0.0
	 */
	public static String fromObject(Object object) {
		return JSON.toJSONString(object);//Object.fromObject(object).toString();
	}
	/**
	 * 转换list到json字符串
	 * @Description: TODO
	 * @param object
	 * @return
	 * @author 汪品文
	 * @date 2016年9月19日上午11:36:54
	 * @version:1.0.0
	 */
	public static String fromArray(Object object) {
		return JSON.toJSONString(object);
	}
	
	/**
	 * 将json字符串解析成对象
	 * @Description: TODO
	 * @param object
	 * @param beanClass
	 * @return
	 * @author 汪品文
	 * @date 2016年9月20日下午9:26:53
	 * @version:1.0.0
	 */
	@SuppressWarnings("unchecked")
	public static <T> T toBean(String jsonStr, Class<T> beanClass) {
//		JSONObject jsonObject = JSONObject.fromObject(jsonStr);
//		return (T) JSONObject.toBean(jsonObject, beanClass);
		return JSON.parseObject(jsonStr, beanClass);
	}
	
	/**
	 * @Description: json数组转换成对应的对象
	 * @param jsonStr	"[{key:aa,value:aa},{key:aa,value:aa}]"
	 * @param beanClass
	 * @return
	 * @author 汪品文
	 * @date 2016年9月22日上午11:27:33
	 * @version:1.0.0
	 */
	@SuppressWarnings("unchecked")
	public static <T> List<T> toList( String jsonStr , Class<T> beanClass ) {
//		JSONArray jSONArray  = JSONArray.fromObject(jsonStr);
//		return (List<T>)JSONArray.toCollection(jSONArray,beanClass);  
		return JSON.parseArray(jsonStr, beanClass);
	}
	
	
	
}
