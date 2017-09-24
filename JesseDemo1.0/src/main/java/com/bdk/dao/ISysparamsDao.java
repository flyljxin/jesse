package com.bdk.dao;

import com.bdk.mapper.Sysparams;

public interface ISysparamsDao {

	int update(Sysparams sysparams);

	Sysparams findById(int id);

	Sysparams findAll();
}
