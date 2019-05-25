package gestion;

import bd.AccesoBD;


import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.ServletException;

import modelo.Aeropuerto;

import modelo.Trayecto;

import modelo.TrayectoFijado;

import modelo.Usuario;

import modeloSql.AeropuertoSql;
import modeloSql.TrayectoSql;
import modeloSql.TrayectoFijadoSql;


public class AccionComprarTrayecto extends Accion {
        
    public void inicio() throws  IOException, java.lang.Exception{               
                
            int idTrayectoFijado = Integer.parseInt(request.getParameter("idTrayectoFijado"));
            int numeroAsientos = Integer.parseInt(request.getParameter("Asientos"));
            AccesoBD conexion = new AccesoBD("EV_INVITADO","1234");
            TrayectoFijado trayectoFijado = TrayectoFijadoSql.montarTrayectoFijado(conexion, idTrayectoFijado);
            Usuario usuarioPagina = (Usuario)session.getAttribute("usuarioPagina"); 
            
            session.setAttribute("numeroAsientos", numeroAsientos);
            session.setAttribute("trayectoFijadoCompra", trayectoFijado);
            
            if (usuarioPagina == null) {
                irAPagina("/confirmarUsuario.jsp", response, request);
            }else{
                irAPagina("/verificarCompra.jsp", response, request);
            }
        }

}