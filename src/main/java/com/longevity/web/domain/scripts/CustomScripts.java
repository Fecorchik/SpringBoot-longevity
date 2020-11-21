package com.longevity.web.domain.scripts;

import com.longevity.web.domain.services.Services;
import com.longevity.web.domain.users.Client;
import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="custom_script")
@Data
public class CustomScripts {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "CUSTOM_SCR_SEQ")
    @SequenceGenerator(sequenceName = "custom_script_seq", allocationSize = 1, name = "CUSTOM_SCR_SEQ")
    private Long id;

    @ManyToOne
    private Client client;

    @ManyToMany(fetch = FetchType.EAGER)
    private List<Services> services;

    @ManyToMany()
    @JoinTable(
            name="custom_script_note",
            joinColumns = @JoinColumn(name = "custom_script_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "note_id", referencedColumnName = "id")
    )
    private List<Note> note;
}
