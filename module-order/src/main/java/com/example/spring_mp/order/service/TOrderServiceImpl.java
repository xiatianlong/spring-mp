package com.example.spring_mp.order.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.spring_mp.order.entity.TOrder;
import com.example.spring_mp.order.mapper.TOrderMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 订单 服务实现类
 * </p>
 *
 * @author xiatianlong
 * @since 2021-11-29
 */
@Service
public class TOrderServiceImpl extends ServiceImpl<TOrderMapper, TOrder> {

    /**
     * 查询订单
     *
     * @param params 参数
     * @return order
     */
    public TOrder getOrderByXml(Map<String, Object> params) {
        return baseMapper.getOrder(params);
    }

    /**
     * 查询订单列表
     *
     * @param params 参数
     * @return order
     */
    public List<TOrder> listOrderByXml(Map<String, Object> params) {
        return baseMapper.loadOrder(params);
    }


}
