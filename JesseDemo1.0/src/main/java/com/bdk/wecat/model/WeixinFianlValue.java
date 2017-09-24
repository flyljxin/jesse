package com.bdk.wecat.model;

/**
 * 微信最终值
 * @author Administrator
 *
 */
public class WeixinFianlValue {
	public final static String APPID = "wxbbfd0da70f25259e";//微信号 开发者ID
	public final static String APPSECRET = "b53036d002f86e6b80daeb2a0c60dcaf";//开发者密码(AppSecret)
	public final static String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
	public final static String MENU_ADD = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";
	public final static String ACCESS_TICKET_URL="https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi";
	public final static String MSG_TEXT_TYPE = "text";
	public final static String MSG_IMAGE_TYPE = "image";
	public final static String MSG_VOICE_TYPE = "voice";
	public final static String MSG_VIDEO_TYPE = "video";
	public final static String MSG_SHORTVIDEO_TYPE = "shortvideo";
	public final static String MSG_LOCATION_TYPE = "location";
	public final static String MSG_EVENT_TYPE = "event";
	
	public final static String POST_MEDIA="https://api.weixin.qq.com/cgi-bin/media/upload?access_token=ACCESS_TOKEN&type=TYPE";
	public final static String GET_MEDIA="https://api.weixin.qq.com/cgi-bin/media/get?access_token=ACCESS_TOKEN&media_id=MEDIA_ID";
}
