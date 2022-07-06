package com.example.spring_mp.quartz.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.spring_mp.quartz.entity.TJob;
import com.example.spring_mp.quartz.mapper.TJobMapper;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @program: JobService
 * @description:
 * @author: xiatl
 * @create: 2022-02-14 16:47
 **/
@Service
public class JobService extends ServiceImpl<TJobMapper, TJob> {

    /**
     * 添加任务
     * @param jobName
     * @param groupName
     * @param cron
     */
    public void addJob(String jobName, String groupName, String cron){
        TJob tJob = new TJob();
        tJob.setJobName(jobName);
        tJob.setJobGroup(groupName);
        tJob.setCron(cron);
        tJob.setStatus(1);
        super.save(tJob);
    }

    public void removeJob(String jobName, String groupName){
        LambdaQueryWrapper<TJob> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(TJob::getJobName, jobName);
        lambdaQueryWrapper.eq(TJob::getJobGroup, groupName);
        super.remove(lambdaQueryWrapper);
    }

    public void updateLastExecTime(String jobName, String groupName, Date time){
        LambdaQueryWrapper<TJob> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(TJob::getJobName, jobName);
        lambdaQueryWrapper.eq(TJob::getJobGroup, groupName);
        TJob one = super.getOne(lambdaQueryWrapper);
        one.setLastExecTime(time);
        super.updateById(one);
    }

    public void changeStatus(String jobName, String groupName, Integer status){
        LambdaQueryWrapper<TJob> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(TJob::getJobName, jobName);
        lambdaQueryWrapper.eq(TJob::getJobGroup, groupName);
        TJob one = super.getOne(lambdaQueryWrapper);
        one.setStatus(status);
        super.updateById(one);
    }

}
