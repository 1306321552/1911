package com.xpd.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.xpd.bean.Customer;

@Repository
public interface CustomerDao {

	void addCustomer(Customer customer);
	void updateCustomer(Customer customer);
	void documentaryCustomer(Customer customer);
	void documentaryCustomer_cancel(Customer customer);
	void deleteCustomer(Customer customer);
	
	List showCustomer(Map params);
	List showCustomer_public(Map params);
	List showCustomer_documentary(Map params);
	List getCustomer(Map params);
	List getCustomer_public(Map params);
	List getCustomer_documentary(Map params);
	int getCustomerCount(Map params);
	int getCustomerCount_public(Map params);
	int getCustomerCount_documentary(Map params);
	
	void customer_perm2(Map map);
	
}
