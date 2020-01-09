/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facades;

import entities.Nota;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author GabrielAlejandro
 */
@Local
public interface NotaFacadeLocal {
      void create(Nota persona);

    void edit(Nota persona);

    void remove(Nota persona);

    Nota find(Object id);

    List<Nota> findAll();

    List<Nota> findRange(int[] range);

    int count();
    
    List<Nota> buscar(int idPersona, int idCategoria) throws Exception;
    
}
