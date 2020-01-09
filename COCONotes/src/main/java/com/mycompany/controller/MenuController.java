/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import entities.Menu;
import entities.Usuario;
import facades.MenuFacadeLocal;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;
import org.primefaces.model.menu.DefaultMenuItem;
import org.primefaces.model.menu.DefaultMenuModel;
import org.primefaces.model.menu.DefaultSubMenu;
import org.primefaces.model.menu.MenuModel;

/**
 *
 * @author GabrielAlejandro
 */
@ManagedBean(name = "Menu")
@SessionScoped
public class MenuController implements Serializable {

    @EJB
    private MenuFacadeLocal EJBMenu;
    private List<Menu> lista;
    private MenuModel model;

    @PostConstruct
    public void init() {
        this.listarMenus();
        model = new DefaultMenuModel();
        this.establecerPermisos();
    }

    public void listarMenus() {
        try {
            lista = EJBMenu.findAll();
        } catch (Exception e) {

        }

    }

    public MenuFacadeLocal getEJBMenu() {
        return EJBMenu;
    }

    public void setEJBMenu(MenuFacadeLocal EJBMenu) {
        this.EJBMenu = EJBMenu;
    }

    public List<Menu> getLista() {
        return lista;
    }

    public void setLista(List<Menu> lista) {
        this.lista = lista;
    }

    public MenuModel getModel() {
        return model;
    }

    public void setModel(MenuModel model) {
        this.model = model;
    }

    public void establecerPermisos() {
        Usuario us = (Usuario) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
        for (Menu m : lista) {
            if (m.getTipo().equals("Submenu")&&m.getTipoUsuario().equals(us.getTipo())) {
                DefaultSubMenu firstSubmenu = new DefaultSubMenu(m.getNombre());
                for (Menu i : lista) {
                    Menu SubMenu = i.getCodSubmenu();
                    if (SubMenu != null) {
                        if (SubMenu.getId() == m.getId()) {
                            DefaultMenuItem item = new DefaultMenuItem(i.getNombre());
                            item.setUrl(i.getUrl());
                            firstSubmenu.addElement(item);
                        }
                    }
                }
                model.addElement(firstSubmenu);
            } else {
                if(m.getCodSubmenu() == null &&m.getTipoUsuario().equals(us.getTipo())) {
                    DefaultMenuItem item = new DefaultMenuItem(m.getNombre());
                    item.setUrl(m.getUrl());
                    model.addElement(item);
                }

            }
        }
    }
    
    public void cerrarSesion(){
        FacesContext.getCurrentInstance().getExternalContext().invalidateSession();
    }
    
    public String mostrar_us(){
        Usuario us = (Usuario) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
        return us.getUsuario();
    } 

}
