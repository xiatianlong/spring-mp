package com.example.spring_mp;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.example.spring_mp.mapper")
public class SpringMpApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringMpApplication.class, args);
        System.out.println("System started success!!! ");
    }

}
