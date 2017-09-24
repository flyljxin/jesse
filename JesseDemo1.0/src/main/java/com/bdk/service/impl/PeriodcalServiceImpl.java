package com.bdk.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bdk.dao.IPeriodcalDao;
import com.bdk.mapper.IS_NEWEST;
import com.bdk.mapper.Periodcal;
import com.bdk.service.IPeriodcalService;
import com.bdk.utill.StringHelper;

@Service("periodcalService")
public class PeriodcalServiceImpl implements IPeriodcalService{
	
	@Resource
	private IPeriodcalDao periodcalDao;

	@Override
	public List<Periodcal> findAll() {
		return periodcalDao.findAll();
	}

	@Override
	public Periodcal findById(int id) {
		return periodcalDao.findById(id);
	}

	@Override
	public void updatePeriodcal(Periodcal periodcal) {
		periodcalDao.updatePeriodcal(periodcal);
		
		//设置为最新一期
		if(IS_NEWEST.Y.equals(periodcal.getIsnew())){
			periodcalDao.setPeriodcalLatest(periodcal.getId());
		}
	}

	@Override
	public void insertPeriodcal(Periodcal periodcal) {
		periodcalDao.insertPeriodcal(periodcal);
		
		//设置为最新一期
		if(IS_NEWEST.Y.equals(periodcal.getIsnew())){
			periodcalDao.setPeriodcalLatest(periodcal.getId());
		}
	}

	@Override
	public List<Periodcal> queryPeriodcalList(String periodcalName,String qkNo, int pageNo, int pageSize) {
		if(StringHelper.isEmpty(qkNo))
		{
			qkNo = "0";
		}
		return periodcalDao.queryPeriodcalList(periodcalName,Integer.parseInt(qkNo),(pageNo-1)*pageSize, pageSize);
	}

	@Override
	public int queryTotal(String periodcalName, String qknum) {
		return periodcalDao.queryTotal(periodcalName, qknum);
	}

	@Override
	public List<Periodcal> findMore(int pageNo, int pageSize) {
		return periodcalDao.findMore((pageNo-1)*pageSize, pageSize);
	}

	@Override
	public int findMoreTotal() {
		return periodcalDao.findMoreTotal();
	}

	@Override
	public Periodcal findByQknum(String qknum) {
		return periodcalDao.findByQknum(qknum);
	}

	@Override
	public void releasePeriodcal(int id) {
		periodcalDao.releasePeriodcal(id);
	}

	@Override
	public Periodcal getLatestPeriodcal() {
		return periodcalDao.getLatestPeriodcal();
	}

	@Override
	public List<Periodcal> findList() {
		return periodcalDao.findList();
	}

	@Override
	public void cancelReleasePeriodcal(int id) {
		periodcalDao.cancelreleasePeriodcal(id);
	}
}
