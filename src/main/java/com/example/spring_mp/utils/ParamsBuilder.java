package com.example.spring_mp.utils;

import com.alibaba.fastjson.JSONObject;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by laborc on 2016/11/1.
 */
public class ParamsBuilder {
    private Map<String, Object> params = new HashMap<>();

    private ParamsBuilder() {
    }

    public static ParamsBuilder newBuild() {
        return new ParamsBuilder();
    }

    public ParamsBuilder addParam(String key, Object value) {
        params.put(key, value);
        return this;
    }

    public ParamsBuilder setReturnStruct(String returnStruct) {
        params.put("returnStruct", returnStruct);
        return this;
    }

    public ParamsBuilder rmParam(String key) {
        params.remove(key);
        return this;
    }

    public ParamsBuilder clearParam() {
        params.clear();
        return this;
    }

    public String toString() {
        return JSONObject.toJSON(this.params).toString();
    }

    public Map<String, Object> build() {
        return params;
    }
}
