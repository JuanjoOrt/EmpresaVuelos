<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page errorPage="pagError.jsp"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="modelo.Usuario"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Oregano" rel="stylesheet">
        
    </head>
    <body>
    <%
    ArrayList<Usuario> listaUsuarios = (ArrayList<Usuario>)session.getAttribute("listaUsuarios");
    
    %>
    
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#"><div style="font-family: 'Oregano', cursive; font-size: 20pt;">Panel de administración</div></a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="./menuAdmin.jsp">Home</a></li>
            <li><a href="<%=request.getContextPath()%>/controlador?accion=accionNoticias">Noticias</a></li>
            <li><a href="<%=request.getContextPath()%>/controlador?accion=accionVerEmpleados">Ver empleados</a></li>
            <li class="active"><a href="#">Gestion usuarios</a></li>
            <li><a href="<%=request.getContextPath()%>/controlador?accion=accionAsignarNuevoTrayecto">Asignar nuevo trayecto</a></li>
            <li><a href="<%=request.getContextPath()%>/controlador?accion=accionVerEstadistica">Ver trayectos más vendidos</a></li>
          </ul>
          
          <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" action="<%=request.getContextPath()%>/controlador" method="GET">
            <input type="hidden" name="accion" value="salirPanelAdmin"/>
            <input type="submit" name="Salir" value="Salir" class="btn btn-danger">
          </form>
          </div><!--/.navbar-collapse -->         
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    <br><br><br><br><br><br>
    
    <div class="col-sm-2"></div>
    <div class="col-sm-8">
        <h1>Usuarios de la aplicación</h1>
        <table  class="table"> 
        <tr><td><b>Usuario</b></td><td><b>Contraseña</b></td><td><b>Nombre del usuario</b></td><td><b>E-Mail</b></td></tr>
        
        <%
            for(int i=0;i<listaUsuarios.size(); i++){
            Usuario usuario = listaUsuarios.get(i);
        %><tr>
        <td><%=usuario.getUser()%></td>
        <td><%=usuario.getPass()%></td>
        <td><%=usuario.getNombre()%></td>
        <td><%=usuario.getEMail()%></td>
        
        </tr><%
            }
        %>
        </table>
        <div class="col-sm-2"></div>



    
    
    </body>
</html>