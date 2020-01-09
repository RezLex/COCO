/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author GabrielAlejandro
 */
@Entity
@Table(name = "maestros")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Maestros.findAll", query = "SELECT m FROM Maestros m")
    , @NamedQuery(name = "Maestros.findById", query = "SELECT m FROM Maestros m WHERE m.id = :id")
    , @NamedQuery(name = "Maestros.findByNombres", query = "SELECT m FROM Maestros m WHERE m.nombres = :nombres")
    , @NamedQuery(name = "Maestros.findByApellidos", query = "SELECT m FROM Maestros m WHERE m.apellidos = :apellidos")})
public class Maestros implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 16)
    @Column(name = "ID")
    private String id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "Nombres")
    private String nombres;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "Apellidos")
    private String apellidos;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idMaestro")
    private Collection<Cursos> cursosCollection;

    public Maestros() {
    }

    public Maestros(String id) {
        this.id = id;
    }

    public Maestros(String id, String nombres, String apellidos) {
        this.id = id;
        this.nombres = nombres;
        this.apellidos = apellidos;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    @XmlTransient
    public Collection<Cursos> getCursosCollection() {
        return cursosCollection;
    }

    public void setCursosCollection(Collection<Cursos> cursosCollection) {
        this.cursosCollection = cursosCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Maestros)) {
            return false;
        }
        Maestros other = (Maestros) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Maestros[ id=" + id + " ]";
    }
    
}
