package gestion;

import bd.AccesoBD;


import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.ServletException;

import modelo.Aeropuerto;

import modelo.Trayecto;

import modeloSql.AeropuertoSql;
import modeloSql.TrayectoSql;


public class AccionAeropuertoOrigen extends Accion {
        
    public void inicio() throws  IOException, java.lang.Exception{               
                
            int idAeropuerto = Integer.parseInt(request.getParameter("aeropuerto"));
            AccesoBD conexion = (AccesoBD)session.getAttribute("conexionInv");
            
            Aeropuerto aeropuertoOrigen = AeropuertoSql.montarAeropuerto(conexion, idAeropuerto);
            ArrayList<Trayecto> listaTrayectos = TrayectoSql.ListaTrayectoAeropuerto(conexion, aeropuertoOrigen);
            
            
            session.setAttribute("listaTrayectos", listaTrayectos);
            session.setAttribute("aeropuertoOrigen", aeropuertoOrigen);
            irAPagina("/index.jsp", response, request);
        }

}