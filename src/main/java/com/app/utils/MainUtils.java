package com.app.utils;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

public class MainUtils {
	
	public static String getFileType(String fileName) {
        String[] strArray = fileName.split("\\.");
        int suffixIndex = strArray.length -1;
        System.out.println(strArray[suffixIndex]);
        return strArray[suffixIndex];        
    }
	
	public static long getDatePoor(Date endDate, Date nowDate) {
		 
	    long nd = 1000 * 24 * 60 * 60;
	    long nh = 1000 * 60 * 60;
	    long nm = 1000 * 60;
	    // long ns = 1000;
	    // 获得两个时间的毫秒时间差异
	    long diff = endDate.getTime() - nowDate.getTime();
	    // 计算差多少天
	    long day = diff / nd;
	    // 计算差多少小时
	    long hour = diff % nd / nh;
	    // 计算差多少分钟
	    long min = diff % nd % nh / nm;
	    // 计算差多少秒//输出结果
	    // long sec = diff % nd % nh % nm / ns;
	    return hour;
	}
	
	//发帖积分
	public static int POSTVAL=10;
	//回帖积分
	public static int REPLYVAL=5;
	//登录积分
	public static int LOGINVAL=5;
public static int compareDdate(String DATE1, String DATE2) {
        
        
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        try {
            Date dt1 = df.parse(DATE1);
            Date dt2 = df.parse(DATE2);
            if (dt1.getTime() > dt2.getTime()) {
                System.out.println("dt1 在dt2前");
                return 1;
            } else if (dt1.getTime() < dt2.getTime()) {
                System.out.println("dt1在dt2后");
                return -1;
            } else {
                return 0;
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return 0;
    }
public static String getEcard()
{
	Random random = new Random();
	String ecard = "";
	for(int i=0;i<10;i++)
	{
		ecard+=random.nextInt(10);
	}
	return ecard;
}


	
	public static String encode(String in) 
	{
		try {
			return new String(in.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return in;
	}
	
	public static String getTime()
	{
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String dateTime = df.format(date);
		return dateTime;
	}
	
	public static Date convertTime(String in) throws ParseException
	{
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//Date date = new Date(in);
		System.out.println(in);
		Date date = df.parse(in);
		//String dateTime = df.format(date);
		return date;
	}
	
	public static String getYear(Date in)
	{		
		Calendar clr = Calendar.getInstance();
		clr.setTime(in);
		
		return clr.get(Calendar.YEAR)+"";
	}
	

	public static String getMouth(Date in)
	{
		Calendar clr = Calendar.getInstance();
		clr.setTime(in);
		
		return clr.get(Calendar.MONTH)+"";
	}
	
	
	public static String getOrderIdByUUId() {
        int machineId = 1;//最大支持1-9个集群机器部署
        int hashCodeV = UUID.randomUUID().toString().hashCode();
        if(hashCodeV < 0) {//有可能是负数
            hashCodeV = - hashCodeV;
        }
        // 0 代表前面补充0     
        // 4 代表长度为4     
        // d 代表参数为正数型
        return machineId + String.format("%015d", hashCodeV);
    }
	public static String getDay(Date in)
	{		
		Calendar clr = Calendar.getInstance();
		clr.setTime(in);
		
		return clr.get(Calendar.DAY_OF_MONTH)+"";
	}
}
