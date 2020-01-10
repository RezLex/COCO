/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.enterprise.context.SessionScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;
import org.primefaces.model.menu.DefaultMenuModel;

/**
 *
 * @author GabrielAlejandro
 */
@ManagedBean(name = "Root")
@SessionScoped
public class RootController implements Serializable{
    
    public void cerrarSesion(){
        FacesContext.getCurrentInstance().getExternalContext().invalidateSession();
    }
    public void verificarSesion(){
        try{
           String root = (String) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
           
           if(root == null){
               FacesContext.getCurrentInstance().getExternalContext().redirect("failsesion.xhtml");
           }
        }catch(Exception e){
            
        }
    }
}
