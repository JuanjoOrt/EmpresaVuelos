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


public class AccionAsignarNuevoTrayecto extends Accion {
        
    public void inicio() throws  IOException, java.lang.Exception{               
                AccesoBD conexion = (AccesoBD)session.getAttribute("conexionAdmin");
                ArrayList<Aeropuerto> listaAeropuertos = AeropuertoSql.listaAeropuertos(conexion);


                session.setAttribute("listaAeropuertos", listaAeropuertos);
                irAPagina("/AsignarNuevoTrayecto.jsp", response, request);

    }
}