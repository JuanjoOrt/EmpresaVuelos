<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page errorPage="pagError.jsp"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="modelo.Trayecto"%>
<%@ page import="bd.AccesoBD"%>
<%@ page import="modeloSql.TrayectoFijadoSql"%>
<%@ page import="modelo.TrayectoFijado"%>
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
    String usuario = (String)session.getAttribute("usuarioAdmin");
    int numeroTotalVentas = (int)session.getAttribute("numeroTotalVentas");
    ArrayList<Trayecto> listaTrayectos = (ArrayList<Trayecto>)session.getAttribute("listaTrayectos");
    AccesoBD conexion = (AccesoBD)session.getAttribute("conexionAdmin");
    int porcentaje = 0;
    
    
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
            <li><a href="<%=request.getContextPath()%>/controlador?accion=accionVerUsuarios">Gestion usuarios</a></li>
            <li><a href="<%=request.getContextPath()%>/controlador?accion=accionAsignarNuevoTrayecto">Asignar nuevo trayecto</a></li>
            <li class="active"><a href="#">Ver trayectos más vendidos</a></li>
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
    <br><br><br><br>
    
    <div class="col-sm-1"></div>
    <div class="col-sm-10">
    <h1>Estadistica de las rutas aereas mas utilizadas</h1><br>
    <table class="table table-striped">
                <tr>
                    <td>
                        <b>Aeropuerto de Origen</b>
                    </td>
                    <td>
                        <b>Aeropuerto de Destino</b>
                    </td>
                    <td>
                        <b>Veces/Total</b>
                    </td>
                    <td width='60%'>
                        <b></b>
                    </td>
                </tr>
                <tr>
                <%
                for(int i=0;i<listaTrayectos.size(); i++){
                    Trayecto trayecto = listaTrayectos.get(i);
                    int numeroVentas = TrayectoFijadoSql.numeroVentasPorTrayecto(conexion, trayecto);
                    porcentaje = (numeroVentas * 100) / numeroTotalVentas;
                    
                    %><td><%=trayecto.getAeropuertoOrigen().getCiudad()%></td><%
                    %><td><%=trayecto.getAeropuertoDestino().getCiudad()%></td><%
                    %><td><h4><kbd style="background-color: #80E0FF; color: #000000;"><%=numeroVentas%>/<%=numeroTotalVentas%>
                            </kbd></h4></td><td>
                    <%=
                    "<div class='progress'>"+
                    "<div class='progress-bar progress-bar-striped active' role='progressbar' "+
                        "aria-valuenow='40' aria-valuemin='0' aria-valuemax='100'"+
                        "style='width:"+porcentaje+"%'>"+
                        ""+porcentaje+ "% de ventas"+
                        "</div>"
                    %>
                    </td></tr><%
                    }
                %>
                </tr>
    </div>
    <div class="col-sm-1"></div>



    
    
    </body>
</html>