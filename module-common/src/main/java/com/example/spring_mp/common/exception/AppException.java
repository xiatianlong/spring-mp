package com.example.spring_mp.common.exception;

/**
 * @program: AppException
 * @description: 自定义异常
 * @author: xiatl
 * @create: 2020-08-07 16:05
 **/
public class AppException extends RuntimeException {

    /**
     * 错误码
     */
    private String errorCode;

    public AppException(String msg) {
        super(msg);
    }

    public AppException(String msg, String errorCode) {
        super(msg);
        this.errorCode = errorCode;
    }

    public String getErrorCode() {
        return errorCode;
    }
}