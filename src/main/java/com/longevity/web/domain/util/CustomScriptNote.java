package com.longevity.web.domain.util;

import com.longevity.web.domain.scripts.Note;
import com.longevity.web.domain.services.Services;
import lombok.Data;

import java.util.List;

@Data
public class CustomScriptNote {
    private List<Services> servicesList;
    private List<Note> noteList;
}
