package com.example.spring_mp.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.util.List;

/**
 * <p>
 * 订单
 * </p>
 *
 * @author xiatianlong
 * @since 2021-11-29
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class TOrder extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 订单编号
     */
    private String orderNo;

    /**
     * 支付金额
     */
    private BigDecimal payAmount;


    /**
     * 订单项实体
     */
    @TableField(exist = false)
    private List<TOrderItem> orderItemEntityList;

}
