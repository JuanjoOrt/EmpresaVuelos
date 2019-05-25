package gestion;

import bd.AccesoBD;


import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.ServletException;

import modelo.Aeropuerto;

import modelo.Trayecto;

import modelo.TrayectoFijado;

import modelo.Usuario;

import modelo.Venta;

import modeloSql.AeropuertoSql;
import modeloSql.TrayectoSql;
import modeloSql.TrayectoFijadoSql;
import modeloSql.VentaSql;


public class AccionConfirmarCompra extends Accion {
        
    public void inicio() throws  IOException, java.lang.Exception{               
            
            int numeroAsientos = (int)session.getAttribute("numeroAsientos");
            AccesoBD conexion = (AccesoBD)session.getAttribute("usuarioConexion");
            Usuario usuarioPagina = (Usuario)session.getAttribute("usuarioPagina");
            TrayectoFijado TrayectoFijado = (TrayectoFijado)session.getAttribute("trayectoFijadoCompra");
            
            
            for(int i=1;i<=numeroAsientos; i++){
                String dni = request.getParameter("dni"+i);
                String nombre = request.getParameter("nombre"+i);
                int idVenta = VentaSql.obternerIdVenta(conexion);
                
                Venta venta = new Venta(idVenta, usuarioPagina, TrayectoFijado, dni , nombre);
                VentaSql.insertarVenta(conexion, venta);
            }
            
                irAPagina("/index.jsp", response, request);

        }

}