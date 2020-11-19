package com.longevity.web.domain.scripts;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name="script_group")
@Data
public class ScriptGroup {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SCR_GROUP_SEQ")
    @SequenceGenerator(sequenceName = "script_group_seq", allocationSize = 1, name = "SCR_GROUP_SEQ")
    private Long id;
    private String name;
}
