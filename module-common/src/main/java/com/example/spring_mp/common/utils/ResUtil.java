package com.example.spring_mp.common.utils;

import com.example.spring_mp.common.constants.SysConstant;
import com.example.spring_mp.common.model.ResObject;
import org.springframework.util.StringUtils;

/**
 * @program: ResUtil
 * @description: 返回工具类
 * @author: xiatl
 * @create: 2021-12-13 11:38
 **/
public class ResUtil {
    /**
     * 成功返回
     *
     * @param obj 返回对象
     * @return res
     */
    public static Object resSuccess(Object obj) {
        ResObject res = new ResObject();
        res.setData(obj);
        res.setMsg("OK");
        return res;
    }

    /**
     * 失败返回
     *
     * @param msg 返回消息
     * @return res
     */
    public static Object resError(String msg) {
        ResObject res = new ResObject();
        res.setMsg(msg);
        res.setResultCode(SysConstant.RESP_CODE_FAIL);
        return res;
    }

    /**
     * 成功返回
     *
     * @param msg        返回消息
     * @param resultCode 返回错误码
     * @return res
     */
    public static Object resError(String msg, String resultCode) {
        ResObject res = new ResObject();
        res.setMsg(msg);
        if (StringUtils.isEmpty(resultCode)) {
            resultCode = SysConstant.RESP_CODE_FAIL;
        }
        res.setResultCode(resultCode);
        return res;
    }
}
