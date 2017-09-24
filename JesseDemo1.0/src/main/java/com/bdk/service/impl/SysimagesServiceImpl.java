package com.bdk.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bdk.dao.ISysimagesDao;
import com.bdk.mapper.Sysimages;
import com.bdk.service.ISysimagesService;

@Service("sysimagesService")
public class SysimagesServiceImpl implements ISysimagesService{
	
	@Resource
	private ISysimagesDao sysimagesDao;

	@Override
	public int update(Sysimages sysimages) {
		return sysimagesDao.update(sysimages);
	}

	@Override
	public Sysimages findById(int id) {
		 Sysimages sysimages = sysimagesDao.findById(id);
		 return sysimages;
	}

	@Override
	public Sysimages findAll() {
		Sysimages findAll = sysimagesDao.findAll();
		return findAll;
	}

}
