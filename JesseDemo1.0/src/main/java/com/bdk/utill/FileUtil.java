package com.bdk.utill;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
	 /** 
	   * 保存文件 
	   * @param file 
	   * @return 
	   */
	  public String saveFile(HttpServletRequest request, MultipartFile file)throws Exception { 
	    // 判断文件是否为空 
	    if (!file.isEmpty()) { 
	      try { 
	    	//图片存放目录  
	    	String imagePath =  request.getSession().getServletContext().getInitParameter("upload.home");
	    	
	    	String tstString=request.getSession().getServletContext().getRealPath("/upload");
	    	
	    	/*File f = new File(imagePath);
	    	if(!f.exists()){
	    		f.mkdir();
	    	}*/
	    	File f = new File(tstString);
	    	if(!f.exists()){
	    		f.mkdir();
	    	}
	    	
	        // 文件保存路径 
	        String ftype = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."),file.getOriginalFilename().length());//文件类型 （jpg、png等）
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	    	String fileName = sdf.format(new Date()) + ftype;
	    	//String filePath = imagePath + fileName;
	    	String filePath = tstString+"\\" + fileName;
	    	
	        // 转存文件 
	        file.transferTo(new File(filePath)); 
	        return fileName; 
	      } catch (Exception e) { 
	        e.printStackTrace(); 
	        throw new Exception("上传图片失败");
	      } 
	    } 
	    return ""; 
	  } 
}
