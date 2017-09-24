package com.bdk.service;


import com.bdk.mapper.Sysimages;

public interface ISysimagesService {
	
	int update(Sysimages sysimages);

	Sysimages findById(int id);

	Sysimages findAll();

}
