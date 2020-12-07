package com.longevity.web.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


public abstract class IController<S, T> {
    protected S service;

    public IController(S service) {
        this.service = service;
    }

    @GetMapping("all")
    public String getAll(Model model) {
        return null;
    }

    @GetMapping("{id}")
    public String getById(@PathVariable(name = "id") T obj, Model model) {
        return null;
    }

    @PostMapping("add")
    public String add() {
        return null;
    }

    @PostMapping("{id}/update")
    public String update(@PathVariable(name = "id") T obj) {
        return null;
    }

    @GetMapping("{id}/delete")
    public String delete(@PathVariable(name = "id") T obj) {
        return null;
    }
}
