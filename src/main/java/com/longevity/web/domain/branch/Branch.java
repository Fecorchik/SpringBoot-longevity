package com.longevity.web.domain.branch;

import com.longevity.web.domain.schedule.WorkSchedule;
import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "Branch")
@Data
public class Branch {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "BRANCH_SEQ")
    @SequenceGenerator(sequenceName = "branch_seq", allocationSize = 1, name = "BRANCH_SEQ")
    private Long id;
    private String name;
    @OneToMany(
            fetch = FetchType.LAZY,
            cascade = CascadeType.ALL
    )
    private List<WorkSchedule> workSchedule;
}
