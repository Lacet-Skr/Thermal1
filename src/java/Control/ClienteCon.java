
package Control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Clase.Clientes;
import Procesos.ClienteProcesos;
import ProcesosImpl.ClienteProcesosImpl;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;

public class ClienteCon {
    private static ClienteProcesos clientepro=ClienteProcesosImpl.getInstancia();
    
    public  void evalua(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String evento = request.getParameter("evento");
        if("nuevo".equals(evento)){
            this.nuevoCliente(request, response);
        }else if("editar".equals(evento)){
            this.editarCliente(request, response);
        }else if("buscar".equals(evento)){
            this.buscarCliente(request, response);
        }
    }

    private void nuevoCliente(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        Clientes c = new Clientes();
        c.setIdcliente(Integer.parseInt(request.getParameter("idcliente")));
        c.setNombrecliente(request.getParameter("nombre"));
        c.setRfccliente(request.getParameter("rfc"));
        c.setCallecliente(request.getParameter("calle"));
        c.setNumextcliente(request.getParameter("numext"));
        c.setNumintcliente(request.getParameter("numint"));
        c.setColoniacliente(request.getParameter("colonia"));
        c.setLocalidadcliente(request.getParameter("localidad"));
        c.setReferenciacliente(request.getParameter("referencia"));
        c.setMunicipiocliente(request.getParameter("municipio"));
        c.setEstadocliente(request.getParameter("estatdo"));
        c.setPaiscliente(request.getParameter("pais"));
        c.setCpcliente(request.getParameter("cp"));
        c.setEmailcliente(request.getParameter("email"));
        c.setCreditocliente(Integer.parseInt(request.getParameter("credito")));
        c.setObservacionescliente(request.getParameter("observaciones"));
        c.setTipopagocliente(request.getParameter("tipopago"));
        c.setBancocliente(request.getParameter("banco"));
        c.setCuatrodigitoscliente(request.getParameter("cuatrodigitos"));
        c.setVendedor(Integer.parseInt(request.getParameter("vendedor")));
        clientepro.nuevoCliente(c);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void editarCliente(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        Clientes c=new Clientes();
        c.setIdcliente(Integer.parseInt(request.getParameter("idcliente")));
        c.setNombrecliente(request.getParameter("nombre"));
        c.setRfccliente(request.getParameter("rfc"));
        c.setCallecliente(request.getParameter("calle"));
        c.setNumextcliente(request.getParameter("numext"));
        c.setNumintcliente(request.getParameter("numint"));
        c.setColoniacliente(request.getParameter("colonia"));
        c.setLocalidadcliente(request.getParameter("localidad"));
        c.setReferenciacliente(request.getParameter("referencia"));
        c.setMunicipiocliente(request.getParameter("municipio"));
        c.setEstadocliente(request.getParameter("estatdo"));
        c.setPaiscliente(request.getParameter("pais"));
        c.setCpcliente(request.getParameter("cp"));
        c.setEmailcliente(request.getParameter("email"));
        c.setCreditocliente(Integer.parseInt(request.getParameter("credito")));
        c.setObservacionescliente(request.getParameter("observaciones"));
        c.setTipopagocliente(request.getParameter("tipopago"));
        c.setBancocliente(request.getParameter("banco"));
        c.setCuatrodigitoscliente(request.getParameter("cuatrodigitos"));
        c.setVendedor(Integer.parseInt(request.getParameter("vendedor")));
        clientepro.editarCliente(c);
        response.sendRedirect("index.jsp");
    }

    private void buscarCliente(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("par"));
        Clientes c = clientepro.buscarCliente(id);
        request.setAttribute("cliente", c);
        request.setAttribute("evento", "editar");
        request.getRequestDispatcher("clientes.jsp").forward(request, response);
    }
    public static ArrayList<Clientes>listarCliente(String nombre)throws ServletException, IOException{
        ArrayList<Clientes>list = clientepro.listarCliente(nombre);
        return list;
    }    
}
