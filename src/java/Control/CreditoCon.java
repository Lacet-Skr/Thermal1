
package Control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Clase.Creditos;
import Procesos.CreditoProcesos;
import ProcesosImpl.CreditoProcesosImpl;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;

public class CreditoCon {
    private static CreditoProcesos creditopro= CreditoProcesosImpl.getInstancia();
    
    public void evalua(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String evento = request.getParameter("evento");
        if("nuevo".equals(evento)){
            this.nuevoCredito(request, response);
        }else if("editar".equals(evento)){
            this.editarCredito(request, response);
        }else if("buscar".equals(evento)){
            this.buscarCredito(request, response);
        }
    } 

    private void nuevoCredito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Creditos d = new Creditos();
        d.setIdcredito(Integer.parseInt(request.getParameter("idcredito")));
        d.setDescripcioncredito(request.getParameter("nombre"));
        d.setDiascredito(Integer.parseInt(request.getParameter("dias")));
        creditopro.nuevoCredito(d);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void editarCredito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Creditos d = new Creditos();
        d.setIdcredito(Integer.parseInt(request.getParameter("idcredito")));
        d.setDescripcioncredito(request.getParameter("nombre"));
        d.setDiascredito(Integer.parseInt(request.getParameter("dias")));
        creditopro.editarCredito(d);
        response.sendRedirect("index.jsp");
    }

    private void buscarCredito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("par"));
        Creditos d = creditopro.buscarCredito(id);
        request.setAttribute("credito", d);        
        request.setAttribute("evento", "editar");
        request.getRequestDispatcher("creditos.jsp").forward(request, response);
    }
    public static ArrayList<Creditos>listarCreditos(String nombre)throws ServletException, IOException{
        ArrayList<Creditos>list = creditopro.listarCredito(nombre);
        return list;
    }
    public static ArrayList<Creditos>listarCreditos2()throws ServletException, IOException{
        ArrayList<Creditos>list = creditopro.listarCredito2();
        return list;
    }    
}
