package com.bdk.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.bdk.dao.IArtypeDao;
import com.bdk.mapper.Artype;
import com.bdk.service.IArtypeService;

@Service("artypeService")
public class ArtypeServiceImpl implements IArtypeService{

	@Resource
	private IArtypeDao artypeDao;
	
	@Override
	public List<Artype> getAllType() {
		return artypeDao.getAllType();
	}

	@Override
	public Artype getType(int code) {
		return artypeDao.getType(code);
	}

	@Override
	public void updateType(Artype artype) {
		artypeDao.updateType(artype);
	}

}
