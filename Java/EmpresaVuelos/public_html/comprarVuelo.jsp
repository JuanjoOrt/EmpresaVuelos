<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="modelo.Trayecto"%>
<%@ page import="modelo.Aeropuerto"%>
<%@ page import="modelo.Avion"%>
<%@ page import="modelo.TrayectoFijado"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.util.ArrayList"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
    <br><br><br><br><br>
    <div class="col-sm-1"></div>
    <div class="col-sm-9">
     <%
    ArrayList<TrayectoFijado> listaTrayectosFijados = (ArrayList<TrayectoFijado>)session.getAttribute("listaTrayectosFijados"); 
    
    if (listaTrayectosFijados.size() == 0){
    %>
        <h1>No hay vuelos disponibles entre esos dos aeropuertos en esa fecha</h1>
    <%
    }else{
    %>
    <table class="table table-hover">
    <tr><td><b>FECHA DEL VUELO</b></td><td><b>AEROPUERTO DE SALIDA</b></td><td><b>AEROPUERTO DE LLEGADA</b></td><td><b>PRECIO POR BILLETE</b></td><td><b>AVIÓN</b></td></td><td><b>Nº ASIENTOS</b></td></td><td><b></b></td></tr>
    <%
     for(int i=0;i<listaTrayectosFijados.size(); i++){
                TrayectoFijado trayectoFijado = listaTrayectosFijados.get(i);
                Trayecto trayecto = trayectoFijado.getTrayecto();
                Aeropuerto aeropuertoOrigen = trayecto.getAeropuertoOrigen();
                Aeropuerto aeropuertoDestino = trayecto.getAeropuertoDestino();
                Avion avion = trayectoFijado.getAvion();
                
        %><tr>
            <td><%=trayectoFijado.getFecha()%></td>
            <td><%=aeropuertoOrigen.getCiudad()+" - "+aeropuertoOrigen.getCodigo()%></td>
            <td><%=aeropuertoDestino.getCiudad()+" - "+aeropuertoDestino.getCodigo()%></td>
            <td><%=trayectoFijado.getCoste()%></td>
            <td><%=avion.getModeloAvion()%></td>
            <td>
                <form action="<%=request.getContextPath()%>/controlador" method="GET">
                <select name="Asientos" class="form-control">
                <option value="1">1 Adulto</option>
                <option value="2">2 Adultos</option>
                <option value="3">3 Adultos</option>
                <option value="4">4 Adultos</option>
                <option value="5">5 Adultos</option>
                </select>
            </td>
            <td><b>
                
                <input type="hidden" name="accion" value="comprarTrayecto"/>
                <input type="hidden" name="idTrayectoFijado" value="<%= trayectoFijado.getIdTrayecto()%>"/>
                <input type="submit" name="comprar" value="Comprar" class="btn btn-success btn-md">
                </form>
            </b></td>
          </tr>
          
        
        <%
            }
        }
    %></table>
    
    
    
    
    
    </div>
    <div class="col-sm-1"></div>
</html>