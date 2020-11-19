package com.longevity.web.domain.scripts;

import com.longevity.web.domain.services.Services;
import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "scenario")
@Data
public class Scripts {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SCR_SEQ")
    @SequenceGenerator(sequenceName = "script_seq", allocationSize = 1, name = "SCR_SEQ")
    private Long id;
    private String name;

    @ManyToMany(fetch = FetchType.EAGER)
    private List<Services> services;

    @OneToOne(fetch = FetchType.EAGER)
    private ScriptGroup scriptGroup;
}
