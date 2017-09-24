package com.bdk.service;

import com.bdk.mapper.Sysparams;

public interface ISysparamsService {

	int update(Sysparams sysparams);

	Sysparams findById(int id);

	Sysparams findAll();

}
