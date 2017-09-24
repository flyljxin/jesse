package com.bdk.wecat.quartz;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

//任务
public class WeixinQuartzJob  extends QuartzJobBean{

	private RefreshAccessTokenTask refreshAccessTokenTask;
	
	
	public void setRefreshAccessTokenTask(
			RefreshAccessTokenTask refreshAccessTokenTask) {
		this.refreshAccessTokenTask = refreshAccessTokenTask;
	}


	/**
	 * ctx运行中上下文
	 */
	@Override
	protected void executeInternal(JobExecutionContext ctx)
			throws JobExecutionException {
		     refreshAccessTokenTask.refreshToken();//刷新token方法
	}
 
}
