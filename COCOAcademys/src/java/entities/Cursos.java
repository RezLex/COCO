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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
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
@Table(name = "cursos")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cursos.findAll", query = "SELECT c FROM Cursos c")
    , @NamedQuery(name = "Cursos.findById", query = "SELECT c FROM Cursos c WHERE c.id = :id")
    , @NamedQuery(name = "Cursos.findByNombre", query = "SELECT c FROM Cursos c WHERE c.nombre = :nombre")
    , @NamedQuery(name = "Cursos.findByNAlumnos", query = "SELECT c FROM Cursos c WHERE c.nAlumnos = :nAlumnos")})
public class Cursos implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 16)
    @Column(name = "ID")
    private String id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "Nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Column(name = "n_alumnos")
    private int nAlumnos;
    @JoinColumn(name = "id_maestro", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Maestros idMaestro;
    @JoinColumn(name = "ID", referencedColumnName = "id_curso", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Alumnos alumnos;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idCurso")
    private Collection<Publicaciones> publicacionesCollection;

    public Cursos() {
    }

    public Cursos(String id) {
        this.id = id;
    }

    public Cursos(String id, String nombre, int nAlumnos) {
        this.id = id;
        this.nombre = nombre;
        this.nAlumnos = nAlumnos;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNAlumnos() {
        return nAlumnos;
    }

    public void setNAlumnos(int nAlumnos) {
        this.nAlumnos = nAlumnos;
    }

    public Maestros getIdMaestro() {
        return idMaestro;
    }

    public void setIdMaestro(Maestros idMaestro) {
        this.idMaestro = idMaestro;
    }

    public Alumnos getAlumnos() {
        return alumnos;
    }

    public void setAlumnos(Alumnos alumnos) {
        this.alumnos = alumnos;
    }

    @XmlTransient
    public Collection<Publicaciones> getPublicacionesCollection() {
        return publicacionesCollection;
    }

    public void setPublicacionesCollection(Collection<Publicaciones> publicacionesCollection) {
        this.publicacionesCollection = publicacionesCollection;
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
        if (!(object instanceof Cursos)) {
            return false;
        }
        Cursos other = (Cursos) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Cursos[ id=" + id + " ]";
    }
    
}
