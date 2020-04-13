package com.xpd.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xpd.bean.Visit;
import com.xpd.service.VisitService;
import com.xpd.util.LayJSON;

@Controller
@RequestMapping("/sys")
public class VisitAction {

	@Autowired
	VisitService visitService;
	
	@RequestMapping("/addVisit")
	@ResponseBody
	public void addVisit(Visit visit) {
		visitService.addVisit(visit);
	}
	
	@RequestMapping("/updateVisit")
	@ResponseBody
	public void updateVisit(Visit visit) {
		visitService.updateVisit(visit);
	}
	
	@RequestMapping("/deleteVisit")
	@ResponseBody
	public void deleteVisit(Visit visit) {
		visitService.deleteVisit(visit);
	}
	
	@RequestMapping("/showVisit")
	@ResponseBody
	public String showVisit(@RequestParam Map params) {
		int count = visitService.getVisitCount(params);
		List listvisit = visitService.showVisit(params);
		LayJSON layjson = new LayJSON(listvisit,count);
		String strjson = JSONObject.toJSONString(layjson);
		System.out.println(strjson);
		System.out.println("------------");
		layjson.setCount(count);
		return strjson;
	}
	
	@RequestMapping("/getVisit")
	@ResponseBody
	public String getVisit(@RequestParam Map params) {
		int count = visitService.getVisitCount(params);
		List listvisit = visitService.getVisit(params);
		LayJSON layjson = new LayJSON(listvisit,count);
		String strjson = JSONObject.toJSONString(layjson);
		System.out.println(strjson);
		System.out.println("------------");
		layjson.setCount(count);
		return strjson;
	}
	
	//跳转到角色管理系统
		@RequestMapping("/visit_page")
		public String visit() {
			return "sys/visit_page";
		}
}
