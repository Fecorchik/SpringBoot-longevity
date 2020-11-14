package com.longevity.web.domain.schedule;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "work_schedule")
@Data
public class WorkSchedule {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "WORK_SEQ")
    @SequenceGenerator(sequenceName = "work_schedule_seq", allocationSize = 1, name = "WORK_SEQ")
    private Long Id;

    @Enumerated(EnumType.STRING)
    @Column(name = "day")
    private Day day;

    @JoinColumn(name = "time_start_work")
    private String timeStartWork;

    @JoinColumn(name = "time_end_work")
    private String timeEndWork;

    public WorkSchedule() {}

    public WorkSchedule(Day day) {
        this.day = day;
    }

    public WorkSchedule(Day day, String timeStartWork, String timeEndWork) {
        this.day = day;
        this.timeStartWork = timeStartWork;
        this.timeEndWork = timeEndWork;
    }
}
