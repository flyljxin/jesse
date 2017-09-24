package com.bdk.utill;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.codec.digest.UnixCrypt;
import org.apache.commons.lang3.StringUtils;

/**
 * ClassName: StringHelper
 * 
 * @Description: 字符串处理类
 * @author 汪品文
 * @date 2016年8月11日下午2:39:05
 */
public class StringHelper extends StringUtils {
	/**
	 * ${SYSTEM.SITE_DOMAIN}  截取${}值的正则表达式
	 */
	public static final Pattern REPLACE_VARIABLE_PATTERN = Pattern.compile("\\$\\{\\s*(\\w|\\.|-|_|\\$)+\\s*\\}", Pattern.CASE_INSENSITIVE);
	public static final Pattern REPLACE_URL_PATTERN = Pattern.compile("\\d+/\\d+/\\d+/\\d+/\\d+(\\.\\w+)?", Pattern.CASE_INSENSITIVE);

	private static final int[] WEIGHT = { 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 };
	private static final char CHECK_CODE[] = { '1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2' };
	private static final byte[] ROW_BYTES = "80e36e39f34e678c".getBytes();

	/**
	 * @Description: 判断字符串是否为空 "" "  " null
	 * @param str
	 * @return 空则返回true
	 * @throws
	 * @author 汪品文
	 * @date 2016年8月11日下午2:50:01
	 * @version:1.0.0
	 */
	public static boolean isEmpty(String str) {
		return str == null || str.trim().equals("");
	}

	/**
	 * @Description: 验证手机号是否正确
	 * @param mobile
	 *            手机号码
	 * @return
	 * @throws
	 * @author 汪品文
	 * @date 2016年8月11日下午2:50:37
	 * @version:1.0.0
	 */
	public static boolean checkMobile(String mobile) {
		if (isEmpty(mobile)) {
			return false;
		}
		Pattern pattern = Pattern.compile("^((1[3-9][0-9]))\\d{8}$");
		Matcher matcher = pattern.matcher(mobile);
		return matcher.matches();
	}

	/**
	 * 验证邮箱地址是否正确
	 * 
	 * @Description: TODO
	 * @param email
	 * @return
	 * @author 叶威龙
	 * @date 2016年9月26日上午11:31:09
	 * @version:1.0.0
	 */
	public static boolean checkEmail(String email) {
		if (isEmpty(email)) {
			return false;
		}
		Pattern pattern = Pattern.compile("\\w+(\\.\\w)*@\\w+(\\.\\w{2,3}){1,3}");
		Matcher matcher = pattern.matcher(email);
		return matcher.matches();

	}

	/**
	 * 验证真实姓名格式
	 * 
	 * @Description: TODO
	 * @param realName
	 * @return
	 * @author 叶威龙
	 * @date 2016年10月11日上午10:43:36
	 * @version:1.0.0
	 */
	public static boolean checkRealName(String realName) {
		Pattern pattern = Pattern.compile("^[\u4e00-\u9fa5]{2,20}$");
		Matcher matcher = pattern.matcher(realName);
		return matcher.matches();
	}

	/**
	 * 验证身份证号码格式
	 * 
	 * @Description: TODO
	 * @param idCardNum
	 * @return
	 * @author 叶威龙
	 * @date 2016年10月11日上午10:49:34
	 * @version:1.0.0
	 */
	public static boolean checkIdCardNum(String idCardNum) {
		if (StringHelper.isEmpty(idCardNum) || idCardNum.length() != 18) {
			return false;
		}

		int sum = 0;
		int num;
		for (int index = 0; index < 17; index++) {
			num = idCardNum.charAt(index) - '0';
			if (num < 0 || num > 9) {
				return false;
			}
			sum += num * WEIGHT[index];
		}
		return CHECK_CODE[sum % 11] == Character.toUpperCase(idCardNum.charAt(17));
	}
	
