package com.longevity.web.domain.branch;

import com.longevity.web.domain.schedule.CabinetEmployee;
import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "Cabinet")
@Data
public class Cabinet {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "CAB_SEQ")
    @SequenceGenerator(sequenceName = "cabinet_seq", allocationSize = 1, name = "CAB_SEQ")
    private Long id;
    private String name;

    @OneToOne(
            fetch = FetchType.EAGER)
    private Branch branch;

    @OneToMany(fetch = FetchType.LAZY)
    private List<CabinetEmployee> cabinetEmployee;
}
