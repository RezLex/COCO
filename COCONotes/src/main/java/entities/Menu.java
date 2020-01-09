/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author GabrielAlejandro
 */
@Entity
@Table(name="menu")
public class Menu {
    
    @Id
    private int id;
    
    @Column(name = "nombre")
    private String nombre;
    
    @Column(name = "tipo")
    private String tipo;
    
    @Column(name = "url")
    private String url;
    
    @Column(name = "tipo_usuario")
    private String TipoUsuario;
    
    @ManyToOne
    @JoinColumn(name="cod_submenu")
    private Menu CodSubmenu;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getTipoUsuario() {
        return TipoUsuario;
    }

    public void setTipoUsuario(String TipoUsuario) {
        this.TipoUsuario = TipoUsuario;
    }

    public Menu getCodSubmenu() {
        return CodSubmenu;
    }

    public void setCodSubmenu(Menu CodSubmenu) {
        this.CodSubmenu = CodSubmenu;
    }
    
    

    
    
    
}
