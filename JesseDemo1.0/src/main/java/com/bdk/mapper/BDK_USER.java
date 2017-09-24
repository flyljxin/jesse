package com.bdk.mapper;

public enum BDK_USER {
	 /**
     * 奔达康集团
     */
	BDKJT("奔达康集团"),
	BDKJR("奔达康金融"),
	BDKDQ("奔达康电气"),
	XGLLWHGS("心感力量文化传播有限公司");

    protected final String chineseName;

    private BDK_USER(String chineseName){
        this.chineseName = chineseName;
    }
    /**
     * 获取中文名称
     */
    public String getChineseName() {
        return chineseName;
    }
    /**
     * 解析字符串
     */
    public static final BDK_USER parse(String value) {
        if(null == value || value.equals("")){
            return null;
        }
        try{
            return BDK_USER.valueOf(value);
        }catch(Throwable t){
            return null;
        }
    }
}