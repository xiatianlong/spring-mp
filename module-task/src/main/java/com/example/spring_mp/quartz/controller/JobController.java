package com.example.spring_mp.quartz.controller;

import com.example.spring_mp.quartz.config.JobOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: JobController
 * @description:
 * @author: xiatl
 * @create: 2022-07-06 15:31
 **/
@RestController
@RequestMapping("/job")
public class JobController {

    @Autowired
    private JobOperation jobOperation;

    @PostMapping("/changeStatus/{jobName}/{groupName}/{status}")
    public String changeStatus(@PathVariable String jobName, @PathVariable String groupName, @PathVariable Integer status) throws Exception {
        jobOperation.changeStatus(jobName, groupName, status);
        return "ok";
    }

}
