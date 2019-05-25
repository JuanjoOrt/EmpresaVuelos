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

public class AccionCrearTrabajadorFijo extends Accion {
        
    public void inicio() throws ServletException, IOException, java.lang.Exception{               
                
            AccesoBD conexion = (AccesoBD)session.getAttribute("conexionAdmin");
            
            String dni = request.getParameter("dni");
            String name = request.getParameter("name"); 
            String eMail = request.getParameter("eMail");
            int salario = Integer.parseInt(request.getParameter("salario"));
            int idAeropuerto = Integer.parseInt(request.getParameter("aeropuerto"));
            Aeropuerto aeropuerto = AeropuertoSql.montarAeropuerto(conexion, idAeropuerto);
            
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date fecha = new java.sql.Date(format.parse(request.getParameter("fechaNacimiento")).getTime());
            ArrayList<Becario> listaBecarios = TrabajadorSql.becariosDeFijo(dni, conexion);
                   
            Fijo fijo = new Fijo(dni, name, fecha, eMail, aeropuerto, salario, listaBecarios );
            TrabajadorSql.insertaTrabajadorFijo(fijo, conexion);
            
                irAPagina("/menuAdmin.jsp", response, request);

        }

}