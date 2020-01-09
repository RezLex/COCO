/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import entities.Persona;
import entities.Usuario;
import facades.UsuarioFacadeLocal;
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
@ManagedBean(name ="Us")
@SessionScoped
public class UsuarioController {
    
    @EJB
    private UsuarioFacadeLocal usuarioEJB;
    
    @Inject
    private Usuario usuario;
    @Inject
    private Persona persona;
    
    @PostConstruct
    public void init(){
        //usuario = new Usuario();
       // persona = new Persona();
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }
    
    public void registrar(){
        try{
            this.usuario.setId(persona);
            usuarioEJB.create(usuario);
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,"Aviso","Registro Correcto!"));
        }catch(Exception e){
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_FATAL,"Error","Error"));
        }
    }
    
}
