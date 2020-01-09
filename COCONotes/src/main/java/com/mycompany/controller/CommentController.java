/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import entities.Nota;
import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.inject.Inject;

/**
 *
 * @author GabrielAlejandro
 */
@ManagedBean(name = "Comment", eager = true)
@RequestScoped
public class CommentController implements Serializable{
    
    @Inject
    private ValorController valorcontroller;
    private Nota nota;
    
    @PostConstruct
    public void init(){
        this.nota = valorcontroller.getNota();
        
    }

    public Nota getNota() {
        return nota;
    }

    public void setNota(Nota nota) {
        this.nota = nota;
    }
    
    
    
 
}
