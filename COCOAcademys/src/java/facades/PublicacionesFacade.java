/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facades;

import entities.Publicaciones;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author GabrielAlejandro
 */
@Stateless
public class PublicacionesFacade extends AbstractFacade<Publicaciones> {

    @PersistenceContext(unitName = "COCOAcademysPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PublicacionesFacade() {
        super(Publicaciones.class);
    }
    
}
