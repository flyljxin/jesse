package com.bdk.conmon;

/**
 * 
 * @ClassName: ResultVo
 * @Description: 返回参数封装类
 * @author chenquan
 * @date 2016年9月27日 下午2:33:12
 * @param <T>
 */
public class ResultEntity<T> implements java.io.Serializable {

	private static final long serialVersionUID = 4478830929134100215L;
	
	private String code = "100"; // 默认为成功

	private String errorMsg; // 错误时候返回

	private T data;

	public ResultEntity() {
	}

	public ResultEntity(T data) {
		this.data = data;
	}

	public ResultEntity(String code, String errorMsg) {
		this.code = code;
		this.errorMsg = errorMsg;
	}

	public ResultEntity(String code, String errorMsg, T data) {
		this.code = code;
		this.errorMsg = errorMsg;
		this.data = data;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
}
