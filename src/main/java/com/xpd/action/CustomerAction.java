package com.xpd.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xpd.bean.Customer;
import com.xpd.service.CustomerService;
import com.xpd.util.LayJSON;

@Controller
@RequestMapping("/sys")
public class CustomerAction {

	@Autowired
	CustomerService customerService;
	
	@RequestMapping("/addCustomer")
	@ResponseBody
	public void addCustomer(Customer customer) {
		customerService.addCustomer(customer);
	}
	
	@RequestMapping("/updateCustomer")
	@ResponseBody
	public void updateCustomer(Customer customer) {
		customerService.updateCustomer(customer);
	}
	
	//跟单
	@RequestMapping("/documentaryCustomer")
	@ResponseBody
	public void documentaryCustomer(Customer customer) {
		customerService.documentaryCustomer(customer);
	}
	
	//取消跟单
	@RequestMapping("/documentaryCustomer_cancel")
	@ResponseBody
	public void documentaryCustomer_cancel(Customer customer) {
		customerService.documentaryCustomer_cancel(customer);
	}
	
	@RequestMapping("/deleteCustomer")
	@ResponseBody
	public void deleteCustomer(Customer customer) {
		customerService.deleteCustomer(customer);
	}
	
	@RequestMapping("/showCustomer")
	@ResponseBody
	public String showCustomer(@RequestParam Map params) {
		int count = customerService.getCustomerCount(params);
		List listcustomer = customerService.showCustomer(params);
		LayJSON layjson = new LayJSON(listcustomer,count);
		String strjson = JSONObject.toJSONString(layjson);
		System.out.println(strjson);
		System.out.println("------------");
		layjson.setCount(count);
		return strjson;
	}
	
	@RequestMapping("/showCustomer_public")
	@ResponseBody
	public String showCustomer_public(@RequestParam Map params) {
		int count = customerService.getCustomerCount_public(params);
		List listcustomer = customerService.showCustomer_public(params);
		LayJSON layjson = new LayJSON(listcustomer,count);
		String strjson = JSONObject.toJSONString(layjson);
		System.out.println(strjson);
		System.out.println("------------");
		layjson.setCount(count);
		return strjson;
	}
	
	@RequestMapping("/showCustomer_documentary")
	@ResponseBody
	public String showCustomer_documentary(@RequestParam Map params) {
		int count = customerService.getCustomerCount_documentary(params);
		List listcustomer = customerService.showCustomer_documentary(params);
		LayJSON layjson = new LayJSON(listcustomer,count);
		String strjson = JSONObject.toJSONString(layjson);
		System.out.println(strjson);
		System.out.println("------------");
		layjson.setCount(count);
		return strjson;
	}
	
	@RequestMapping("/getCustomer")
	@ResponseBody
	public String getCustomer(@RequestParam Map params) {
		int count = customerService.getCustomerCount(params);
		List listcustomer = customerService.getCustomer(params);
		LayJSON layjson = new LayJSON(listcustomer,count);
		String strjson = JSONObject.toJSONString(layjson);
		System.out.println(strjson);
		System.out.println("------------");
		layjson.setCount(count);
		return strjson;
	}
	
	@RequestMapping("/getCustomer_public")
	@ResponseBody
	public String getCustomer_public(@RequestParam Map params) {
		int count = customerService.getCustomerCount_public(params);
		List listcustomer = customerService.getCustomer_public(params);
		LayJSON layjson = new LayJSON(listcustomer,count);
		String strjson = JSONObject.toJSONString(layjson);
		System.out.println(strjson);
		System.out.println("------------");
		layjson.setCount(count);
		return strjson;
	}
	
	@RequestMapping("/getCustomer_documentary")
	@ResponseBody
	public String getCustomer_documentary(@RequestParam Map params) {
		int count = customerService.getCustomerCount_documentary(params);
		List listcustomer = customerService.getCustomer_documentary(params);
		LayJSON layjson = new LayJSON(listcustomer,count);
		String strjson = JSONObject.toJSONString(layjson);
		System.out.println(strjson);
		System.out.println("------------");
		layjson.setCount(count);
		return strjson;
	}
	
	//跳转到角色管理系统
		@RequestMapping("/customer_page")
		public String customer() {
			return "sys/customer_page";
		}
		
		//跳转到角色管理系统
		@RequestMapping("/customer_public_page")
		public String customer_public() {
			return "sys/customer_public_page";
		}
		
		//跳转到角色管理系统
		@RequestMapping("/customer_documentary_page")
		public String customer_documentary() {
			return "sys/customer_documentary_page";
		}
}
