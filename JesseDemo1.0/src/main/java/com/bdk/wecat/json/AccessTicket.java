package com.bdk.wecat.json;

//返回票据信息
public class AccessTicket {  
	//成功返回的信息{"errcode":0,"errmsg":"ok","ticket":"kgt8ON7yVITDhtdwci0qeRQk3byN3z89YoSHz_mzqa7Uj0-RqKopNPaCi19wuARRx1H8_HSwQhDs_SaAQEdDQg","expires_in":7200}
    private int errcode;  
    private String errmsg;  
    private String ticket;  
    private String expires_in;  
    public int getErrcode() {  
        return errcode;  
    }  
    public void setErrcode(int errcode) {  
        this.errcode = errcode;  
    }  
    public String getErrmsg() {  
        return errmsg;  
    }  
    public void setErrmsg(String errmsg) {  
        this.errmsg = errmsg;  
    }  
    public String getTicket() {  
        return ticket;  
    }  
    public void setTicket(String ticket) {  
        this.ticket = ticket;  
    }  
    public String getExpires_in() {  
        return expires_in;  
    }  
    public void setExpires_in(String expires_in) {  
        this.expires_in = expires_in;  
    }  
}  