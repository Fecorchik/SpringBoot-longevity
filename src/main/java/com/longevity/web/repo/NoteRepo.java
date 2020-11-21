package com.longevity.web.repo;

import com.longevity.web.domain.scripts.Note;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NoteRepo extends JpaRepository<Note, Long> {
}
