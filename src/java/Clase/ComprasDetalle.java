/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clase;
//hola

import java.util.Date;

public class ComprasDetalle {
    
    private int idcomprasdetalle;

    public int getIdcomprasdetalle() {
        return idcomprasdetalle;
    }

    public void setIdcomprasdetalle(int idcomprasdetalle) {
        this.idcomprasdetalle = idcomprasdetalle;
    }

    public int getCompra() {
        return compra;
    }

    public void setCompra(int compra) {
        this.compra = compra;
    }

    public Date getFechacomprasdetalle() {
        return fechacomprasdetalle;
    }

    public void setFechacomprasdetalle(Date fechacomprasdetalle) {
        this.fechacomprasdetalle = fechacomprasdetalle;
    }

    public int getProductocompras() {
        return productocompras;
    }

    public void setProductocompras(int productocompras) {
        this.productocompras = productocompras;
    }

    public double getCantidadcompras() {
        return cantidadcompras;
    }

    public void setCantidadcompras(double cantidadcompras) {
        this.cantidadcompras = cantidadcompras;
    }

    public double getCostocompras() {
        return costocompras;
    }

    public void setCostocompras(double costocompras) {
        this.costocompras = costocompras;
    }
    private int compra;
    private Date fechacomprasdetalle;
    private int productocompras;
    private double cantidadcompras;
    private double costocompras;
    
}
