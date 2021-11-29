package com.example.spring_mp.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 订单项
 * </p>
 *
 * @author xiatianlong
 * @since 2021-11-29
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class TOrderItem extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 订单ID
     */
    private Long orderId;

    /**
     * 商品名称
     */
    private String productName;

    /**
     * 商品数量
     */
    private Integer productCount;

    /**
     * 订单实体
     */
    @TableField(exist = false)
    private TOrder orderEntity;

}
