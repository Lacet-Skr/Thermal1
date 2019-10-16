package DAO.Factory;

/**
 *
 * @author Luis Maya
 */

import Datos.BDUsuarios;
import DAO.UsuarioDAO;

public class UsuarioDaoFactory {
    public static UsuarioDAO crear(){
        return new BDUsuarios();
    }
}
