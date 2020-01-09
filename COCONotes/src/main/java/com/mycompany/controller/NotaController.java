/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import entities.Categoria;
import entities.Nota;
import entities.Persona;
import entities.Usuario;
import facades.CategoriaFacadeLocal;
import facades.NotaFacadeLocal;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.inject.Inject;

/**
 *
 * @author GabrielAlejandro
 */
@ManagedBean(name = "NewNota")
@SessionScoped
public class NotaController implements Serializable {

    @EJB
    private NotaFacadeLocal notaEJB;

    @EJB
    private CategoriaFacadeLocal categoriaEJB;

    @Inject
    private Nota nota;

    @Inject
    private Categoria categoria;

    private List<Categoria> categorias;

    public Nota getNota() {
        return nota;
    }

    public void setNota(Nota nota) {
        this.nota = nota;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public List<Categoria> getCategorias() {
        return categorias;
    }

    public void setCategorias(List<Categoria> categorias) {
        this.categorias = categorias;
    }

    @PostConstruct
    public void init() {
        categorias = categoriaEJB.findAll();
    }

    public void registrar() {

        try {
            Usuario us = (Usuario) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
            nota.setId_categoria(categoria);
            nota.setId_persona(us.getId());
            notaEJB.create(nota);
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Aviso", "Nota Creada!"));
        } catch (Exception e) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_FATAL, "Error", "Error"));
        }

    }

}
