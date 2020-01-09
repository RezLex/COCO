/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facades;

import entities.Usuarios;
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
public class UsuariosFacade extends AbstractFacade<Usuarios> {

    @PersistenceContext(unitName = "COCOAcademysPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuariosFacade() {
        super(Usuarios.class);
    }
    
    public Usuarios IniciarSesion(){
        Usuarios usuario = null;
        String consulta;
        try{
            consulta = "SELECT u FROM Usuarios u.user = 1? and u.password 2?";
            Query query = em.createQuery(consulta);
            //query.setParameter(1, us.);
            List<Usuarios> lista = query.getResultList();
            if(!lista.isEmpty()){
                usuario = lista.get(0);
            }
        }catch(Exception e){
            throw e;
        }finally{
            em.close();
        }
        return usuario;
    }
    
}
