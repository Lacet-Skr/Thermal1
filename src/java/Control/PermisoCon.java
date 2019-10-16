/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Clase.*;
import Procesos.*;
import ProcesosImpl.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;

/**
 *
 * @author LACET
 */
public class PermisoCon {
    private static PermisoProcesos permisopro=PermisoProcesosImpl.getInstancia();
    
    public void evalua(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String evento = request.getParameter("evento");
         if("nuevo".equals(evento)){
             this.nuevoPermiso(request, response);
     }
    }
    
    private void nuevoPermiso (HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        int lon = Integer.parseInt(request.getParameter("longitud"));//aqui lo que hacemos es traer el valor de la longitud de los elementos que vienen
        //int longg = Integer.parseInt(request.getParameter("nadita"));
        //************************proceso de borrar**************************************************
        int id1 = (Integer.parseInt(request.getParameter("idusuario")));//traemos el id del usuario
            ArrayList<Permisos> list= permisopro.listarPermisos(id1);//listamos todos los permidod del usuario
            for(Permisos lol : list){//hacemos un for para que se recorran todos
                int idper = lol.getIdpermiso();//aqui tremos el id del permiso
                permisopro.borrarPermisos(idper);//aqui ocupamos el metodo borrar para que valla a borrar el permiso dependiendo el id
            }
            //**********************proceso de guardar*****************************
        Permisos p = new Permisos();
        int id = permisopro.ulPermiso();//almacenamos en una variable el ultimo permiso
        int idus = Integer.parseInt(request.getParameter("idusuario"));
        for(int i=0; i<lon; i++) {//hacemos un for el cual se va repetir las veces de la longitud
        String ll = "a" + String.valueOf(i+1);//aqui ponemos en una variable el name del menu este va a variar dependiendo de i
        p.setIdpermiso(id);//mandamos el id que pertenecera al nuevo registro
        p.setUsuario(idus);//traemos el id del usuario(cada procesos el id va a ser el mismo)
        p.setMenu(Integer.parseInt(request.getParameter(ll)));//traemos el menu
        permisopro.nuevoPermisos(p);//ocupamos el metodo nuevo para que lo valla guardando
        id++;//le aumentamos 1 al valor de id ya que solo trae el ultimo una sola vez y asi se va a ir amentando
       }
        request.getRequestDispatcher("panel.jsp").forward(request, response);
        }
                
    
    public static ArrayList<Permisos>permisos(int idm)throws ServletException, IOException{
        ArrayList<Permisos> list = permisopro.listarPermisos(idm);
        return list;
    }
     
}
