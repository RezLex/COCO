/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import entities.Telefono;
import entities.Usuario;
import facades.TelefonoFacadeLocal;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.inject.Inject;

/**
 *
 * @author GabrielAlejandro
 */
@ManagedBean(name ="Tel")
@SessionScoped
public class TelefonoController implements Serializable {
    
    @EJB
    private TelefonoFacadeLocal telefonoEJB;
    
    @Inject
    private Telefono telefono;
    private List<Telefono> telefonos;
    private String act;

    public String getAct() {
        return act;
    }

    public void setAct(String act) {
        this.act = act;
    }
    
    
    public Telefono getTelefono() {
        return telefono;
    }

    public void setTelefono(Telefono telefono) {
        this.telefono = telefono;
    }

    public List<Telefono> getTelefonos() {
        return telefonos;
    }

    public void setTelefonos(List<Telefono> telefonos) {
        this.telefonos = telefonos;
    }
    
    
    
    @PostConstruct
    public void init(){
        
        telefonos = telefonoEJB.findAll();
        
    }
    
    public void registrar(){
        Usuario us = (Usuario) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
        telefono.setPersona(us.getId());
        telefonoEJB.create(telefono);
        telefonos = telefonoEJB.findAll();
    }
    
    public void leer(Telefono TelfS){
        telefono = TelfS;
        this.setAct("M");
        
    }
    
    public void modify(){
        telefonoEJB.edit(telefono);
    }
    
    
}
