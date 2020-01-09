/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.Table;

/**
 *
 * @author GabrielAlejandro
 */
@Entity
@Table(name = "nota")
/*
@NamedQueries({
    @NamedQuery(name ="Nota.findByIds", query = "SELECT n FROM Nota n WHERE n.id_persona = :id_persona and n.id_categoria = :id_categoria")})
*/
public class Nota {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @ManyToOne
    @JoinColumn(name="id_persona", nullable = false)
    private Persona id_persona;
    
    @ManyToOne
    @JoinColumn(name="id_categoria", nullable = false)
    private Categoria id_categoria;
    
    @Column(name = "titulo")
    private String titulo;
    
    @Column(name = "contenido")
    private String contenido;
    
    @Column(name = "valorizacion")
    private String valorizacion;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Persona getId_persona() {
        return id_persona;
    }

    public void setId_persona(Persona id_persona) {
        this.id_persona = id_persona;
    }

    public Categoria getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(Categoria id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public String getValorizacion() {
        return valorizacion;
    }

    public void setValorizacion(String valorizacion) {
        this.valorizacion = valorizacion;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 79 * hash + this.id;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Nota other = (Nota) obj;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Nota{" + "id=" + id + '}';
    }
    /*
    public List<Nota> buscasNotas(int idPersona, int idCategoria){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("COCOPU");
        EntityManager em = emf.createEntityManager();
        EntityTransaction entr = em.getTransaction();
        entr.begin();
        Query query = em.createNamedQuery("Nota.findByIds").setParameter("id_persona", idPersona).setParameter("id_categoria", idCategoria);
        List<Nota> datos = (List<Nota>) query.getResultList();
        return datos;
    }
*/
    
}
