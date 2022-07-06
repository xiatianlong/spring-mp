package com.example.spring_mp.common.exception;

import com.example.spring_mp.common.utils.ResUtil;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;

/**
 * @program: ExceptionConfig
 * @description: 异常配置
 * @author: xiatl
 * @create: 2020-08-07 16:04
 **/
@RestControllerAdvice
public class ExceptionConfig {

    /**
     * 处理AppException异常
     */
    @ExceptionHandler(value = AppException.class)
    @ResponseStatus(HttpStatus.OK)
    public Object appExceptionHandle(HttpServletRequest req, AppException e) {
        return ResUtil.resError(e.getMessage(), e.getErrorCode());
    }

    /**
     * 系统异常捕获处理
     */
    @ExceptionHandler(value = Exception.class)
    @ResponseStatus(HttpStatus.OK)
    public Object exceptionHandler(Exception e) {
        e.printStackTrace();
        return ResUtil.resError("系统异常，请联系管理员");
    }

    /**
     * 系统异常捕获处理
     */
    @ExceptionHandler(value = RuntimeException.class)
    @ResponseStatus(HttpStatus.OK)
    public Object runtimeExceptionHandle(Exception e) {
        e.printStackTrace();
        return ResUtil.resError("服务器繁忙，请稍后重试");
    }

}
