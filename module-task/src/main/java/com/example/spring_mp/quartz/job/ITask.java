package com.example.spring_mp.quartz.job;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.io.Serializable;

public interface ITask extends Serializable {
    public void execute(JobExecutionContext context) throws JobExecutionException;
}
