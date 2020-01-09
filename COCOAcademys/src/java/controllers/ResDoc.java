/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Maestros;
import entities.Usuarios;
import java.io.Serializable;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

/**
 *
 * @author GabrielAlejandro
 */
@Named("resDoc")
@SessionScoped
public class ResDoc implements Serializable{
    @EJB
    private facades.UsuariosFacade ejbUser;
    private Usuarios user;
    private Maestros Doc;
    @PostConstruct
    public void  init(){
        user = new Usuarios();
        Doc = new Maestros();     
        
    }

    public Usuarios getUser() {
        return user;
    }

    public void setUser(Usuarios user) {
        this.user = user;
    }

    public Maestros getDoc() {
        return Doc;
    }

    public void setDoc(Maestros Doc) {
        this.Doc = Doc;
    }
    
    public void registrar(){
        try{

            ejbUser.create(user);
            
        }catch(Exception e){
            
        }
    }
    
    
    
}
