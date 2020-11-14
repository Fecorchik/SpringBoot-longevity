package com.longevity.web.domain.schedule;

public enum Day {
    MONDAY("Понедельник"),
    TUESDAY("Вторник"),
    WEDNESDAY("Среда"),
    THURSDAY("Четверг"),
    FRIDAY("Пятница"),
    SATURDAY("Суббота"),
    SUNDAY("Воскресенье");

    private String day;

    Day(String day) {
        this.day = day;
    }

    public String getDay() {
        return day;
    }
}
