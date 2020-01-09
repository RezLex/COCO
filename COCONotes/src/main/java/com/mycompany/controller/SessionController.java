/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import entities.Usuario;
import java.io.Serializable;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author GabrielAlejandro
 */
@ManagedBean(name ="Ses")
@SessionScoped
public class SessionController implements Serializable {
    
    public void verificarSesion(){
        try{
           Usuario us = (Usuario) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
           
           if(us == null){
               FacesContext.getCurrentInstance().getExternalContext().redirect("./../failsesion.xhtml");
           }
        }catch(Exception e){
            
        }
    }
    
}
