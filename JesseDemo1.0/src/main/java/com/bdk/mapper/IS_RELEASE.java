package com.bdk.mapper;

import com.bdk.utill.StringHelper;

/**
 * 是否已发布
 * @Description:
 * @return
 * @author Wu Jingde
 * @date 2017年5月19日下午2:43:49
 * @version:1.0.0
 */
public enum IS_RELEASE {
	

    /** 
     * 是
     */
    Y("是"),

    /** 
     * 否
     */
    N("否");

    protected final String chineseName;

    private IS_RELEASE(String chineseName){
        this.chineseName = chineseName;
    }
    /**
     * 获取中文名称.
     * 
     * @return {@link String}
     */
    public String getChineseName() {
        return chineseName;
    }
    /**
     * 解析字符串.
     * @return {@link T6230_F11}
     */
    public static final IS_RELEASE parse(String value) {
        if(StringHelper.isEmpty(value)){
            return null;
        }
        try{
            return IS_RELEASE.valueOf(value);
        }catch(Throwable t){
            return null;
        }
    }

}
