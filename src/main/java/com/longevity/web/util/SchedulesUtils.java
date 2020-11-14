package com.longevity.web.util;

import com.longevity.web.domain.schedule.CabinetEmployee;
import com.longevity.web.domain.schedule.Day;
import com.longevity.web.domain.schedule.WorkSchedule;
import com.longevity.web.domain.users.Employee;

import java.util.*;

public class SchedulesUtils {


    public static List<WorkSchedule> SetDaySchedules() {
        String time = "00:00";
        List<WorkSchedule> schedules = new ArrayList<>(
                List.of(
                        new WorkSchedule(Day.MONDAY,time,time), new WorkSchedule(Day.TUESDAY,time,time),
                        new WorkSchedule(Day.WEDNESDAY,time,time),new WorkSchedule(Day.THURSDAY,time,time),
                        new WorkSchedule(Day.FRIDAY,time,time), new WorkSchedule(Day.SATURDAY,time,time),
                        new WorkSchedule(Day.SUNDAY,time,time)
                )
        );
        return schedules;
    }

    public static HashMap<String, HashMap<String, String>> getMapFromForm(Map<String, String> form){
        HashMap<String, HashMap<String, String>> work = new HashMap<>();
        EnumSet.allOf(Day.class).forEach(d -> work.put(d.name(), new HashMap<String, String>()));
        form.forEach((key, value) -> {
            String[] arr = key.split("\\.");
            if(arr.length > 1){
                if(!Day.valueOf(arr[0]).name().isEmpty()){
                    if("start".equals(arr[1])){
                        if(!work.get(arr[0]).equals(arr[1])){
                            work.get(arr[0]).put("start", value);
                        }
                    }
                    else if("end".equals(arr[1])){
                        if(!work.get(arr[0]).equals(arr[1])){
                            work.get(arr[0]).put("end", value);
                        }
                    }
                }
            }
        });
        return work;
    }

    public static List<WorkSchedule> getWorkSchedule(List<WorkSchedule> workSchedule, HashMap<String, HashMap<String, String>> map){
        workSchedule.forEach(work -> {
            work.setTimeStartWork(map.get(work.getDay().name()).get("start"));
            work.setTimeEndWork(map.get(work.getDay().name()).get("end"));
        });
        return workSchedule;
    }


    public static List<CabinetEmployee> getNewListCabinetEmployee(Employee employee){
        return new ArrayList<>(
                List.of(
                        new CabinetEmployee(Day.MONDAY, employee), new CabinetEmployee(Day.TUESDAY, employee),
                        new CabinetEmployee(Day.WEDNESDAY, employee),new CabinetEmployee(Day.THURSDAY, employee),
                        new CabinetEmployee(Day.FRIDAY, employee), new CabinetEmployee(Day.SATURDAY, employee),
                        new CabinetEmployee(Day.SUNDAY, employee)
                )
        );
    }
}
