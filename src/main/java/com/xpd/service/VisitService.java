package com.xpd.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xpd.bean.Visit;
import com.xpd.dao.VisitDao;
import com.xpd.util.Page;

@Service
public class VisitService{
	
	@Autowired
	VisitDao visitDao;

	public void addVisit(Visit role) {
		visitDao.addVisit(role);
	}

	public void updateVisit(Visit role) {
		visitDao.updateVisit(role);
	}

	public void deleteVisit(Visit role) {
		visitDao.deleteVisit(role);
	}

	public List<Visit> showVisit(Map params) {
		Page.pageParam(params);
		List<Visit> list = visitDao.showVisit(params);
		return list;
	}
	
	public List<Visit> getVisit(Map params) {
		Page.pageParam(params);
		List<Visit> list = visitDao.getVisit(params);
		return list;
	}

	public int getVisitCount(Map params) {
		int count = visitDao.getVisitCount(params);
		return count;
	}

}
