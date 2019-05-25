package gestion;

import bd.AccesoBD;


import java.io.IOException;

import java.sql.Date;

import java.util.ArrayList;

import java.util.Calendar;

import javax.servlet.ServletException;

import modelo.Aeropuerto;

import modelo.Noticia;
import modelo.Trayecto;

import modeloSql.AeropuertoSql;
import modeloSql.NoticiaSql;
import modeloSql.TrayectoSql;


public class AccionCrearNoticia extends Accion {
        
    public void inicio() throws  IOException, java.lang.Exception{               
            AccesoBD conexion = (AccesoBD)session.getAttribute("conexionAdmin");
            
            int idNoticia = NoticiaSql.obternerIdNoticia(conexion);
            String titulo = request.getParameter("titulo");
            String descripcion = request.getParameter("descripcion");
            java.sql.Date fechaNoticia = new java.sql.Date(Calendar.getInstance().getTime().getTime());
            
            Noticia noticia = new Noticia(idNoticia, titulo, descripcion, fechaNoticia);
            String sql = Noticia.crearNoticia(noticia);
            conexion.insert(sql);
            
            irAPagina("/menuAdmin.jsp", response, request);
        }

}