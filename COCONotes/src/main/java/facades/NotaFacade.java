/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facades;

import entities.Nota;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author GabrielAlejandro
 */
@Stateless
public class NotaFacade extends AbstractFacade<Nota> implements NotaFacadeLocal {
    
     @PersistenceContext(unitName = "COCOPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public NotaFacade() {
        super(Nota.class);
    }

    @Override
    public List<Nota> buscar(int idPersona, int idCategoria) throws Exception {
        List<Nota> lista;
        try{
           
            Query query = em.createQuery("SELECT n FROM Nota n WHERE n.id_persona = :id_persona and n.id_categoria = :id_categoria");
            query.setParameter("id_persona", idPersona);
            query.setParameter("id_categoria", idCategoria);
            
            lista = query.getResultList();
        }catch(Exception e){
            throw e;
        }
        return lista;
    }
}
