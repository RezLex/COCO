/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import entities.Categoria;
import entities.Nota;
import entities.Usuario;
import facades.CategoriaFacadeLocal;
import facades.NotaFacadeLocal;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author GabrielAlejandro
 */
@ManagedBean(name = "Bus")
@SessionScoped
public class BuscarController implements Serializable {

    @EJB
    private CategoriaFacadeLocal categoriaEJB;

    @EJB
    private NotaFacadeLocal notaEJB;

    private List<Categoria> listaCategoria;
    private List<Nota> listaNotas;
    private int idCategoria;

    public List<Nota> getListaNotas() {
        return listaNotas;
    }

    public void setListaNotas(List<Nota> listaNotas) {
        this.listaNotas = listaNotas;
    }
    

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public List<Categoria> getListaCategoria() {
        return listaCategoria;
    }

    public void setListaCategoria(List<Categoria> listaCategoria) {
        this.listaCategoria = listaCategoria;
    }

    @PostConstruct
    public void init() {
        listaCategoria = categoriaEJB.findAll();
    }

    public void buscar() {
        try {
            //Nota nota = new Nota();
            
            Usuario us = (Usuario) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
            listaNotas = notaEJB.buscar(us.getId(), idCategoria);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }
}
