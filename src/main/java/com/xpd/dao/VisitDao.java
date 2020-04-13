package com.xpd.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.xpd.bean.Visit;

@Repository
public interface VisitDao {

	void addVisit(Visit visit);
	void updateVisit(Visit visit);
	void deleteVisit(Visit visit);
	
	List showVisit(Map params);
	List getVisit(Map params);
	int getVisitCount(Map params);
	
	void visit_perm2(Map map);
	
}
