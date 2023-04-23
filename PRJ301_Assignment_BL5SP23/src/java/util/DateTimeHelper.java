/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author admin
 */
public class DateTimeHelper {

    public static Date addDays(Date day, int i) {
        Calendar c = Calendar.getInstance();
        c.setTime(day);
        c.add(Calendar.DATE, i);
        return c.getTime();
    }
    
    public static Date removeTime (Date day)
    {
        Calendar c = Calendar.getInstance();
        c.setTime(day);
        c.set(Calendar.MILLISECOND, 0);
        c.set(Calendar.SECOND, 0);
        c.set(Calendar.HOUR_OF_DAY, 0);
        c.set(Calendar.MINUTE, 0);
        
        return c.getTime();
    }
    
    public static java.sql.Date toDateSql (Date day)
    {
        day = removeTime(day);
        return new java.sql.Date(day.getTime());
    }
    
    public static Date toDateUtil (java.sql.Date day)
    {
        Date new_day = new Date(day.getTime());
        new_day = removeTime(new_day);
        return new_day;
    }
    
    public static ArrayList<java.sql.Date> getDatesList(java.sql.Date from, java.sql.Date to)
    {
        ArrayList<java.sql.Date> dates = new ArrayList<>();
        int days = 0;
        Date e_from = toDateUtil(from);
        Date e_to = toDateUtil(to);
        while(true)
        {
            Date d = addDays(e_from, days);
            dates.add(toDateSql(d));
            days ++;
            if (d.compareTo(e_to) >= 0)
                break;
        }
        return dates;
    }
    
    public static String getDayNameofWeek(java.sql.Date s)
    {
        Date d = toDateUtil(s);
        Calendar c = Calendar.getInstance();
        c.setTime(d);
        int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
        switch(dayOfWeek)
        {
            case 1: return "SUNDAY";
            case 2: return "MONDAY";
            case 3: return "TUEDAY";
            case 4: return "WEDNESDAY";
            case 5: return "THURSDAY";
            case 6: return "FRIDAY";
            case 7: return "SATURDAY";
        }
        return "Error";
    }
    
    public static int compare(java.sql.Date a, java.sql.Date b)
    {
       
        Date e_a = toDateUtil(a);
        Date e_b = toDateUtil(b);
        System.out.println(a + " " + b +" " +e_a.compareTo(e_b));
        return e_a.compareTo(e_b);
    }
}
