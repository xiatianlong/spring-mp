package com.example.spring_mp.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * @program: BaseEntity
 * @description: entity基类
 * @author: xiatl
 * @create: 2021-11-29 08:53
 **/
@Data
public class BaseEntity {
    /**
     * ID
     */
    @TableId(type = IdType.AUTO)
    private Long id;
    /**
     * 数据状态：1有效；0失效
     */
    private Integer dataStatus;

    private LocalDateTime createdDate;

    private LocalDateTime updatedDate;

}
