package com.longevity.web.domain.services;

public enum StatusScore {
    PAID("Оплачено"), NOT_PAID("Не оплачено");

    private String status;

    StatusScore(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }
}
