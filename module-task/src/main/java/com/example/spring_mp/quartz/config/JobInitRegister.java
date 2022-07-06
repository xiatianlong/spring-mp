package com.example.spring_mp.quartz.config;

import com.example.spring_mp.quartz.entity.TJob;
import com.example.spring_mp.quartz.service.JobService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.quartz.*;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 初始化数据库所有任务到quartz
 */
@Component
public class JobInitRegister implements InitializingBean {
	private static final Log logger = LogFactory.getLog(JobInitRegister.class);
	@Autowired
	private Scheduler scheduler;
	@Autowired
	private JobService jobService;


	@Override
	public void afterPropertiesSet() throws Exception {
		List<TJob> jobs = jobService.list();
		if (jobs != null && !jobs.isEmpty()) {
			for (TJob job : jobs) {
				JobKey jobKey = new JobKey(job.getJobName(), job.getJobGroup());
				try {
					JobDetail jobDetail = scheduler.getJobDetail(jobKey);
					if (jobDetail != null) {
						scheduler.deleteJob(jobKey);
					}
				} catch (SchedulerException e1) {
					e1.printStackTrace();
				}

				JobDetail jobDetail = JobBuilder.newJob(QuartzJobBean.class)
						.withIdentity(jobKey)
						.build();
				jobDetail.getJobDataMap().put("beanName", job.getJobName());

				TriggerKey triggerKey = new TriggerKey("cron_" + job.getJobName(), job.getJobGroup());
				CronTrigger cronTrigger = TriggerBuilder.newTrigger()
						.withIdentity(triggerKey)
						.withSchedule(CronScheduleBuilder.cronSchedule(job.getCron()))
						.build();
				try {
					scheduler.scheduleJob(jobDetail, cronTrigger);
					if (job.getStatus() == 0) {
						scheduler.pauseTrigger(triggerKey);
					}
				} catch (SchedulerException e) {
					logger.error(e.getMessage(), e);
				}
			}
		}
	}
}
