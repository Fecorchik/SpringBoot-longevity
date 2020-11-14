package com.longevity.web.domain.schedule;

import com.longevity.web.domain.users.Employee;
import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class CabinetEmployee {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "CAB_EMP_SEQ")
    @SequenceGenerator(sequenceName = "cabinet_employee_seq", allocationSize = 1, name = "CAB_EMP_SEQ")
    private Long id;

    @Enumerated(EnumType.STRING)
    @Column(name = "day")
    private Day day;

    @OneToOne(fetch = FetchType.EAGER)
    private Employee employee;


    public CabinetEmployee() {
    }

    public CabinetEmployee(Day day, Employee employee) {
        this.day = day;
        this.employee = employee;
    }
}
