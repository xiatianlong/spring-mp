package com.example.spring_mp;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.spring_mp.entity.TOrder;
import com.example.spring_mp.entity.TOrderItem;
import com.example.spring_mp.service.TOrderItemServiceImpl;
import com.example.spring_mp.service.TOrderServiceImpl;
import com.example.spring_mp.utils.ParamsBuilder;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: OrderTest
 * @description: 订单测试
 * @author: xiatl
 * @create: 2021-11-29 09:19
 **/
@SpringBootTest
public class OrderTest {

    @Autowired
    private TOrderServiceImpl orderService;

    @Autowired
    private TOrderItemServiceImpl orderItemService;

    /******************************************** ↓ ↓ ↓ 增 ↓ ↓ ↓ ***********************************************/

    /**
     * 插入order数据
     */
    @Test
    void saveOrder() {
        for (int i = 1; i < 10; i++) {
            TOrder order = new TOrder();
            order.setOrderNo("NO00000" + i);
            order.setPayAmount(BigDecimal.valueOf(100));
            orderService.save(order);

            // 批量插入orderItem
            List<TOrderItem> tOrderItems = new ArrayList<>();
            for (int j = 1; j < 3; j++) {
                TOrderItem orderItem = new TOrderItem();
                orderItem.setOrderId(order.getId());
                orderItem.setProductCount(j);
                orderItem.setProductName("测试商品");
                tOrderItems.add(orderItem);
            }
            orderItemService.saveBatch(tOrderItems);
        }


    }

    /******************************************** ↓ ↓ ↓ 改 ↓ ↓ ↓ ***********************************************/

    /**
     * 更新order数据
     */
    @Test
    void updateOrder() {
        TOrder order = orderService.getById(1);
        order.setUpdatedDate(LocalDateTime.now());
        order.setPayAmount(BigDecimal.valueOf(102));
        orderService.saveOrUpdate(order);
    }

    /**
     * 更新order数据
     * 更新部分字段，待条件更新
     */
    @Test
    void updateOrderOfSomeColumn() {
        LambdaUpdateWrapper<TOrder> updateWrapper = new LambdaUpdateWrapper<>();
        TOrder order = new TOrder();
        order.setUpdatedDate(LocalDateTime.now());
        // 只更新金额为100的，设置更新时间
        updateWrapper.eq(TOrder::getPayAmount, BigDecimal.valueOf(100));
        orderService.update(order, updateWrapper);
    }

    /******************************************** ↓ ↓ ↓ 删 ↓ ↓ ↓ ***********************************************/

    /**
     * 删除order数据
     * # 已在application.yml配置逻辑删除；所有的删除会变成update，更新dataStatus字段
     * # 逻辑删除后的数据查询也无法查出
     * # 逻辑见：https://mp.baomidou.com/guide/logic-delete.html#%E4%BD%BF%E7%94%A8%E6%96%B9%E6%B3%95
     */
    @Test
    void deleteOrder() {
        orderService.removeById(1);
    }

    /**
     * 带条件删除
     */
    @Test
    void deleteByQueryWrapper() {
        LambdaQueryWrapper<TOrder> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(TOrder::getPayAmount, 100);
        orderService.remove(lambdaQueryWrapper);
    }


    /******************************************** ↓ ↓ ↓ 查 ↓ ↓ ↓ ***********************************************/

    /**
     * 根据ID查询Order
     */
    @Test
    void getById() {
        TOrder order = orderService.getById(2);
        System.err.println(JSONObject.toJSON(order).toString());
    }

    /**
     * 根据ID查询Order
     */
    @Test
    void getByQueryWrapper() {
        LambdaQueryWrapper<TOrder> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(TOrder::getId, 1);
        TOrder order = orderService.getOne(lambdaQueryWrapper);
        System.err.println(JSONObject.toJSON(order).toString());
    }

    /**
     * 查询全部order
     */
    @Test
    void list() {
        List<TOrder> orderList = orderService.list();
        System.err.println(JSONObject.toJSON(orderList).toString());
    }

    /**
     * 根据ID查询Order
     */
    @Test
    void listByQueryWrapper() {
        LambdaQueryWrapper<TOrder> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        // 查询ID大于1的数据
        lambdaQueryWrapper.gt(TOrder::getId, 1);
        List<TOrder> orderList = orderService.list(lambdaQueryWrapper);
        System.err.println(JSONObject.toJSON(orderList).toString());
    }

    /**
     * 分页查询Order
     */
    @Test
    void listByPage() {
        int pageNo = 1; // 从1开始
        int pageSize = 2;
        Page<TOrder> page = new Page<>(pageNo, pageSize);
        Page<TOrder> orderPage = orderService.page(page);
        System.err.println(JSONObject.toJSON(orderPage).toString());
    }

    /**
     * 分页查询Order
     * 带条件
     */
    @Test
    void listByPageWithQueryWrapper() {
        int pageNo = 1; // 从1开始
        int pageSize = 2;
        Page<TOrder> page = new Page<>(pageNo, pageSize);
        LambdaQueryWrapper<TOrder> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.gt(TOrder::getPayAmount, 100);
        Page<TOrder> orderPage = orderService.page(page, lambdaQueryWrapper);
        System.err.println(JSONObject.toJSON(orderPage).toString());
    }

    /**
     * 通过xml查询订单
     */
    @Test
    void getOrderByXml() {
        ParamsBuilder paramsBuilder = ParamsBuilder.newBuild().addParam("id", 1);
        TOrder order = orderService.getOrderByXml(paramsBuilder.build());
        System.err.println(JSONObject.toJSON(order).toString());
    }

    /**
     * 通过xml查询订单
     */
    @Test
    void getOrderWithOrderItemByXml() {
        ParamsBuilder paramsBuilder = ParamsBuilder.newBuild().addParam("id", 1).addParam("loadItem", true);
        TOrder order = orderService.getOrderByXml(paramsBuilder.build());
        System.err.println(JSONObject.toJSON(order).toString());
    }

}
