package com.longevity.web.domain.services;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name="Services")
@Data
public class Services {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SERVICES_SEQ")
    @SequenceGenerator(sequenceName = "services_seq", allocationSize = 1, name = "SERVICES_SEQ")
    private Long id;

    private String name;
    private Double price;
}
