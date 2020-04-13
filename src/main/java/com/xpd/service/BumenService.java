package com.xpd.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xpd.bean.Bumen;
import com.xpd.dao.BumenDao;
import com.xpd.util.Page;

@Service
public class BumenService{
	
	@Autowired
	BumenDao bumenDao;

	public void addBumen(Bumen role) {
		bumenDao.addBumen(role);
	}

	public void updateBumen(Bumen role) {
		bumenDao.updateBumen(role);
	}

	public void deleteBumen(Bumen role) {
		bumenDao.deleteBumen(role);
	}

	public List<Bumen> showBumen(Map params) {
		Page.pageParam(params);
		List<Bumen> list = bumenDao.showBumen(params);
		return list;
	}
	
	public List<Bumen> getBumen(Map params) {
		Page.pageParam(params);
		List<Bumen> list = bumenDao.getBumen(params);
		return list;
	}

	public int getBumenCount(Map params) {
		int count = bumenDao.getBumenCount(params);
		return count;
	}

}
