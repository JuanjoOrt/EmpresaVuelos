<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page errorPage="pagError.jsp"%>
<%@ page import="modelo.Usuario"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Oregano" rel="stylesheet">
        
    </head>
    <body  style="background-color: #F5F5F5">
    <%
    Usuario usuarioPagina = (Usuario)session.getAttribute("usuarioPagina"); 
    
    %>
    
    <nav class="navbar navbar-fixed-top"  style="background-color: white">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div  class="navbar-brand" style="font-family: 'Oregano', cursive; font-size: 20pt;">Panel de usuario</div>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="menuUsuario.jsp">Home</a></li>
            <li><a href="verTrayectosComprados.jsp">Ver trayectos comprados</a></li>
          </ul>
          
          <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" action="<%=request.getContextPath()%>/controlador" method="GET">
            Bienvenido <%=usuarioPagina.getUser()+" "%>
            <input type="hidden" name="accion" value="salirPanelUser"/>
            <input type="submit" name="Salir" value="Salir" class="btn btn-danger">
          </form>
          </div><!--/.navbar-collapse -->         
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    <br><br><br><br><br><br>
    
    <div class="col-sm-2"></div>
    <div class="col-sm-8">
        <h1>Panel de usuario</h1>
        <p class="lead">
        Bienvenido al panel de usuario, en este panel puedes gestionar los billetes de avion de cada viaje
        
        <a href="index.jsp">
        			<br><br><button type="button" class="btn btn-primary	">Volver</button></a>
        
        </p>
    <div class="col-sm-2"></div>



    
    
    </body>
</html>