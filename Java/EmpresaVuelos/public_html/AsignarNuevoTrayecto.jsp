<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page errorPage="pagError.jsp"%>
<%@ page import="modelo.Aeropuerto"%>
<%@ page import="modelo.Trayecto"%>
<%@ page import="modelo.Avion"%>
<%@ page import="modeloSql.AeropuertoSql"%>
<%@ page import="java.util.ArrayList"%>
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
    
    ArrayList<Aeropuerto> listaAeropuertos = (ArrayList<Aeropuerto>)session.getAttribute("listaAeropuertos");
    Aeropuerto aeropuertoOrigenFI = (Aeropuerto)session.getAttribute("aeropuertoOrigenFI");
    
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
            <li class="active"><a href="#">Home</a></li>
            <li><a href="<%=request.getContextPath()%>/controlador?accion=accionNoticias">Noticias</a></li>
            <li><a href="<%=request.getContextPath()%>/controlador?accion=accionVerEmpleados">Ver empleados</a></li>
            <li><a href="<%=request.getContextPath()%>/controlador?accion=accionVerUsuarios">Gestion usuarios</a></li>
            <li class="active"><a href="#">Asignar nuevo trayecto</a></li>
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
    <div class="col-sm-10">
        <div class="col-sm-6" style="background-color: #D6D6D6">
        <%if (aeropuertoOrigenFI == null ){
        %>
        <h1>¿Cual es el Aeropuerto de Origen?</h1>
        <form class="form-signin" action="<%=request.getContextPath()%>/controlador" method="GET">
        <select name="idAeropuerto" class="form-control">
                    <%
                    for(int i=0;i<listaAeropuertos.size(); i++){
                    Aeropuerto aeropuerto = listaAeropuertos.get(i);
                    %><%=
                        "<option value="+aeropuerto.getIdAeropuerto()+">"+aeropuerto.getCiudad()+"</option>"
                    %><%
                    }
                            
                    %> 
            </select>  <br>
        <input type="hidden" name="accion" value="elegirPrimerAeropuerto"/><br>
        <center><input type="submit" name="SiguientePaso" value="Siguiente paso" class="btn btn-success"></center><br>
        </form>
        <%
        
        
        }else{
        ArrayList<Trayecto> listaTrayectos = (ArrayList<Trayecto>)session.getAttribute("listaTrayectos"); 
        ArrayList<Avion> listaAviones = (ArrayList<Avion>)session.getAttribute("listaAviones"); 
        %>
        <h1>Elige ciudad destino, fecha, avión y coste del viaje</h1>
                        <form action="<%=request.getContextPath()%>/controlador" method="GET">
                            <select name="aeropuertoDestino" class="form-control">
                             <%
                                for(int x=0;x<listaTrayectos.size(); x++){
                                    Trayecto trayectoL = listaTrayectos.get(x);
                                    Aeropuerto aeropuertoDestinoL = trayectoL.getAeropuertoDestino();
                                    %><%=
                                        "<option value="+aeropuertoDestinoL.getIdAeropuerto()+">"+aeropuertoDestinoL.getCiudad()+"</option>"
                                    %><%
                                 }
                            
                            %> 
                            </select>
        <br>
        <h3>Precio del billete</h3>
        <input type="text"  name="precio" class="form-control">
        
        <h3>Fecha del viaje</h3>
        <input type="date"  name="fecha" class="form-control"><br>
        
        <h3>Que avión va ha realizar el vuelo</h3>
        <select name="avion" class="form-control">
        <%
                for(int i=0;i<listaAviones.size(); i++){
                    Avion avion = listaAviones.get(i);
                    %><%=
                        "<option value="+avion.getIdAvion()+">"+avion.getIdAvion()+"  -  "+avion.getModeloAvion()+ "</option>"
                    %><%
                 }
                
                %>
        </select>
        
        
        <input type="hidden" name="accion" value="FijarTrayectoNuevo"/><br><center>
        <input type="submit" name="Entrar" value="Fijar Trayecto" class="btn btn-success"></center><br><br>
        </form>
        
        <%
        }
        %>
    </div>
    </div><div class="col-sm-2"></div>



    
    
    </body>
</html>