package com.longevity.web.domain.users;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "Profession")
@Data
public class Profession {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PROF_SEQ")
    @SequenceGenerator(sequenceName = "profession_seq", allocationSize = 1, name = "PROF_SEQ")
    private Long Id;
    private String name;
}
