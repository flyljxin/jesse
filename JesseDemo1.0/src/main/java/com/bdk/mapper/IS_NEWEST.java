package com.bdk.mapper;

import com.bdk.utill.StringHelper;

/**
 * 是否设为最新
 * ClassName: IS_NEWEST 
 * @Description: 
 * @author ChenQuan
 * @date 2017年5月11日上午8:54:07
 */
public enum IS_NEWEST {
	

    /** 
     * 是
     */
    Y("是"),

    /** 
     * 否
     */
    N("否");

    protected final String chineseName;

    private IS_NEWEST(String chineseName){
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
    public static final IS_NEWEST parse(String value) {
        if(StringHelper.isEmpty(value)){
            return null;
        }
        try{
            return IS_NEWEST.valueOf(value);
        }catch(Throwable t){
            return null;
        }
    }

}