	/**
	 * 加密字符串
	 * 包含身份证号码，银行卡号等
	 * @Description: TODO
	 * @param content
	 * @return
	 * @throws Throwable
	 * @author 叶威龙
	 * @date 2016年10月12日下午4:40:31
	 * @version:1.0.0
	 */
	public static String encode(String content){
		try {
			if (isEmpty(content)) {
				return content;
			}
			Cipher cipher = Cipher.getInstance("AES");
			SecretKeySpec keySpec = new SecretKeySpec(ROW_BYTES, "AES");
			cipher.init(1, keySpec);
			byte[] ciphertext = cipher.doFinal(content.getBytes());
			return Base64.encodeBase64String(ciphertext);
		} catch (Exception e) {
			e.printStackTrace();
			return content;
		}
	}
	/**
	 * @Description: 解密字符串  包含身份证号码，银行卡号等
	 * @param content
	 * @return
	 * @author 汪品文
	 * @date 2017年4月18日下午5:39:52
	 * @version:1.0.0
	 */
	public static String decode(String content){
		try {
			if (isEmpty(content)) {
				return content;
			} else {
				Cipher cipher = Cipher.getInstance("AES");
				SecretKeySpec keySpec = new SecretKeySpec(ROW_BYTES, "AES");
				cipher.init(2, keySpec);
				byte ciphertext[] = cipher.doFinal(Base64.decodeBase64(content));
				return new String(ciphertext);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return content;
		}
	}
	/**
	 * 
	 * @Title: checkUserName
	 * @author sulong
	 * @Description: 检查用户名是否正确6-18个字符，可使用字母、数字、下划线，需以字母开头
	 * @param @param userName
	 * @param @return 参数
	 * @return boolean 返回类型
	 * @throws
	 */
	public static boolean checkUserName(String userName) {
		if (StringHelper.isEmpty(userName)) {
			return false;
		}
		Pattern pattern = Pattern.compile("^[a-zA-Z]\\w{6,18}$");
		Matcher matcher = pattern.matcher(userName);
		return matcher.matches();
	}
	
	public static String truncation(String string, int maxLength) {
		if (isEmpty(string))
			return "";
		try {
			StringBuilder out = new StringBuilder();
			truncation(((Appendable) (out)), string, maxLength, null);
			return out.toString();
		} catch (IOException e) {
			return "";
		}
	}
	
	public static void truncation(Appendable out, String string, int maxLength,
			String replace) throws IOException {
		if (isEmpty(string) || maxLength <= 0)
			return;
		if (isEmpty(replace))
			replace = "...";
		int index = 0;
		for (int end = Math.min(string.length(), maxLength); index < end; index++)
			out.append(string.charAt(index));

		if (string.length() > maxLength)
			out.append(replace);
	}
	
	public static void filterHTML(Appendable writer, String str)
			throws IOException {
		if (isEmpty(str))
			return;
		for (int i = 0; i < str.length(); i++) {
			char ch = str.charAt(i);
			if (Character.isISOControl(ch))
				continue;
			switch (ch) {
			case 34: // '"'
			case 38: // '&'
			case 39: // '\''
			case 60: // '<'
			case 62: // '>'
				writer.append("&#");
				writer.append(Integer.toString(ch));
				writer.append(';');
				break;

			default:
				writer.append(ch);
				break;
			}
		}

	}
	
	
	/**
	 * @Description: 校验银行卡卡号
	 * @param cardId
	 * @return true 卡号正确
	 * @author 汪品文
	 * @date 2016年12月26日上午9:04:18
	 * @version:1.0.0
	 */
	public static boolean checkBankCard(String cardId) {
		if (cardId.trim().length() < 16) {
			return false;
		}
		char bit = getBankCardCheckCode(cardId
				.substring(0, cardId.length() - 1));
		if (bit == 'N') {
			return false;
		}
		return cardId.charAt(cardId.length() - 1) == bit;
	}
	/**
	 * @Description: 从不含校验位的银行卡卡号采用 Luhm 校验算法获得校验位
	 * @param nonCheckCodeCardId
	 * @return
	 * @author 汪品文
	 * @date 2016年12月26日上午9:04:10
	 * @version:1.0.0
	 */
	private static char getBankCardCheckCode(String nonCheckCodeCardId) {
		if (nonCheckCodeCardId == null
				|| nonCheckCodeCardId.trim().length() == 0
				|| !nonCheckCodeCardId.matches("\\d+")) {
			// 如果传的不是数据返回N
			return 'N';
		}
		char[] chs = nonCheckCodeCardId.trim().toCharArray();
		int luhmSum = 0;
		for (int i = chs.length - 1, j = 0; i >= 0; i--, j++) {
			int k = chs[i] - '0';
			if (j % 2 == 0) {
				k *= 2;
				k = k / 10 + k % 10;
			}
			luhmSum += k;
		}
		return (luhmSum % 10 == 0) ? '0' : (char) ((10 - luhmSum % 10) + '0');
	}
	
	/**
	 * @Description: 获取银行卡号的摘要
	 * @param bankNum
	 * @return
	 * @author 汪品文
	 * @date 2017年2月6日下午4:48:31
	 * @version:1.0.0
	 */
	public static String getBankNoBreviary( String bankNum ) {
		if( isEmpty( bankNum )){
			return null;
		}
		StringBuilder sb =  new StringBuilder();
    	sb.append(bankNum.substring(0,3));
    	sb.append("*************");
    	sb.append(bankNum.substring(bankNum.length()-4,bankNum.length()));
    	return sb.toString();
	}
	/**
	 * @Description: 手机号缩略
	 * @param phone
	 * @return
	 * @author 汪品文
	 * @date 2017年4月18日下午4:41:35
	 * @version:1.0.0
	 */
	public static String getPhoneBreviary( String phone ) {
		if( isEmpty(phone)){
			return null;
		}
    	StringBuilder sb =  new StringBuilder();
    	sb.append(phone.substring(0,3));
    	sb.append("****");
    	sb.append(phone.substring(phone.length()-4,phone.length()));
    	return sb.toString();
	}
	/**
	 * @Description: 用户名缩略
	 * @param userName
	 * @return
	 * @author 汪品文
	 * @date 2017年4月18日下午4:56:04
	 * @version:1.0.0
	 */
	public static String getUserNameBreviary( String userName ) {
		if( isEmpty(userName)){
			return null;
		}
		if( userName.length() <= 4 ){
			return userName;
		}
    	StringBuilder sb =  new StringBuilder();
    	sb.append(userName.substring(0,4));
    	sb.append("***");
    	return sb.toString();
	}
	/**
	 * @Description: 真实姓名缩略
	 * @param realName
	 * @return
	 * @author 汪品文
	 * @date 2017年4月18日下午5:07:44
	 * @version:1.0.0
	 */
	public static String getRealNameBreviary( String realName ){
		if( isEmpty(realName)){
			return null;
		}
		if( realName.length() <= 1 ){
			return realName;
		}
		StringBuilder sb =  new StringBuilder();
    	sb.append(realName.substring(0,1));
    	for( int j = 1 ; j < realName.length() ; j++ ){
    		sb.append("*");
    	}
    	return sb.toString();
	}
	
	
	
	/**
	 * @description: 生成验证码（六位数字）  
	 * @fileName: @return
	 * @createTime: 2017年2月22日
	 * @author: Wu Jingde
	 * @version 1.0.0
	 */
	public static String getSmsCode(){
	 	//return (Math.random() * 1000000)+"";
		return "000000";
	}
	
	/**
     * 
     * generateUUID 生成32位的UUID
     * 
     * @return
     */
    public static final String GenerateUUID(){
        UUID uuid = UUID.randomUUID();
        String uuidStr = uuid.toString();
        uuidStr = uuidStr.replaceAll("-", "");
        return uuidStr;
    }
    
    /**
     * 密码加密方法
     * @Description: TODO
     * @param pwd 密码
     * @return
     * @author 洪秋霞
     * @date 2017年3月28日上午9:20:43
     * @version:1.0.0
     */
    public static String encodPayPwd(String pwd){
    	return UnixCrypt.crypt(pwd,DigestUtils.sha256Hex(pwd));
    }
    
	public static void main(String[] args){
	}
	
	/**
	* 字符串转换成日期
	* @param str
	* @return date
	*/
	public static Date StrToDate(String str) throws Exception{
	   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   Date date = format.parse(str);
	   return date;
	}
	
	public static String dateToString(Date time){ 
	    SimpleDateFormat formatter; 
	    formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss"); 
	    String ctime = formatter.format(time); 
	    return ctime; 
	}
}
