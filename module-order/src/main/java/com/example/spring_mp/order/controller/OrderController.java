package com.example.spring_mp.order.controller;

import com.example.spring_mp.common.utils.ParamsBuilder;
import com.example.spring_mp.common.utils.ResUtil;
import com.example.spring_mp.order.entity.TOrder;
import com.example.spring_mp.order.service.TOrderServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


/**
 * @program: OrderController
 * @description:
 * @author: xiatl
 * @create: 2021-11-28 14:24
 **/
@RestController
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private TOrderServiceImpl orderService;

    @GetMapping("/list")
    public Object list() {
        List<TOrder> orderList = orderService.list();
        return ResUtil.resSuccess(orderList);
    }

    @GetMapping("{id}")
    public Object get(@PathVariable Long id) {
        ParamsBuilder paramsBuilder = ParamsBuilder.newBuild().addParam("id", id).addParam("loadItem", true);
        TOrder order = orderService.getOrderByXml(paramsBuilder.build());
        return ResUtil.resSuccess(order);
    }

}
