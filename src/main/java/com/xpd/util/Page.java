package com.xpd.util;

import java.util.Map;

public class Page {

	//ͨ��ҳ���ÿҳ�ĸ����������ʼλ��
	public static void pageParam(Map params) {
		String page = params.get("page")+"";
		String limit = params.get("limit")+"";
		
		//ת����int����
		int page_i = Integer.parseInt(page);
		int limit_i = Integer.parseInt(limit);
		int start = limit_i*(page_i-1);
		
		params.put("start", start);
	}
}
