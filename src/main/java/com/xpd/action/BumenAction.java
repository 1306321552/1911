package com.xpd.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xpd.bean.Bumen;
import com.xpd.service.BumenService;
import com.xpd.util.LayJSON;

@Controller
@RequestMapping("/sys")
public class BumenAction {

	@Autowired
	BumenService bumenService;
	
	@RequestMapping("/addBumen")
	@ResponseBody
	public void addBumen(Bumen bumen) {
		bumenService.addBumen(bumen);
	}
	
	@RequestMapping("/updateBumen")
	@ResponseBody
	public void updateBumen(Bumen bumen) {
		bumenService.updateBumen(bumen);
	}
	
	@RequestMapping("/deleteBumen")
	@ResponseBody
	public void deleteBumen(Bumen bumen) {
		bumenService.deleteBumen(bumen);
	}
	
	@RequestMapping("/showBumen")
	@ResponseBody
	public String showBumen(@RequestParam Map params) {
		int count = bumenService.getBumenCount(params);
		List listbumen = bumenService.showBumen(params);
		LayJSON layjson = new LayJSON(listbumen,count);
		String strjson = JSONObject.toJSONString(layjson);
		System.out.println(strjson);
		System.out.println("------------");
		layjson.setCount(count);
		return strjson;
	}
	
	@RequestMapping("/getBumen")
	@ResponseBody
	public String getBumen(@RequestParam Map params) {
		int count = bumenService.getBumenCount(params);
		List listbumen = bumenService.getBumen(params);
		LayJSON layjson = new LayJSON(listbumen,count);
		String strjson = JSONObject.toJSONString(layjson);
		System.out.println(strjson);
		System.out.println("------------");
		layjson.setCount(count);
		return strjson;
	}
	
	//跳转到角色管理系统
		@RequestMapping("/bumen_page")
		public String bumen() {
			return "sys/bumen_page";
		}
}
