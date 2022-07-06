package com.example.spring_mp.quartz.job;

import com.example.spring_mp.common.utils.DateUtil;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @program: TestJob
 * @description: 测试
 * @author: xiatl
 * @create: 2022-02-14 16:41
 **/
@Component("TestTask")
public class TestTask implements ITask {
    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
        System.out.println(DateUtil.defaultFormat(new Date()) + "TestTask 任务执行中...");
    }
}
