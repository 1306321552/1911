package com.xpd.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xpd.bean.Customer;
import com.xpd.dao.CustomerDao;
import com.xpd.util.Page;

@Service
public class CustomerService{
	
	@Autowired
	CustomerDao bumenDao;

	public void addCustomer(Customer customer) {
		bumenDao.addCustomer(customer);
	}

	public void updateCustomer(Customer customer) {
		bumenDao.updateCustomer(customer);
	}
	
	public void documentaryCustomer(Customer customer) {
		bumenDao.documentaryCustomer(customer);
	}
	
	public void documentaryCustomer_cancel(Customer customer) {
		bumenDao.documentaryCustomer_cancel(customer);
	}

	public void deleteCustomer(Customer customer) {
		bumenDao.deleteCustomer(customer);
	}

	public List<Customer> showCustomer(Map params) {
		Page.pageParam(params);
		List<Customer> list = bumenDao.showCustomer(params);
		return list;
	}
	
	public List<Customer> showCustomer_public(Map params) {
		Page.pageParam(params);
		List<Customer> list = bumenDao.showCustomer_public(params);
		return list;
	}
	
	public List<Customer> showCustomer_documentary(Map params) {
		Page.pageParam(params);
		List<Customer> list = bumenDao.showCustomer_documentary(params);
		return list;
	}
	
	public List<Customer> getCustomer(Map params) {
		Page.pageParam(params);
		List<Customer> list = bumenDao.getCustomer(params);
		return list;
	}
	
	public List<Customer> getCustomer_public(Map params) {
		Page.pageParam(params);
		List<Customer> list = bumenDao.getCustomer_public(params);
		return list;
	}
	
	public List<Customer> getCustomer_documentary(Map params) {
		Page.pageParam(params);
		List<Customer> list = bumenDao.getCustomer_documentary(params);
		return list;
	}

	public int getCustomerCount(Map params) {
		int count = bumenDao.getCustomerCount(params);
		return count;
	}
	
	public int getCustomerCount_public(Map params) {
		int count = bumenDao.getCustomerCount_public(params);
		return count;
	}
	
	public int getCustomerCount_documentary(Map params) {
		int count = bumenDao.getCustomerCount_documentary(params);
		return count;
	}

}
