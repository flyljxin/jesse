package com.bdk.dao;

import com.bdk.mapper.Sysimages;

public interface ISysimagesDao {
	
	int update(Sysimages sysimages);

	Sysimages findById(int id);

	Sysimages findAll();
	
}
