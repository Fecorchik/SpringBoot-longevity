package com.longevity.web.domain.scripts;

import lombok.Data;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="note")
@Data
public class Note {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "CUSTOM_SCR_NOTE_SEQ")
    @SequenceGenerator(sequenceName = "custom_script_note_seq", allocationSize = 1, name = "CUSTOM_SCR_NOTE_SEQ")
    private Long id;

    private String note;

    @ManyToMany(mappedBy = "note")
    private Set<CustomScripts> customScripts;

    public Note() {}
    public Note(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "Note{" +
                "id=" + id +
                ", note='" + note + '\''+
                '}';
    }
}
