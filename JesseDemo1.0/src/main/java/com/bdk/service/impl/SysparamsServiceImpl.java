package com.bdk.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bdk.dao.ISysparamsDao;
import com.bdk.mapper.Sysparams;
import com.bdk.service.ISysparamsService;


@Service("sysparamsService")
public class SysparamsServiceImpl implements ISysparamsService {
		
		@Resource
		private ISysparamsDao sysparamsDao;

		/**
		 * 修改数据
		 */
		@Override
		public int update(Sysparams sysparams) {
			return sysparamsDao.update(sysparams);
		}

		@Override
		public Sysparams findById(int id) {
			Sysparams sysparams = sysparamsDao.findById(id);
			return sysparams;
		}

		@Override
		public Sysparams findAll() {
			Sysparams findAllList = sysparamsDao.findAll();
			return findAllList;
		}

}
