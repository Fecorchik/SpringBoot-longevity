package com.longevity.web.domain.recording;

public enum RecordingType {
    PRIMOTY("Первичный"),
    SECONDARY("Вторичный");

    private String type;

    RecordingType(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }
}
