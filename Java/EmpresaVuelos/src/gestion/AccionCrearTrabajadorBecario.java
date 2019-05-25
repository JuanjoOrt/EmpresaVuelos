package gestion;

import bd.AccesoBD;

import java.io.IOException;

import java.sql.Date;

import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;

import modelo.Aeropuerto;
import modelo.Avion;
import modelo.Becario;
import modelo.Fijo;
import modelo.Usuario;

import modeloSql.AeropuertoSql;
import modeloSql.AvionSql;
import modeloSql.TrabajadorSql;
import modeloSql.UsuarioSql;

public class AccionCrearTrabajadorBecario extends Accion {
        
    public void inicio() throws ServletException, IOException, java.lang.Exception{               
                
            AccesoBD conexion = (AccesoBD)session.getAttribute("conexionAdmin");
            
            String dni = request.getParameter("dni");
            String name = request.getParameter("name"); 
            String eMail = request.getParameter("eMail");
            String universidad = request.getParameter("universidad");
            
            int idAeropuerto = Integer.parseInt(request.getParameter("aeropuerto"));
            Aeropuerto aeropuerto = AeropuertoSql.montarAeropuerto(conexion, idAeropuerto);
            
            String dniFijo = request.getParameter("tutor");
            Fijo fijo = TrabajadorSql.consultaFijo(dniFijo, conexion);
            
            
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date fecha = new java.sql.Date(format.parse(request.getParameter("fechaNacimiento")).getTime());
            Date fechaInicio = new java.sql.Date(format.parse(request.getParameter("fechaInicio")).getTime());
            Date fechaFin = new java.sql.Date(format.parse(request.getParameter("fechaFin")).getTime());
            
                   
            Becario becario = new Becario(dni, name, fecha, eMail, aeropuerto, universidad, fechaInicio, fechaFin, fijo );
            TrabajadorSql.insertaTrabajadorBecario(becario, conexion);
            
                irAPagina("/menuAdmin.jsp", response, request);

        }

}