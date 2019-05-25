<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page errorPage="pagError.jsp"%>
<%@ page import="modelo.Usuario"%>
<%@ page import="bd.AccesoBD"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="modelo.Aeropuerto"%>
<%@ page import="modelo.Noticia"%>
<%@ page import="modelo.Trayecto"%>
<%@ page import="modelo.Usuario"%>
<%@ page import="modelo.Venta"%>
<%@ page import="modeloSql.VentaSql"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Oregano" rel="stylesheet"/>
    </head>
    <body style="background-color: #F5F5F5">
        <%
    Usuario usuarioPagina = (Usuario)session.getAttribute("usuarioPagina");
    AccesoBD conexion = (AccesoBD)session.getAttribute("usuarioConexion");
    ArrayList<Venta> listaVentas = VentaSql.montarVentasUsuarios(conexion, usuarioPagina);
    
    %>
         
        <nav class="navbar navbar-fixed-top" style="background-color: white">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                            aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <div class="navbar-brand" style="font-family: 'Oregano', cursive; font-size: 20pt;">Panel de usuario</div>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="menuUsuario.jsp">Home</a>
                        </li>
            <li class="active">
              <a href="#trayectos">Ver trayectos comprados</a>
            </li>
          </ul>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" action="<%=request.getContextPath()%>/controlador" method="GET">
            Bienvenido <%=usuarioPagina.getUser()+" "%>
            <input type="hidden" name="accion" value="salirPanelUser"/>
            <input type="submit" name="Salir" value="Salir" class="btn btn-danger">
          </form>
                    <!--/.navbar-collapse -->
                </div>
                <!--/.nav-collapse -->
            </div>
        </nav>
         
        <br/><br/><br/><br/><br/><br/>
        <div class="col-sm-1"></div>
        <div class="col-sm-10">
            <table class="table table-hover">
                <tr>
                    <td>
                        <b>FECHA DEL VUELO</b>
                    </td>
                    <td>
                        <b>AEROPUERTO DE ORIGEN</b>
                    </td>
                    <td>
                        <b>AEROPUERTO DE DESTINO</b>
                    </td>
                    <td>
                        <b>DNI</b>
                    </td>
                    <td>
                        <b>VIAJERO</b>
                    </td>
                    <td>
                        <b></b>
                    </td>
                </tr>
                 
                <%
     for(int i=0;i<listaVentas.size(); i++){
            Venta venta = listaVentas.get(i);
             %><tr>
                    <td>
                        <%=venta.getTrayectosFijados().getFecha()%>
                    </td>
                    <td>
                        <%=venta.getTrayectosFijados().getTrayecto().getAeropuertoOrigen().getCiudad()%>
                    </td>
                    <td>
                        <%=venta.getTrayectosFijados().getTrayecto().getAeropuertoDestino().getCiudad()%>
                    </td>
                    <td>
                        <%=venta.getDni()%>
                    </td>
                    <td>
                        <%=venta.getNombre()%>
                    </td>
                    <td>
                        <center>
                            <form action="<%=request.getContextPath()%>/controlador" method="GET">
                                <input type="hidden" name="accion" value="imprimirBillete"/>
                                <input type="hidden" name="idVenta" value="<%=venta.getIdVenta()%>"/>
                                <input type="submit" name="imprimir" value="Imprimir el billete"
                                       class="btn btn-warning"/>
                            </form>
                        </center>
                    </td>
                </tr>
                 
                <%   
        }
    %>
            </table>
        </div>
        <div class="col-sm-1"></div>
    </body>
</html>