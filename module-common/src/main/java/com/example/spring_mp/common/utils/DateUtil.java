package com.example.spring_mp.common.utils;

import org.springframework.util.StringUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @program: DateUtil
 * @description: 日期工具类
 * @author: xiatl
 * @create: 2020-08-07 16:13
 **/
public class DateUtil {

    public final static String DEFAULT_DATE_PATTERN = "yyyy-MM-dd HH:mm:ss";
    public final static String DATEFORMATTER_YYYY_MM_DD = "yyyy-MM-dd";
    public final static String DATEFORMATTER_TIMESTEMP = "yyyy-MM-dd HH:mm:ss.SSS";
    public final static String DATEFORMATTER_YYMM = "yyyy-MM";
    public final static String DATEFORMATTER_HHmm = "HH:mm";
    public final static String DATEFORMATTER_MMDDHHmm = "MM-dd HH:mm";
    public final static String DATEFORMATTER_HHMM = "yyyy-MM-dd HH:mm";
    public final static String DEFAULT_DATE_PATTERN_CN = "yyyy年MM月dd日 HH:mm:ss";
    public final static String DATEFORMATTER_YYMM_CN = "yyyy年MM月";
    public final static String DATEFORMATTER_MMDD_CN = "MM月dd日";
    public final static String DATEFORMATTER_YYYY_MM_DD_CN = "yyyy年MM月dd日";

    /**
     * 默认的日期格式化
     *
     * @param date 日期
     * @return 字符串
     */
    public static String defaultFormat(Date date) {
        return format(date, DEFAULT_DATE_PATTERN);
    }

    /**
     * 将日期对象转换成制定格式字符串
     *
     * @param date        日期对象
     * @param datePattern 日期格式
     * @return String
     */
    public static String format(Date date, String datePattern) {
        if (date != null) {
            SimpleDateFormat sd = new SimpleDateFormat(datePattern);
            return sd.format(date);
        } else {
            return null;
        }
    }

    /**
     * 使用参数Format将字符串转为Date
     */
    public static Date parse(String strDate, String pattern) {
        try {
            return StringUtils.isEmpty(strDate) ? null : new SimpleDateFormat(pattern).parse(strDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 使用默认参数Format将字符串转为Date
     */
    public static Date defaultParse(String strDate) {
        try {
            return StringUtils.isEmpty(strDate) ? null : new SimpleDateFormat(DEFAULT_DATE_PATTERN).parse(strDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }


    /**
     * 获取时间距离
     *
     * @param date 时间
     * @return str
     */
    public static String getStrDate(Date date) {
        if (date == null) {
            return "--";
        }
        // 定义最终返回的结果字符串。
        String interval;

        long millisecond = new Date().getTime() - date.getTime();

        long second = millisecond / 1000;

        if (second <= 0) {
            second = 0;
        }
        if (second == 0) {
            interval = "刚刚";
        } else if (second < 30) {
            interval = second + "秒前";
        } else if (second < 60) {
            interval = "半分钟前";
        } else if (second < 60 * 60) {//大于1分钟 小于1小时
            long minute = second / 60;
            interval = minute + "分钟前";
        } else if (second < 60 * 60 * 24) {//大于1小时 小于24小时
            long hour = (second / 60) / 60;
            interval = hour + "小时前";
        } else if (second <= 60 * 60 * 24 * 2) {//大于1D 小于2D
            interval = "昨天" + format(date, DATEFORMATTER_HHmm);
        } else if (second <= 60 * 60 * 24 * 7) {//大于2D小时 小于 7天
            long day = ((second / 60) / 60) / 24;
            interval = day + "天前";
        } else if (second <= 60 * 60 * 24 * 365) {//大于7天小于365天
            interval = format(date, DATEFORMATTER_MMDD_CN);
        } else {//大于365天
            interval = format(date, DATEFORMATTER_YYMM_CN);
        }

        return interval;

    }

}
