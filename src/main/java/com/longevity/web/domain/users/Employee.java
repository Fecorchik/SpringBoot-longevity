package com.longevity.web.domain.users;

import com.longevity.web.domain.schedule.WorkSchedule;
import lombok.Data;

import javax.persistence.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "Employee")
@Data
public class Employee extends BaseUserEntity implements User {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "EMP_SEQ")
    @SequenceGenerator(sequenceName = "employee_seq", allocationSize = 1, name = "EMP_SEQ")
    private Long id;

    @OneToMany(
            fetch = FetchType.LAZY,
            cascade = CascadeType.ALL
    )
    private Set<Profession> profession = new HashSet<>();

    @OneToMany(
            fetch = FetchType.LAZY,
            cascade = CascadeType.ALL
    )
    private List<WorkSchedule> workSchedules;
//    private Set<WorkSchedule> workSchedules = new HashSet<>();
}
