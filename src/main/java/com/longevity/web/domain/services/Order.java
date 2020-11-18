package com.longevity.web.domain.services;

import com.longevity.web.domain.users.Client;
import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="Orders")
@Data
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ORDER_SEQ")
    @SequenceGenerator(sequenceName = "order_seq", allocationSize = 1, name = "ORDER_SEQ")
    private Long id;

    @OneToMany(fetch = FetchType.EAGER)
    private List<Services> services;

    @OneToOne(fetch = FetchType.EAGER)
    private Client client;

    @Enumerated(EnumType.STRING)
    @Column(name = "status")
    private StatusScore statusScore;
}
