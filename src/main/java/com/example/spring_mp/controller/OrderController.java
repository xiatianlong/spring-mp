package com.example.spring_mp.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: OrderController
 * @description:
 * @author: xiatl
 * @create: 2021-11-28 14:24
 **/
@RestController
@RequestMapping("/order")
public class OrderController {

    @GetMapping("/list")
    public String list() {

        return "order list";
    }

}
