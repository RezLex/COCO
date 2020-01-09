/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import entities.Nota;
import facades.NotaFacadeLocal;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

/**
 *
 * @author GabrielAlejandro
 */
@ManagedBean(name = "Val")
@SessionScoped
public class ValorController implements Serializable {
    
    @EJB
    private NotaFacadeLocal notaEJB;
    private List<Nota> notas;
    private Nota nota;

    public List<Nota> getNotas() {
        return notas;
    }

    public void setNotas(List<Nota> notas) {
        this.notas = notas;
    }
    
    
    
    @PostConstruct
    public void init(){
        notas = notaEJB.findAll();
    }
    
    public void asignar(Nota nota){
        this.nota = nota;
        
    }

    public Nota getNota() {
        return nota;
    }

    public void setNota(Nota nota) {
        this.nota = nota;
    }
    
    public String registrar(){
        notaEJB.edit(nota);
        String url="valorar.COCONotes?faces-redirect=true";
        return url;
    }
    
    
    
}
