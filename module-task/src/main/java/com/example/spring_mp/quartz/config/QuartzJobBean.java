package com.example.spring_mp.quartz.config;

import com.example.spring_mp.quartz.job.ITask;
import com.example.spring_mp.quartz.service.JobService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.quartz.InterruptableJob;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.UnableToInterruptJobException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class QuartzJobBean extends org.springframework.scheduling.quartz.QuartzJobBean
        implements InterruptableJob {

    private static final Log logger = LogFactory.getLog(QuartzJobBean.class);
    @Autowired
    private ApplicationContext applicationContext;
    @Autowired
    private JobService jobService;
    private boolean interrupt = false;
    private String beanName;

    @Override
    protected void executeInternal(JobExecutionContext context) {
        if (!interrupt) {
            JobDetail jobDetail = context.getJobDetail();
            String name = jobDetail.getKey().getName();
            String groupName = jobDetail.getKey().getGroup();
            try {
                ITask task = (ITask) applicationContext.getBean(beanName);
                task.execute(context);
                jobService.updateLastExecTime(name, groupName, new Date());
            } catch (Exception e) {
                logger.error(e.getMessage(), e);
            }
        }
    }

    @Override
    public void interrupt() throws UnableToInterruptJobException {
        interrupt = false;
    }

    public boolean isInterrupt() {
        return interrupt;
    }

    public void setInterrupt(boolean interrupt) {
        this.interrupt = interrupt;
    }

    public String getBeanName() {
        return beanName;
    }

    public void setBeanName(String beanName) {
        this.beanName = beanName;
    }
}
