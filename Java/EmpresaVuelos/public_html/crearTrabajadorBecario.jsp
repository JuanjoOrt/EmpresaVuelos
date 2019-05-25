<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="bd.AccesoBD"%>
<%@ page import="modelo.Aeropuerto"%>
<%@ page import="modelo.Fijo"%>
<%@ page import="modeloSql.TrabajadorSql"%>
<%@ page import="modeloSql.AeropuertoSql"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
    </head>
    <body style="background-color: #F5F5F5">
    <%
    AccesoBD conexion = (AccesoBD)session.getAttribute("conexionAdmin");
    
    ArrayList<Aeropuerto> listaAeropuertos = AeropuertoSql.listaAeropuertos(conexion);
    ArrayList<Fijo> listaFijos = TrabajadorSql.listaFijos(conexion);
    
    %>
    
    <br><br>
    <div class="col-sm-4"></div>
    <div class="col-sm-4" style="background-color: #D6D6D6" >
    <center><h1>Crea un nuevo trabajador Becario</h1></center>
    <br>
   
        <form class="form-signin" action="<%=request.getContextPath()%>/controlador" method="GET">
        <input type="text" name="dni" class="form-control" placeholder="Escriba aqui su DNI">
        <input type="text" name="name" class="form-control" placeholder="Nombre y apellidos">       
        <input type="email" name="eMail" class="form-control" placeholder="Correo Electronico">
        <input type="text" name="universidad" class="form-control" placeholder="Universidad"> 
        
        <h4>Fecha de nacimiento</h4>
          <input class="form-control" type="date"  name="fechaNacimiento" placeholder="Fecha de nacimiento">
        
        <h4>�En que aeropuerto va a trabajar?</h4>
        <select name="aeropuerto" class="form-control">
                <%
                for(int i=0;i<listaAeropuertos.size(); i++){
                Aeropuerto aeropuerto = listaAeropuertos.get(i);
                %><%=
                    "<option value="+aeropuerto.getIdAeropuerto()+">"+aeropuerto.getNombreAeropuerto()+" ("+aeropuerto.getCodigo()+")"+"</option>"
                %><%
                }
                        
                %> 
        </select>  <br>
        
        <h4>�Quien va a ser su tutor?</h4>
        <select name="tutor" class="form-control">
                <%
                for(int i=0;i<listaFijos.size(); i++){
                Fijo fijo = listaFijos.get(i);
                %><%=
                    "<option value="+fijo.getDni()+">"+fijo.getNombre()+"</option>"
                %><%
                }
                        
                %> 
        </select>  <br>
        <div class="col-sm-6">
        Fecha Inicio
        <input class="form-control" type="date"  name="fechaInicio" placeholder="Fecha de nacimiento">
        </div>
        
        <div class="col-sm-6">
        Fecha Fin
        <input class="form-control" type="date"  name="fechaFin" placeholder="Fecha de nacimiento">
        </div><br>  <br><br>
          
        
        <input type="hidden" name="accion" value="accionCrearTrabajadorBecario"/><br>
        <center><input type="submit" name="contratar" value="Contratar trabajador" class="btn btn-success btn-lg"><br><br></center>
        
        
        </form>
    </div>
    <div class="col-sm-4"></div>
    </body>
</html>