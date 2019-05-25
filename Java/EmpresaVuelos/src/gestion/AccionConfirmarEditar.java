package gestion;

import bd.AccesoBD;


import java.io.IOException;

import java.sql.Date;

import java.util.ArrayList;

import javax.servlet.ServletException;

import modelo.Aeropuerto;

import modelo.Noticia;
import modelo.Trayecto;

import modeloSql.AeropuertoSql;
import modeloSql.NoticiaSql;
import modeloSql.TrayectoSql;


public class AccionConfirmarEditar extends Accion {
        
    public void inicio() throws  IOException, java.lang.Exception{               
            AccesoBD conexion = (AccesoBD)session.getAttribute("conexionAdmin");
            Noticia noticia = (Noticia)session.getAttribute("editarNoticia");
            
            int idNoticia = noticia.getIdNoticia();
            String titulo = noticia.getTitulo();
            String descripcion = request.getParameter("descripcion");
            Date fechaNoticia = noticia.getFechaNoticia();
            
            Noticia nuevaNoticia = new Noticia(idNoticia, titulo, descripcion, fechaNoticia);
            NoticiaSql.cambiarDescripcion(conexion, nuevaNoticia);
            
            irAPagina("/noticias.jsp", response, request);
        }

}