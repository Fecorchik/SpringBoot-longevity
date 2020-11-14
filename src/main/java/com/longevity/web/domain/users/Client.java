package com.longevity.web.domain.users;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "Client")
@Data
public class Client extends BaseUserEntity implements User {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "CLIENT_SEQ")
    @SequenceGenerator(sequenceName = "client_seq", allocationSize = 1, name = "CLIENT_SEQ")
    private Long id;

    @Column(name = "email")
    private String email;
    @Column(name = "phone")
    private String phone;
}
