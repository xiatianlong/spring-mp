package com.example.spring_mp.quartz.config;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.example.spring_mp.quartz.entity.TJob;
import com.example.spring_mp.quartz.service.JobService;
import org.quartz.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author imoot@gamil.com
 * @date 2019/7/11 0011 16:54
 */
@Component
public class JobOperation {

    @Autowired
    private Scheduler scheduler;
    @Autowired
    private JobService jobService;

    @SuppressWarnings("unchecked")
    public void add(String name, String group, String cron, boolean db) throws Exception {
        if (db) {
            // 数据库持久化
            jobService.addJob(name, group, cron);
        }
        try {
            JobKey jobKey = new JobKey(name, group);
            JobDetail jobDetail = scheduler.getJobDetail(jobKey);
            if (jobDetail != null) {
                scheduler.deleteJob(jobKey);
            }
        } catch (SchedulerException e1) {
            e1.printStackTrace();
        }
        CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(cron);
        //创建任务
        JobDetail jobDetail = JobBuilder.newJob(QuartzJobBean.class).withIdentity(name, group).build();
        jobDetail.getJobDataMap().put("beanName", name);
        //创建触发器
        Trigger trigger = TriggerBuilder.newTrigger().withIdentity(name, group).withSchedule(scheduleBuilder).build();
        //把触发器与任务绑定到调度器中
        scheduler.scheduleJob(jobDetail, trigger);
    }

    public void remove(String name, String group, boolean db) throws Exception {
        TriggerKey triggerKey = TriggerKey.triggerKey(name, group);
        if (db) {
            // 数据库持久化
            jobService.removeJob(name, group);
        }
        //停止触发器
        scheduler.pauseTrigger(triggerKey);
        //移除触发器
        scheduler.unscheduleJob(triggerKey);
        //删除任务
        scheduler.deleteJob(JobKey.jobKey(name, group));
    }

    public void modify(String name, String group, String cron, boolean db) throws Exception {
        //修改因为会额外触发一次，所以先做移除再添加
        //移除
        remove(name, group, db);
        //添加
        add(name, group, cron, db);
    }

    public void removeJobs() throws Exception {
        scheduler.pauseAll();
        scheduler.clear();
    }

    /**
     * 修改任务状态
     * # 暂停触发器或者恢复触发器
     *
     * @param name
     * @param group
     * @param status 0|1
     * @throws SchedulerException
     */
    public void changeStatus(String name, String group, Integer status) throws Exception {
        jobService.changeStatus(name, group, status);
        TriggerKey triggerKey = TriggerKey.triggerKey(name, group);
        if (status == 0) {
            this.remove(name, group, false);
        } else if (status == 1) {
            LambdaQueryWrapper<TJob> lambdaQueryWrapper = new LambdaQueryWrapper<>();
            lambdaQueryWrapper.eq(TJob::getJobName, name);
            lambdaQueryWrapper.eq(TJob::getJobGroup, group);
            TJob one = jobService.getOne(lambdaQueryWrapper);
            this.add(name, group, one.getCron(), false);
        }
    }

    /**
     * 立即执行job
     *
     * @param jobVO
     * @throws SchedulerException
     */
    public void immediateExecutionJob(TJob jobVO) throws SchedulerException {
        scheduler.triggerJob(new JobKey(jobVO.getJobName(), jobVO.getJobGroup()));
    }

    /**
     * 获取class
     *
     * @param packageName
     * @param className
     * @return
     */
    private Class getClazz(String packageName, String className) {
        Class clazz;
        try {
            clazz = Class.forName(packageName + "." + className);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
        return clazz;
    }

}
