package com.xpd.util;

import java.util.List;

public class RoleJSON {

	private int code=0;
	private String msg="";
	private int count = 100;
	private List data=null;
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public List getData() {
		return data;
	}
	public void setData(List data) {
		this.data = data;
	}

	public RoleJSON(List data) {
		super();
		this.data=data;
	}
}
