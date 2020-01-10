/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import entities.Usuario;
import facades.UsuarioFacadeLocal;
import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author GabrielAlejandro
 */
@ManagedBean(name = "Log")
@SessionScoped
public class LoginController implements Serializable {

    @EJB
    private UsuarioFacadeLocal EJBUsuario;
    private Usuario usuario;

    @PostConstruct
    public void init() {
        usuario = new Usuario();
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public String iniciarSesion() {
        Usuario us;
        Boolean root = EJBUsuario.root(usuario);
        String redireccion = null;
        try {
            if (root) {
                FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("usuario", "root");
                redireccion = "/ROOT?faces-redirect=true";
            } else {
                us = EJBUsuario.iniciarSesion(usuario);
                if (us != null) {
                    FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("usuario", us);
                    redireccion = "/protegido/principal?faces-redirect=true";
                }
            }
        } catch (Exception e) {

        }
        return redireccion;
    }

}
