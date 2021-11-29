package com.example.spring_mp.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.spring_mp.entity.TOrder;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 订单 Mapper 接口
 * </p>
 *
 * @author xiatianlong
 * @since 2021-11-29
 */
@Mapper
public interface TOrderMapper extends BaseMapper<TOrder> {

    /**
     * 查询订单
     *
     * @param params 参数
     * @return order
     */
    TOrder getOrder(Map<String, Object> params);

    /**
     * 查询订单列表
     *
     * @param params 参数
     * @return order
     */
    List<TOrder> loadOrder(Map<String, Object> params);
}
