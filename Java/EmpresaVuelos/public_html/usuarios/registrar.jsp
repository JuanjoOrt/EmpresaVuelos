<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="bd.AccesoBD"%>
<%@ page import="modelo.Aeropuerto"%>
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
    <br><br><br><br><br><br>
    <div class="col-sm-4"></div>
    <div class="col-sm-4" style="background-color: #D6D6D6" >
    <center><h1>Crea una nueva cuenta</h1></center>
    <br><br>
   
        <form class="form-signin" action="<%=request.getContextPath()%>/controlador" method="GET">
        <input type="text" name="user" class="form-control" placeholder="Usuario">
        <input type="password" name="pass" class="form-control" placeholder="Contraseña">
        <input type="text" name="name" class="form-control" placeholder="Nombre y apellidos">
        <input type="email" name="eMail" class="form-control" placeholder="Correo Electronico">
        <input type="text" name="paisNacimiento" class="form-control" placeholder="Nacionalidad"><br>
        <h4>Fecha de nacimiento</h4>
            <input class="form-control" type="date"  name="fechaNacimiento" placeholder="Fecha de nacimiento">
        <input type="hidden" name="accion" value="accionRegistrate"/><br>
        <input type="submit" name="registrate" value="Registrate" class="btn btn-warning btn-lg"><br><br>
        
        
        </form>
    </div>
    <div class="col-sm-4"></div>
    </body>
</html>