package com.example.spring_mp.common.model;

import com.example.spring_mp.common.constants.SysConstant;
import lombok.Data;

/**
 * @program: ResObject
 * @description: 返回公共对象
 * @author: xiatl
 **/
@Data
public class ResObject {
    /**
     * 返回码
     */
    private String resultCode = SysConstant.RESP_CODE_SUCCESS;

    /**
     * 返回消息
     */
    private String msg;

    /**
     * 返回数据
     */
    private Object data;

}
