package com.example.spring_mp.quartz.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.util.Date;

/**
 * <p>
 * 任务配置表
 * </p>
 *
 * @author xiatianlong
 * @since 2021-12-14
 */
@Data
public class TJob {

    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 任务名称
     */
    private String jobName;

    /**
     * 任务分组
     */
    private String jobGroup;

    /**
     * corn表达式
     */
    private String cron;

    /**
     * 最后执行时间
     */
    private Date lastExecTime;

    /**
     * 状态1启用；0关闭
     */
    private Integer status;

    /**
     * 备注说明
     */
    private String remark;


}
