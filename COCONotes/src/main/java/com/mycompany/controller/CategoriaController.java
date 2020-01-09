/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import entities.Categoria;
import facades.CategoriaFacadeLocal;
import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.SessionScoped;
import javax.inject.Named;
import javax.faces.bean.ManagedBean;
import javax.inject.Inject;

/**
 *
 * @author GabrielAlejandro
 */
@ManagedBean(name ="Cat")
@SessionScoped
public class CategoriaController implements Serializable {
    
    @EJB
    private CategoriaFacadeLocal categoriaEJB;
    
    @Inject
    private Categoria categoria;

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }
    
    
    
    @PostConstruct
    public void init(){
        //categoria = new Categoria();
    }
    
    public void registrar(){
        try{
            categoriaEJB.create(categoria);
        }catch(Exception e){
            
        }
    }
}
