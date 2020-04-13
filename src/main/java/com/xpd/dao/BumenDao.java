package com.xpd.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.xpd.bean.Bumen;

@Repository
public interface BumenDao {

	void addBumen(Bumen bumen);
	void updateBumen(Bumen bumen);
	void deleteBumen(Bumen bumen);
	
	List showBumen(Map params);
	List getBumen(Map params);
	int getBumenCount(Map params);
	
	void bumen_perm2(Map map);
	
}
