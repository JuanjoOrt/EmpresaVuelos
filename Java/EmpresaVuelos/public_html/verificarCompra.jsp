<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="modelo.TrayectoFijado"%>
<%@ page import="modelo.Usuario"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
        Usuario usuarioPagina = (Usuario)session.getAttribute("usuarioPagina"); 
        int numeroAsientos = (int)session.getAttribute("numeroAsientos"); 
        TrayectoFijado TrayectoFijado = (TrayectoFijado)session.getAttribute("trayectoFijadoCompra");
        %>
        <center><h2>Compra del trayecto de <%=TrayectoFijado.getTrayecto().getAeropuertoOrigen().getCiudad()%>  a <%=TrayectoFijado.getTrayecto().getAeropuertoDestino().getCiudad()%></h2></center>
        <br><br><br>
        
        <div class="col-sm-1"></div>
        <div class="col-sm-10">
        <h3>Es importante especificar el DNI del pasajero o pasajeros del vuelo</h3>
        <br><br>
            <form action="<%=request.getContextPath()%>/controlador" method="GET">
            <%
                for(int i=1;i<=numeroAsientos; i++){
                %><h4><div class="col-md-3">DNI para el asiento Nº<%=i%> - </div></h4>
                <div class="col-md-3"><input type="text" name="dni<%=i%>" class="form-control" placeholder="Escribe el DNI"></div>
                <div class="col-md-2"><h4>Nombre del viajante</h4></div>
                <div class="col-md-3"><input type="text" name="nombre<%=i%>" class="form-control" placeholder="Escribe el nombre y apellidos"></div><br><br>
                <%
                }
            %>
            <input type="hidden" name="accion" value="confirmarCompra"/><br>
            <input type="submit" name="registrate" value="Comprar vuelo" class="btn btn-success btn-lg">
            </form>
        </div>
        <div class="col-sm-1"></div>
    </body>
</html>