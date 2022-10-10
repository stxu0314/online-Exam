package vip.grmz.onlineexam.utils;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author: 苏
 * @createDate: 2022-09-03 16:56
 * @description:
 */
public class TimeUtils {


    public static void main(String[] args) {

    }

    public static  Date sqlStringToDate(String str){
        SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String[] ts = str.split("T");
        String s = (ts[0] + " " + ts[1]);
        try {
            Date parse = date.parse(s);
            return parse;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static Date stringToDate(String str){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date parse = null;
        try {
            parse = dateFormat.parse(str);
        } catch (ParseException e) {
            return null;
        }
        return parse;
    }

    public  static  String dateToString(Date date){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = null;
        if (date != null){
            format = dateFormat.format(date);
        }
        return format;
    }

    public static String dateToString(java.sql.Date date){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = null;
        if (date != null){
            format = dateFormat.format(date);
        }
        return format;
    }


    public static String dateToString(Timestamp date){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = null;
        if (date != null){
            format = dateFormat.format(date);
        }
        return format;
    }

}
