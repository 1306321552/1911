package com.xpd.util;

import java.util.List;

public class LayJSON {

	public LayJSON(List data,int count) {
		super();
//		if(data!=null) {
//			this.count=data.size();
//		}
		this.count=count;
		this.data=data;
	}
	
	private int code = 0;
	private String msg = "";
	private int count= 100;
	private List data = null;
	
	public List getData() {
		return data;
	}
	public void setData(List data) {
//		if(data != null) {
//			this.count = data.size();
//		}
		this.data = data;
	}
	public int getCode() {
		return code;
	}
	public String getMsg() {
		return msg;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
}
